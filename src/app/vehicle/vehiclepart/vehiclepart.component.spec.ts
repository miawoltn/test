
    import { async, ComponentFixture, TestBed } from '@angular/core/testing';

import { VehiclepartComponent } from './vehiclepart.component';

describe('VehiclepartComponent', () => {
  let component: VehiclepartComponent;
  let fixture: ComponentFixture<VehiclepartComponent>;

  beforeEach(async(() => {
    TestBed.configureTestingModule({
      declarations: [ VehiclepartComponent ]
    })
    .compileComponents();
  }));

  beforeEach(() => {
    fixture = TestBed.createComponent(VehiclepartComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});

