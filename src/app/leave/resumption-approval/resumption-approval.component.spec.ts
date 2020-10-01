import { async, ComponentFixture, TestBed } from '@angular/core/testing';

import { ResumptionApprovalComponent } from './resumption-approval.component';

describe('ResumptionApprovalComponent', () => {
  let component: ResumptionApprovalComponent;
  let fixture: ComponentFixture<ResumptionApprovalComponent>;

  beforeEach(async(() => {
    TestBed.configureTestingModule({
      declarations: [ ResumptionApprovalComponent ]
    })
    .compileComponents();
  }));

  beforeEach(() => {
    fixture = TestBed.createComponent(ResumptionApprovalComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
