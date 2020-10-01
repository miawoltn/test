
    import { async, ComponentFixture, TestBed } from '@angular/core/testing';

import { EmployeerewardComponent } from './employeereward.component';

describe('EmployeerewardComponent', () => {
  let component: EmployeerewardComponent;
  let fixture: ComponentFixture<EmployeerewardComponent>;

  beforeEach(async(() => {
    TestBed.configureTestingModule({
      declarations: [ EmployeerewardComponent ]
    })
    .compileComponents();
  }));

  beforeEach(() => {
    fixture = TestBed.createComponent(EmployeerewardComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});

