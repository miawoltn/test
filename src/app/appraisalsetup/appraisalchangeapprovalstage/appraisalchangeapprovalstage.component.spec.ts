import { async, ComponentFixture, TestBed } from '@angular/core/testing';

import { AppraisalchangeapprovalstageComponent } from './appraisalchangeapprovalstage.component';

describe('AppraisalchangeapprovalstageComponent', () => {
  let component: AppraisalchangeapprovalstageComponent;
  let fixture: ComponentFixture<AppraisalchangeapprovalstageComponent>;

  beforeEach(async(() => {
    TestBed.configureTestingModule({
      declarations: [ AppraisalchangeapprovalstageComponent ]
    })
    .compileComponents();
  }));

  beforeEach(() => {
    fixture = TestBed.createComponent(AppraisalchangeapprovalstageComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});

