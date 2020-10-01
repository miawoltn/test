
    import { async, ComponentFixture, TestBed } from '@angular/core/testing';

import { PayrollgenerateddetailComponent } from './payrollgenerateddetail.component';

describe('PayrollgenerateddetailComponent', () => {
  let component: PayrollgenerateddetailComponent;
  let fixture: ComponentFixture<PayrollgenerateddetailComponent>;

  beforeEach(async(() => {
    TestBed.configureTestingModule({
      declarations: [ PayrollgenerateddetailComponent ]
    })
    .compileComponents();
  }));

  beforeEach(() => {
    fixture = TestBed.createComponent(PayrollgenerateddetailComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});

