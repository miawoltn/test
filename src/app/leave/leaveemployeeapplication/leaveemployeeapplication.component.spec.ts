
    import { async, ComponentFixture, TestBed } from '@angular/core/testing';

import { LeaveemployeeapplicationComponent } from './leaveemployeeapplication.component';

describe('LeaveemployeeapplicationComponent', () => {
  let component: LeaveemployeeapplicationComponent;
  let fixture: ComponentFixture<LeaveemployeeapplicationComponent>;

  beforeEach(async(() => {
    TestBed.configureTestingModule({
      declarations: [ LeaveemployeeapplicationComponent ]
    })
    .compileComponents();
  }));

  beforeEach(() => {
    fixture = TestBed.createComponent(LeaveemployeeapplicationComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});

