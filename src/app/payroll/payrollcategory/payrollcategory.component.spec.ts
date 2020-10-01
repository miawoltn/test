
    import { async, ComponentFixture, TestBed } from '@angular/core/testing';

import { PayrollcategoryComponent } from './payrollcategory.component';

describe('PayrollcategoryComponent', () => {
  let component: PayrollcategoryComponent;
  let fixture: ComponentFixture<PayrollcategoryComponent>;

  beforeEach(async(() => {
    TestBed.configureTestingModule({
      declarations: [ PayrollcategoryComponent ]
    })
    .compileComponents();
  }));

  beforeEach(() => {
    fixture = TestBed.createComponent(PayrollcategoryComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});

