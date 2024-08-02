import { Component, OnDestroy, OnInit } from '@angular/core';
import { Observable } from 'rxjs';
import { Discussion } from 'src/app/core/interfaces/discussions.interface';

@Component({
  selector: 'app-discussions-list',
  templateUrl: './discussions-list.component.html',
  styleUrls: ['./discussions-list.component.scss']
})
export class DiscussionsListComponent implements OnInit, OnDestroy {
  public discussions$: Observable<Discussion[]> | undefined;

  constructor(
    
  ) {}

  ngOnInit(): void {
    this.loadDiscussions(); 
  }

  ngOnDestroy():void {

  }

  private loadDiscussions(): void {

  }
}
