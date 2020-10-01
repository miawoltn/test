
    import { async, ComponentFixture, TestBed } from '@angular/core/testing';

import { Shift_schedule_employeesComponent } from './shift_schedule_employees.component';

describe('Shift_schedule_employeesComponent', () => {
  let component: Shift_schedule_employeesComponent;
  let fixture: ComponentFixture<Shift_schedule_employeesComponent>;

  beforeEach(async(() => {
    TestBed.configureTestingModule({
      declarations: [ Shift_schedule_employeesComponent ]
    })
    .compileComponents();
  }));

  beforeEach(() => {
    fixture = TestBed.createComponent(Shift_schedule_employeesComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});

