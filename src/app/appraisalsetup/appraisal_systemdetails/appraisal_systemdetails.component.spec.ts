import { async, ComponentFixture, TestBed } from '@angular/core/testing';

import { Appraisal_systemdetailsComponent } from './appraisal_systemdetails.component';

describe('Appraisal_systemdetailsComponent', () => {
  let component: Appraisal_systemdetailsComponent;
  let fixture: ComponentFixture<Appraisal_systemdetailsComponent>;

  beforeEach(async(() => {
    TestBed.configureTestingModule({
      declarations: [ Appraisal_systemdetailsComponent ]
    })
    .compileComponents();
  }));

  beforeEach(() => {
    fixture = TestBed.createComponent(Appraisal_systemdetailsComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});

