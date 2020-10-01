
    import { async, ComponentFixture, TestBed } from '@angular/core/testing';

import { VehicledriverComponent } from './vehicledriver.component';

describe('VehicledriverComponent', () => {
  let component: VehicledriverComponent;
  let fixture: ComponentFixture<VehicledriverComponent>;

  beforeEach(async(() => {
    TestBed.configureTestingModule({
      declarations: [ VehicledriverComponent ]
    })
    .compileComponents();
  }));

  beforeEach(() => {
    fixture = TestBed.createComponent(VehicledriverComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});

