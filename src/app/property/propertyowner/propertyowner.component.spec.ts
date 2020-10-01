
    import { async, ComponentFixture, TestBed } from '@angular/core/testing';

import { PropertyownerComponent } from './propertyowner.component';

describe('PropertyownerComponent', () => {
  let component: PropertyownerComponent;
  let fixture: ComponentFixture<PropertyownerComponent>;

  beforeEach(async(() => {
    TestBed.configureTestingModule({
      declarations: [ PropertyownerComponent ]
    })
    .compileComponents();
  }));

  beforeEach(() => {
    fixture = TestBed.createComponent(PropertyownerComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});

