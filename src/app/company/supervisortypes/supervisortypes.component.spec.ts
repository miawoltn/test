
    import { async, ComponentFixture, TestBed } from '@angular/core/testing';

import { SupervisortypesComponent } from './supervisortypes.component';

describe('SupervisortypesComponent', () => {
  let component: SupervisortypesComponent;
  let fixture: ComponentFixture<SupervisortypesComponent>;

  beforeEach(async(() => {
    TestBed.configureTestingModule({
      declarations: [ SupervisortypesComponent ]
    })
    .compileComponents();
  }));

  beforeEach(() => {
    fixture = TestBed.createComponent(SupervisortypesComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});

