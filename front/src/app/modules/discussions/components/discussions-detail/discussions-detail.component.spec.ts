import { ComponentFixture, TestBed } from '@angular/core/testing';

import { DiscussionsDetailComponent } from './discussions-detail.component';

describe('DiscussionsDetailComponent', () => {
  let component: DiscussionsDetailComponent;
  let fixture: ComponentFixture<DiscussionsDetailComponent>;

  beforeEach(() => {
    TestBed.configureTestingModule({
      declarations: [DiscussionsDetailComponent]
    });
    fixture = TestBed.createComponent(DiscussionsDetailComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
