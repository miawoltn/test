
    import { async, ComponentFixture, TestBed } from '@angular/core/testing';

import { LeaveapplicationsetupComponent } from './leaveapplicationsetup.component';

describe('LeaveapplicationsetupComponent', () => {
  let component: LeaveapplicationsetupComponent;
  let fixture: ComponentFixture<LeaveapplicationsetupComponent>;

  beforeEach(async(() => {
    TestBed.configureTestingModule({
      declarations: [ LeaveapplicationsetupComponent ]
    })
    .compileComponents();
  }));

  beforeEach(() => {
    fixture = TestBed.createComponent(LeaveapplicationsetupComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});

