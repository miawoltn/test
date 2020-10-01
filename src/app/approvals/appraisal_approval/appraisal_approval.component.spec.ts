import { async, ComponentFixture, TestBed } from '@angular/core/testing';

import { Appraisal_approvalComponent } from './appraisal_approval.component';

describe('Appraisal_approvalComponent', () => {
  let component: Appraisal_approvalComponent;
  let fixture: ComponentFixture<Appraisal_approvalComponent>;

  beforeEach(async(() => {
    TestBed.configureTestingModule({
      declarations: [ Appraisal_approvalComponent ]
    })
    .compileComponents();
  }));

  beforeEach(() => {
    fixture = TestBed.createComponent(Appraisal_approvalComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});

