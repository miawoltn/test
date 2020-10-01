import { async, ComponentFixture, TestBed } from '@angular/core/testing';

import { ApprovalBinHrComponent } from './approval-bin-hr.component';

describe('ApprovalBinHrComponent', () => {
  let component: ApprovalBinHrComponent;
  let fixture: ComponentFixture<ApprovalBinHrComponent>;

  beforeEach(async(() => {
    TestBed.configureTestingModule({
      declarations: [ ApprovalBinHrComponent ]
    })
    .compileComponents();
  }));

  beforeEach(() => {
    fixture = TestBed.createComponent(ApprovalBinHrComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
