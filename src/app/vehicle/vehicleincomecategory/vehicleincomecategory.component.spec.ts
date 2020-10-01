
    import { async, ComponentFixture, TestBed } from '@angular/core/testing';

import { VehicleincomecategoryComponent } from './vehicleincomecategory.component';

describe('VehicleincomecategoryComponent', () => {
  let component: VehicleincomecategoryComponent;
  let fixture: ComponentFixture<VehicleincomecategoryComponent>;

  beforeEach(async(() => {
    TestBed.configureTestingModule({
      declarations: [ VehicleincomecategoryComponent ]
    })
    .compileComponents();
  }));

  beforeEach(() => {
    fixture = TestBed.createComponent(VehicleincomecategoryComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});

