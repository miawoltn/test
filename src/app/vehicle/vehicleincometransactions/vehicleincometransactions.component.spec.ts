
    import { async, ComponentFixture, TestBed } from '@angular/core/testing';

import { VehicleincometransactionsComponent } from './vehicleincometransactions.component';

describe('VehicleincometransactionsComponent', () => {
  let component: VehicleincometransactionsComponent;
  let fixture: ComponentFixture<VehicleincometransactionsComponent>;

  beforeEach(async(() => {
    TestBed.configureTestingModule({
      declarations: [ VehicleincometransactionsComponent ]
    })
    .compileComponents();
  }));

  beforeEach(() => {
    fixture = TestBed.createComponent(VehicleincometransactionsComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});

