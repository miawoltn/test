
    import { async, ComponentFixture, TestBed } from '@angular/core/testing';

import { EmployeesanctionComponent } from './employeesanction.component';

describe('EmployeesanctionComponent', () => {
  let component: EmployeesanctionComponent;
  let fixture: ComponentFixture<EmployeesanctionComponent>;

  beforeEach(async(() => {
    TestBed.configureTestingModule({
      declarations: [ EmployeesanctionComponent ]
    })
    .compileComponents();
  }));

  beforeEach(() => {
    fixture = TestBed.createComponent(EmployeesanctionComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});

