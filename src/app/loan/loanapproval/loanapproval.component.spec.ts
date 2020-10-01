
    import { async, ComponentFixture, TestBed } from '@angular/core/testing';

import { LoanapprovalComponent } from './loanapproval.component';

describe('LoanapprovalComponent', () => {
  let component: LoanapprovalComponent;
  let fixture: ComponentFixture<LoanapprovalComponent>;

  beforeEach(async(() => {
    TestBed.configureTestingModule({
      declarations: [ LoanapprovalComponent ]
    })
    .compileComponents();
  }));

  beforeEach(() => {
    fixture = TestBed.createComponent(LoanapprovalComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});

