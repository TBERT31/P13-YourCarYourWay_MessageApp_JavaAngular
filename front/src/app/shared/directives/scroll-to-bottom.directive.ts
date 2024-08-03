import { Directive, ElementRef, AfterViewInit, Input } from '@angular/core';

@Directive({
  selector: '[scrollToBottom]'
})
export class ScrollToBottomDirective implements AfterViewInit {
  constructor(private _el: ElementRef) {}

  @Input() messages!: any[];

  ngAfterViewInit() {
    this.scrollToBottom();
  }

  ngOnChanges() {
    this.scrollToBottom();
  }

  public scrollToBottom(): void {
    const el: HTMLElement = this._el.nativeElement;
    setTimeout(() => el.scrollTop = el.scrollHeight, 0);
  }
}
