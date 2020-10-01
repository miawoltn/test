
    import { async, ComponentFixture, TestBed } from '@angular/core/testing';

import { LoanrepaymentsourceComponent } from './loanrepaymentsource.component';

describe('LoanrepaymentsourceComponent', () => {
  let component: LoanrepaymentsourceComponent;
  let fixture: ComponentFixture<LoanrepaymentsourceComponent>;

  beforeEach(async(() => {
    TestBed.configureTestingModule({
      declarations: [ LoanrepaymentsourceComponent ]
    })
    .compileComponents();
  }));

  beforeEach(() => {
    fixture = TestBed.createComponent(LoanrepaymentsourceComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});

