
    import { async, ComponentFixture, TestBed } from '@angular/core/testing';

import { PropertyallocationComponent } from './propertyallocation.component';

describe('PropertyallocationComponent', () => {
  let component: PropertyallocationComponent;
  let fixture: ComponentFixture<PropertyallocationComponent>;

  beforeEach(async(() => {
    TestBed.configureTestingModule({
      declarations: [ PropertyallocationComponent ]
    })
    .compileComponents();
  }));

  beforeEach(() => {
    fixture = TestBed.createComponent(PropertyallocationComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});

