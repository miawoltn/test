
    import { async, ComponentFixture, TestBed } from '@angular/core/testing';

import { PropertyapplicationComponent } from './propertyapplication.component';

describe('PropertyapplicationComponent', () => {
  let component: PropertyapplicationComponent;
  let fixture: ComponentFixture<PropertyapplicationComponent>;

  beforeEach(async(() => {
    TestBed.configureTestingModule({
      declarations: [ PropertyapplicationComponent ]
    })
    .compileComponents();
  }));

  beforeEach(() => {
    fixture = TestBed.createComponent(PropertyapplicationComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});

