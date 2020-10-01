import { async, ComponentFixture, TestBed } from '@angular/core/testing';

import { Appraisal_systemtypesComponent } from './appraisal_systemtypes.component';

describe('Appraisal_systemtypesComponent', () => {
  let component: Appraisal_systemtypesComponent;
  let fixture: ComponentFixture<Appraisal_systemtypesComponent>;

  beforeEach(async(() => {
    TestBed.configureTestingModule({
      declarations: [ Appraisal_systemtypesComponent ]
    })
    .compileComponents();
  }));

  beforeEach(() => {
    fixture = TestBed.createComponent(Appraisal_systemtypesComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});

