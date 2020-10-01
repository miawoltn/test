
    import { async, ComponentFixture, TestBed } from '@angular/core/testing';

import { PayrollgeneratedComponent } from './payrollgenerated.component';

describe('PayrollgeneratedComponent', () => {
  let component: PayrollgeneratedComponent;
  let fixture: ComponentFixture<PayrollgeneratedComponent>;

  beforeEach(async(() => {
    TestBed.configureTestingModule({
      declarations: [ PayrollgeneratedComponent ]
    })
    .compileComponents();
  }));

  beforeEach(() => {
    fixture = TestBed.createComponent(PayrollgeneratedComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});

