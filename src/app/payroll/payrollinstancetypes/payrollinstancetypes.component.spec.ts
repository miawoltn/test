
    import { async, ComponentFixture, TestBed } from '@angular/core/testing';

import { PayrollinstancetypesComponent } from './payrollinstancetypes.component';

describe('PayrollinstancetypesComponent', () => {
  let component: PayrollinstancetypesComponent;
  let fixture: ComponentFixture<PayrollinstancetypesComponent>;

  beforeEach(async(() => {
    TestBed.configureTestingModule({
      declarations: [ PayrollinstancetypesComponent ]
    })
    .compileComponents();
  }));

  beforeEach(() => {
    fixture = TestBed.createComponent(PayrollinstancetypesComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});

