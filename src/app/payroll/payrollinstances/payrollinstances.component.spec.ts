
    import { async, ComponentFixture, TestBed } from '@angular/core/testing';

import { PayrollinstancesComponent } from './payrollinstances.component';

describe('PayrollinstancesComponent', () => {
  let component: PayrollinstancesComponent;
  let fixture: ComponentFixture<PayrollinstancesComponent>;

  beforeEach(async(() => {
    TestBed.configureTestingModule({
      declarations: [ PayrollinstancesComponent ]
    })
    .compileComponents();
  }));

  beforeEach(() => {
    fixture = TestBed.createComponent(PayrollinstancesComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});

