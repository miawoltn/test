
    import { async, ComponentFixture, TestBed } from '@angular/core/testing';

import { PropertyinspectionComponent } from './propertyinspection.component';

describe('PropertyinspectionComponent', () => {
  let component: PropertyinspectionComponent;
  let fixture: ComponentFixture<PropertyinspectionComponent>;

  beforeEach(async(() => {
    TestBed.configureTestingModule({
      declarations: [ PropertyinspectionComponent ]
    })
    .compileComponents();
  }));

  beforeEach(() => {
    fixture = TestBed.createComponent(PropertyinspectionComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});

