import { async, ComponentFixture, TestBed } from '@angular/core/testing';

import { ApprovalBinComponent } from './approval-bin.component';

describe('ApprovalBinComponent', () => {
  let component: ApprovalBinComponent;
  let fixture: ComponentFixture<ApprovalBinComponent>;

  beforeEach(async(() => {
    TestBed.configureTestingModule({
      declarations: [ ApprovalBinComponent ]
    })
    .compileComponents();
  }));

  beforeEach(() => {
    fixture = TestBed.createComponent(ApprovalBinComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
