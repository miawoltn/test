import { async, ComponentFixture, TestBed } from '@angular/core/testing';

import { BatchPayslipComponent } from './batch-payslip.component';

describe('BatchPayslipComponent', () => {
  let component: BatchPayslipComponent;
  let fixture: ComponentFixture<BatchPayslipComponent>;

  beforeEach(async(() => {
    TestBed.configureTestingModule({
      declarations: [ BatchPayslipComponent ]
    })
    .compileComponents();
  }));

  beforeEach(() => {
    fixture = TestBed.createComponent(BatchPayslipComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
