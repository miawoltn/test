
    import { async, ComponentFixture, TestBed } from '@angular/core/testing';

import { EmployeeguarantorComponent } from './employeeguarantor.component';

describe('EmployeeguarantorComponent', () => {
  let component: EmployeeguarantorComponent;
  let fixture: ComponentFixture<EmployeeguarantorComponent>;

  beforeEach(async(() => {
    TestBed.configureTestingModule({
      declarations: [ EmployeeguarantorComponent ]
    })
    .compileComponents();
  }));

  beforeEach(() => {
    fixture = TestBed.createComponent(EmployeeguarantorComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});

