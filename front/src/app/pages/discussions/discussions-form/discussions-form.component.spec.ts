import { ComponentFixture, TestBed } from '@angular/core/testing';

import { DiscussionsFormComponent } from './discussions-form.component';

describe('DiscussionsFormComponent', () => {
  let component: DiscussionsFormComponent;
  let fixture: ComponentFixture<DiscussionsFormComponent>;

  beforeEach(() => {
    TestBed.configureTestingModule({
      declarations: [DiscussionsFormComponent]
    });
    fixture = TestBed.createComponent(DiscussionsFormComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
