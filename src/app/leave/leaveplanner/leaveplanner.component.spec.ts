
    import { async, ComponentFixture, TestBed } from '@angular/core/testing';

import { LeaveplannerComponent } from './leaveplanner.component';

describe('LeaveplannerComponent', () => {
  let component: LeaveplannerComponent;
  let fixture: ComponentFixture<LeaveplannerComponent>;

  beforeEach(async(() => {
    TestBed.configureTestingModule({
      declarations: [ LeaveplannerComponent ]
    })
    .compileComponents();
  }));

  beforeEach(() => {
    fixture = TestBed.createComponent(LeaveplannerComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});

