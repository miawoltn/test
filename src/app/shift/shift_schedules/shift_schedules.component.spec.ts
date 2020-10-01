
    import { async, ComponentFixture, TestBed } from '@angular/core/testing';

import { Shift_schedulesComponent } from './shift_schedules.component';

describe('Shift_schedulesComponent', () => {
  let component: Shift_schedulesComponent;
  let fixture: ComponentFixture<Shift_schedulesComponent>;

  beforeEach(async(() => {
    TestBed.configureTestingModule({
      declarations: [ Shift_schedulesComponent ]
    })
    .compileComponents();
  }));

  beforeEach(() => {
    fixture = TestBed.createComponent(Shift_schedulesComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});

