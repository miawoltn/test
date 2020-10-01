import { async, ComponentFixture, TestBed } from '@angular/core/testing';

import { Action_detailsComponent } from './action_details.component';

describe('Action_detailsComponent', () => {
  let component: Action_detailsComponent;
  let fixture: ComponentFixture<Action_detailsComponent>;

  beforeEach(async(() => {
    TestBed.configureTestingModule({
      declarations: [ Action_detailsComponent ]
    })
    .compileComponents();
  }));

  beforeEach(() => {
    fixture = TestBed.createComponent(Action_detailsComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});

