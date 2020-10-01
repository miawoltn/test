
    import { async, ComponentFixture, TestBed } from '@angular/core/testing';

import { VehiclebookingComponent } from './vehiclebooking.component';

describe('VehiclebookingComponent', () => {
  let component: VehiclebookingComponent;
  let fixture: ComponentFixture<VehiclebookingComponent>;

  beforeEach(async(() => {
    TestBed.configureTestingModule({
      declarations: [ VehiclebookingComponent ]
    })
    .compileComponents();
  }));

  beforeEach(() => {
    fixture = TestBed.createComponent(VehiclebookingComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});

