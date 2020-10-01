
    import { async, ComponentFixture, TestBed } from '@angular/core/testing';

import { PayrollledgerComponent } from './payrollledger.component';

describe('PayrollledgerComponent', () => {
  let component: PayrollledgerComponent;
  let fixture: ComponentFixture<PayrollledgerComponent>;

  beforeEach(async(() => {
    TestBed.configureTestingModule({
      declarations: [ PayrollledgerComponent ]
    })
    .compileComponents();
  }));

  beforeEach(() => {
    fixture = TestBed.createComponent(PayrollledgerComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});

