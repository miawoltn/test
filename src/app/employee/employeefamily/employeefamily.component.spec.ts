
    import { async, ComponentFixture, TestBed } from '@angular/core/testing';

import { EmployeefamilyComponent } from './employeefamily.component';

describe('EmployeefamilyComponent', () => {
  let component: EmployeefamilyComponent;
  let fixture: ComponentFixture<EmployeefamilyComponent>;

  beforeEach(async(() => {
    TestBed.configureTestingModule({
      declarations: [ EmployeefamilyComponent ]
    })
    .compileComponents();
  }));

  beforeEach(() => {
    fixture = TestBed.createComponent(EmployeefamilyComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});

