import { async, ComponentFixture, TestBed } from '@angular/core/testing';

import { KpiForApprovalComponent } from './kpi-for-approval.component';

describe('KpiForApprovalComponent', () => {
  let component: KpiForApprovalComponent;
  let fixture: ComponentFixture<KpiForApprovalComponent>;

  beforeEach(async(() => {
    TestBed.configureTestingModule({
      declarations: [ KpiForApprovalComponent ]
    })
    .compileComponents();
  }));

  beforeEach(() => {
    fixture = TestBed.createComponent(KpiForApprovalComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
