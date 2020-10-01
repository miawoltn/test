
    import { async, ComponentFixture, TestBed } from '@angular/core/testing';

import { Shift_daysComponent } from './shift_days.component';

describe('Shift_daysComponent', () => {
  let component: Shift_daysComponent;
  let fixture: ComponentFixture<Shift_daysComponent>;

  beforeEach(async(() => {
    TestBed.configureTestingModule({
      declarations: [ Shift_daysComponent ]
    })
    .compileComponents();
  }));

  beforeEach(() => {
    fixture = TestBed.createComponent(Shift_daysComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});

