import { async, ComponentFixture, TestBed } from '@angular/core/testing';

import { ApprovalHrComponent } from './approval-hr.component';

describe('ApprovalHrComponent', () => {
  let component: ApprovalHrComponent;
  let fixture: ComponentFixture<ApprovalHrComponent>;

  beforeEach(async(() => {
    TestBed.configureTestingModule({
      declarations: [ ApprovalHrComponent ]
    })
    .compileComponents();
  }));

  beforeEach(() => {
    fixture = TestBed.createComponent(ApprovalHrComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
