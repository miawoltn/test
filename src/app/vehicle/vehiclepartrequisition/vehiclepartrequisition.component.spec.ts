
    import { async, ComponentFixture, TestBed } from '@angular/core/testing';

import { VehiclepartrequisitionComponent } from './vehiclepartrequisition.component';

describe('VehiclepartrequisitionComponent', () => {
  let component: VehiclepartrequisitionComponent;
  let fixture: ComponentFixture<VehiclepartrequisitionComponent>;

  beforeEach(async(() => {
    TestBed.configureTestingModule({
      declarations: [ VehiclepartrequisitionComponent ]
    })
    .compileComponents();
  }));

  beforeEach(() => {
    fixture = TestBed.createComponent(VehiclepartrequisitionComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});

