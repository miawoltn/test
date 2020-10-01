import { async, ComponentFixture, TestBed } from '@angular/core/testing';

import { Appraisal_trainingsComponent } from './appraisal_trainings.component';

describe('Appraisal_trainingsComponent', () => {
  let component: Appraisal_trainingsComponent;
  let fixture: ComponentFixture<Appraisal_trainingsComponent>;

  beforeEach(async(() => {
    TestBed.configureTestingModule({
      declarations: [ Appraisal_trainingsComponent ]
    })
    .compileComponents();
  }));

  beforeEach(() => {
    fixture = TestBed.createComponent(Appraisal_trainingsComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});

