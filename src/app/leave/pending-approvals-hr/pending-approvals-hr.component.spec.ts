import { async, ComponentFixture, TestBed } from '@angular/core/testing';

import { PendingApprovalsHrComponent } from './pending-approvals-hr.component';

describe('PendingApprovalsHrComponent', () => {
  let component: PendingApprovalsHrComponent;
  let fixture: ComponentFixture<PendingApprovalsHrComponent>;

  beforeEach(async(() => {
    TestBed.configureTestingModule({
      declarations: [ PendingApprovalsHrComponent ]
    })
    .compileComponents();
  }));

  beforeEach(() => {
    fixture = TestBed.createComponent(PendingApprovalsHrComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
