
    import { async, ComponentFixture, TestBed } from '@angular/core/testing';

import { PayrollperiodComponent } from './payrollperiod.component';

describe('PayrollperiodComponent', () => {
  let component: PayrollperiodComponent;
  let fixture: ComponentFixture<PayrollperiodComponent>;

  beforeEach(async(() => {
    TestBed.configureTestingModule({
      declarations: [ PayrollperiodComponent ]
    })
    .compileComponents();
  }));

  beforeEach(() => {
    fixture = TestBed.createComponent(PayrollperiodComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});

