
    import { async, ComponentFixture, TestBed } from '@angular/core/testing';

import { VehicleexpensecategoryComponent } from './vehicleexpensecategory.component';

describe('VehicleexpensecategoryComponent', () => {
  let component: VehicleexpensecategoryComponent;
  let fixture: ComponentFixture<VehicleexpensecategoryComponent>;

  beforeEach(async(() => {
    TestBed.configureTestingModule({
      declarations: [ VehicleexpensecategoryComponent ]
    })
    .compileComponents();
  }));

  beforeEach(() => {
    fixture = TestBed.createComponent(VehicleexpensecategoryComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});

