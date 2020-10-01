import { async, ComponentFixture, TestBed } from '@angular/core/testing';

import { Appraisal_recommenddetailsComponent } from './appraisal_recommenddetails.component';

describe('Appraisal_recommenddetailsComponent', () => {
  let component: Appraisal_recommenddetailsComponent;
  let fixture: ComponentFixture<Appraisal_recommenddetailsComponent>;

  beforeEach(async(() => {
    TestBed.configureTestingModule({
      declarations: [ Appraisal_recommenddetailsComponent ]
    })
    .compileComponents();
  }));

  beforeEach(() => {
    fixture = TestBed.createComponent(Appraisal_recommenddetailsComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});

