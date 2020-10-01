
    import { async, ComponentFixture, TestBed } from '@angular/core/testing';

import { Shift_schedule_detailsComponent } from './shift_schedule_details.component';

describe('Shift_schedule_detailsComponent', () => {
  let component: Shift_schedule_detailsComponent;
  let fixture: ComponentFixture<Shift_schedule_detailsComponent>;

  beforeEach(async(() => {
    TestBed.configureTestingModule({
      declarations: [ Shift_schedule_detailsComponent ]
    })
    .compileComponents();
  }));

  beforeEach(() => {
    fixture = TestBed.createComponent(Shift_schedule_detailsComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});

