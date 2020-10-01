
    import { async, ComponentFixture, TestBed } from '@angular/core/testing';

import { PropertysubtypeComponent } from './propertysubtype.component';

describe('PropertysubtypeComponent', () => {
  let component: PropertysubtypeComponent;
  let fixture: ComponentFixture<PropertysubtypeComponent>;

  beforeEach(async(() => {
    TestBed.configureTestingModule({
      declarations: [ PropertysubtypeComponent ]
    })
    .compileComponents();
  }));

  beforeEach(() => {
    fixture = TestBed.createComponent(PropertysubtypeComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});

