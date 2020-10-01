import { async, ComponentFixture, TestBed } from '@angular/core/testing';

import { LoanChart2Component } from './loan-chart2.component';

describe('LoanChart2Component', () => {
  let component: LoanChart2Component;
  let fixture: ComponentFixture<LoanChart2Component>;

  beforeEach(async(() => {
    TestBed.configureTestingModule({
      declarations: [ LoanChart2Component ]
    })
    .compileComponents();
  }));

  beforeEach(() => {
    fixture = TestBed.createComponent(LoanChart2Component);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
