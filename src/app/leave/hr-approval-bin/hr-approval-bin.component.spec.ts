import { async, ComponentFixture, TestBed } from '@angular/core/testing';

import { HrApprovalBinComponent } from './hr-approval-bin.component';

describe('HrApprovalBinComponent', () => {
  let component: HrApprovalBinComponent;
  let fixture: ComponentFixture<HrApprovalBinComponent>;

  beforeEach(async(() => {
    TestBed.configureTestingModule({
      declarations: [ HrApprovalBinComponent ]
    })
    .compileComponents();
  }));

  beforeEach(() => {
    fixture = TestBed.createComponent(HrApprovalBinComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
