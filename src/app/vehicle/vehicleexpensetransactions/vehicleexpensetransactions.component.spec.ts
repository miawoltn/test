
    import { async, ComponentFixture, TestBed } from '@angular/core/testing';

import { VehicleexpensetransactionsComponent } from './vehicleexpensetransactions.component';

describe('VehicleexpensetransactionsComponent', () => {
  let component: VehicleexpensetransactionsComponent;
  let fixture: ComponentFixture<VehicleexpensetransactionsComponent>;

  beforeEach(async(() => {
    TestBed.configureTestingModule({
      declarations: [ VehicleexpensetransactionsComponent ]
    })
    .compileComponents();
  }));

  beforeEach(() => {
    fixture = TestBed.createComponent(VehicleexpensetransactionsComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});

