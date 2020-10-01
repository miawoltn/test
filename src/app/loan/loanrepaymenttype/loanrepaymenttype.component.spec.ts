
    import { async, ComponentFixture, TestBed } from '@angular/core/testing';

import { LoanrepaymenttypeComponent } from './loanrepaymenttype.component';

describe('LoanrepaymenttypeComponent', () => {
  let component: LoanrepaymenttypeComponent;
  let fixture: ComponentFixture<LoanrepaymenttypeComponent>;

  beforeEach(async(() => {
    TestBed.configureTestingModule({
      declarations: [ LoanrepaymenttypeComponent ]
    })
    .compileComponents();
  }));

  beforeEach(() => {
    fixture = TestBed.createComponent(LoanrepaymenttypeComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});

