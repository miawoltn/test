import { async, ComponentFixture, TestBed } from '@angular/core/testing';

import { Appraisal_dynamicdatamappingComponent } from './appraisal_dynamicdatamapping.component';

describe('Appraisal_dynamicdatamappingComponent', () => {
  let component: Appraisal_dynamicdatamappingComponent;
  let fixture: ComponentFixture<Appraisal_dynamicdatamappingComponent>;

  beforeEach(async(() => {
    TestBed.configureTestingModule({
      declarations: [ Appraisal_dynamicdatamappingComponent ]
    })
    .compileComponents();
  }));

  beforeEach(() => {
    fixture = TestBed.createComponent(Appraisal_dynamicdatamappingComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});

