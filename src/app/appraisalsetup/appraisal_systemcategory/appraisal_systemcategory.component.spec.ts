import { async, ComponentFixture, TestBed } from '@angular/core/testing';

import { Appraisal_systemcategoryComponent } from './appraisal_systemcategory.component';

describe('Appraisal_systemcategoryComponent', () => {
  let component: Appraisal_systemcategoryComponent;
  let fixture: ComponentFixture<Appraisal_systemcategoryComponent>;

  beforeEach(async(() => {
    TestBed.configureTestingModule({
      declarations: [ Appraisal_systemcategoryComponent ]
    })
    .compileComponents();
  }));

  beforeEach(() => {
    fixture = TestBed.createComponent(Appraisal_systemcategoryComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});

