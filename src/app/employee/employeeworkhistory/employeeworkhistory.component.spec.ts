import { async, ComponentFixture, TestBed } from '@angular/core/testing';

import { EmployeeworkhistoryComponent } from './employeeworkhistory.component';

describe('EmployeeworkhistoryComponent', () => {
  let component: EmployeeworkhistoryComponent;
  let fixture: ComponentFixture<EmployeeworkhistoryComponent>;

  beforeEach(async(() => {
    TestBed.configureTestingModule({
      declarations: [ EmployeeworkhistoryComponent ]
    })
    .compileComponents();
  }));

  beforeEach(() => {
    fixture = TestBed.createComponent(EmployeeworkhistoryComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});

