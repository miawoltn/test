
    import { async, ComponentFixture, TestBed } from '@angular/core/testing';

import { PaymenttrancheComponent } from './paymenttranche.component';

describe('PaymenttrancheComponent', () => {
  let component: PaymenttrancheComponent;
  let fixture: ComponentFixture<PaymenttrancheComponent>;

  beforeEach(async(() => {
    TestBed.configureTestingModule({
      declarations: [ PaymenttrancheComponent ]
    })
    .compileComponents();
  }));

  beforeEach(() => {
    fixture = TestBed.createComponent(PaymenttrancheComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});

