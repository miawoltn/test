import { async, ComponentFixture, TestBed } from '@angular/core/testing';

import { ActiontypesComponent } from './actiontypes.component';

describe('ActiontypesComponent', () => {
  let component: ActiontypesComponent;
  let fixture: ComponentFixture<ActiontypesComponent>;

  beforeEach(async(() => {
    TestBed.configureTestingModule({
      declarations: [ ActiontypesComponent ]
    })
    .compileComponents();
  }));

  beforeEach(() => {
    fixture = TestBed.createComponent(ActiontypesComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});

