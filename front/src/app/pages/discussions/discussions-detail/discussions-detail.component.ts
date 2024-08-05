import {
  Component,
  OnDestroy,
  OnInit,
  ViewChild,
  ElementRef,
  AfterViewInit,
  AfterViewChecked
} from '@angular/core';
import { FormBuilder, FormGroup, Validators } from '@angular/forms';
import { MatSnackBar } from '@angular/material/snack-bar';
import { ActivatedRoute } from '@angular/router';
import { Observable, Subscription } from 'rxjs';
import { Discussion } from 'src/app/core/interfaces/discussions.interface';
import { Message } from 'src/app/core/interfaces/messages.interface';
import { DiscussionsService } from 'src/app/core/services/discussions.service';
import { MessagesService } from 'src/app/core/services/messages.service';
import { SessionService } from 'src/app/core/services/session.service';

@Component({
  selector: 'app-discussions-detail',
  templateUrl: './discussions-detail.component.html',
  styleUrls: ['./discussions-detail.component.scss'],
})
export class DiscussionsDetailComponent implements OnInit, OnDestroy, AfterViewInit, AfterViewChecked {
  public messageForm!: FormGroup;
  public discussion: Discussion | undefined;
  public userEmail: string | undefined;
  public messages$: Observable<Message[]> | undefined;
  private subscriptions: Subscription = new Subscription();

  @ViewChild('scrollContainer') private scrollContainer!: ElementRef;
  @ViewChild('anchor') private anchor!: ElementRef;

  constructor(
    private route: ActivatedRoute,
    private fb: FormBuilder,
    private messagesService: MessagesService,
    private discussionsService: DiscussionsService,
    private sessionService: SessionService,
    private matSnackBar: MatSnackBar
  ) {
    this.initMessageForm();
  }

  ngOnInit(): void {
    const id = +this.route.snapshot.paramMap.get('id')!;

    const session = this.sessionService.getSession();
    if (session) {
      this.userEmail = session.email;
    }

    const discussionSubscription = this.discussionsService
      .getDiscussionById(id)
      .subscribe((discussion: Discussion) => {
        this.discussion = discussion;
        this.loadMessages();
      });

    this.subscriptions.add(discussionSubscription);
  }

  ngAfterViewInit(): void {
    this.scrollToBottom();
  }

  ngAfterViewChecked(): void {
    this.scrollToBottom();
  }

  ngOnDestroy(): void {
    this.subscriptions.unsubscribe();
  }

  private initMessageForm(): void {
    this.messageForm = this.fb.group({
      message: [
        '',
        [Validators.required, Validators.minLength(5), Validators.maxLength(2000)],
      ],
    });
  }

  private loadMessages(): void {
    if (this.discussion) {
      this.messages$ = this.messagesService.getMessagesByDiscussionId(this.discussion.id);
      const messageSub = this.messages$.subscribe(() => {
        this.scrollToBottom();
      });

      this.subscriptions.add(messageSub);
    }
  }

  public sendMessage(): void {
    if (this.discussion && this.userEmail) {
      const message = {
        id: 0,
        discussion_id: this.discussion.id,
        author: this.userEmail,
        content: this.messageForm.value.message,
        direct: true,
      } as Message;

      const newMessageSub = this.messagesService.createMessage(message).subscribe(
        (messageResponse: Message) => {
          this.initMessageForm();
          this.matSnackBar.open('Votre commentaire a été envoyé!', 'Close', {
            duration: 3000,
          });
          this.loadMessages();
        }
      );

      this.subscriptions.add(newMessageSub);
    }
  }

  public getStatusClass(status: string): string {
    switch (status) {
      case 'New':
        return 'status-new';
      case 'In Progress':
        return 'status-in-progress';
      case 'Closed':
        return 'status-closed';
      default:
        return '';
    }
  }

  public back(): void {
    window.history.back();
  }

  private scrollToBottom(): void {
    if (this.anchor && this.anchor.nativeElement) {
      try {
        this.anchor.nativeElement.scrollIntoView({ behavior: 'smooth' });
      } catch (err) {
        console.error('Scroll to bottom failed', err);
      }
    }
  }
}
