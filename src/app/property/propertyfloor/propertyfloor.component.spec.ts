
    import { async, ComponentFixture, TestBed } from '@angular/core/testing';

import { PropertyfloorComponent } from './propertyfloor.component';

describe('PropertyfloorComponent', () => {
  let component: PropertyfloorComponent;
  let fixture: ComponentFixture<PropertyfloorComponent>;

  beforeEach(async(() => {
    TestBed.configureTestingModule({
      declarations: [ PropertyfloorComponent ]
    })
    .compileComponents();
  }));

  beforeEach(() => {
    fixture = TestBed.createComponent(PropertyfloorComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});

