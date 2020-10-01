import { async, ComponentFixture, TestBed } from '@angular/core/testing';

import { CancelPayrollComponent } from './cancel-payroll.component';

describe('CancelPayrollComponent', () => {
  let component: CancelPayrollComponent;
  let fixture: ComponentFixture<CancelPayrollComponent>;

  beforeEach(async(() => {
    TestBed.configureTestingModule({
      declarations: [ CancelPayrollComponent ]
    })
    .compileComponents();
  }));

  beforeEach(() => {
    fixture = TestBed.createComponent(CancelPayrollComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
