
    import { async, ComponentFixture, TestBed } from '@angular/core/testing';

import { LeaveresumptionComponent } from './leaveresumption.component';

describe('LeaveresumptionComponent', () => {
  let component: LeaveresumptionComponent;
  let fixture: ComponentFixture<LeaveresumptionComponent>;

  beforeEach(async(() => {
    TestBed.configureTestingModule({
      declarations: [ LeaveresumptionComponent ]
    })
    .compileComponents();
  }));

  beforeEach(() => {
    fixture = TestBed.createComponent(LeaveresumptionComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});

