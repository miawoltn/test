import { async, ComponentFixture, TestBed } from '@angular/core/testing';

import { Appraisal_dynamicsourceComponent } from './appraisal_dynamicsource.component';

describe('Appraisal_dynamicsourceComponent', () => {
  let component: Appraisal_dynamicsourceComponent;
  let fixture: ComponentFixture<Appraisal_dynamicsourceComponent>;

  beforeEach(async(() => {
    TestBed.configureTestingModule({
      declarations: [ Appraisal_dynamicsourceComponent ]
    })
    .compileComponents();
  }));

  beforeEach(() => {
    fixture = TestBed.createComponent(Appraisal_dynamicsourceComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});

