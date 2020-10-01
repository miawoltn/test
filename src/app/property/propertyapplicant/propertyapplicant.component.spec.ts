
    import { async, ComponentFixture, TestBed } from '@angular/core/testing';

import { PropertyapplicantComponent } from './propertyapplicant.component';

describe('PropertyapplicantComponent', () => {
  let component: PropertyapplicantComponent;
  let fixture: ComponentFixture<PropertyapplicantComponent>;

  beforeEach(async(() => {
    TestBed.configureTestingModule({
      declarations: [ PropertyapplicantComponent ]
    })
    .compileComponents();
  }));

  beforeEach(() => {
    fixture = TestBed.createComponent(PropertyapplicantComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});

