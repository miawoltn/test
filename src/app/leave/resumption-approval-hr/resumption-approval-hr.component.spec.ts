import { async, ComponentFixture, TestBed } from '@angular/core/testing';

import { ResumptionApprovalHrComponent } from './resumption-approval-hr.component';

describe('ResumptionApprovalHrComponent', () => {
  let component: ResumptionApprovalHrComponent;
  let fixture: ComponentFixture<ResumptionApprovalHrComponent>;

  beforeEach(async(() => {
    TestBed.configureTestingModule({
      declarations: [ ResumptionApprovalHrComponent ]
    })
    .compileComponents();
  }));

  beforeEach(() => {
    fixture = TestBed.createComponent(ResumptionApprovalHrComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
