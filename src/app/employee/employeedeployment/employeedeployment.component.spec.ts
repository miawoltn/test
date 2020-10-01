
    import { async, ComponentFixture, TestBed } from '@angular/core/testing';

import { EmployeedeploymentComponent } from './employeedeployment.component';

describe('EmployeedeploymentComponent', () => {
  let component: EmployeedeploymentComponent;
  let fixture: ComponentFixture<EmployeedeploymentComponent>;

  beforeEach(async(() => {
    TestBed.configureTestingModule({
      declarations: [ EmployeedeploymentComponent ]
    })
    .compileComponents();
  }));

  beforeEach(() => {
    fixture = TestBed.createComponent(EmployeedeploymentComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});

