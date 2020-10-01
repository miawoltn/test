import { async, ComponentFixture, TestBed } from '@angular/core/testing';

import { Appraisal_systemsComponent } from './appraisal_systems.component';

describe('Appraisal_systemsComponent', () => {
  let component: Appraisal_systemsComponent;
  let fixture: ComponentFixture<Appraisal_systemsComponent>;

  beforeEach(async(() => {
    TestBed.configureTestingModule({
      declarations: [ Appraisal_systemsComponent ]
    })
    .compileComponents();
  }));

  beforeEach(() => {
    fixture = TestBed.createComponent(Appraisal_systemsComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});

