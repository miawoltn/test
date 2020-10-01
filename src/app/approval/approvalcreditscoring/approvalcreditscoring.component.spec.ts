
    import { async, ComponentFixture, TestBed } from '@angular/core/testing';

import { ApprovalcreditscoringComponent } from './approvalcreditscoring.component';

describe('ApprovalcreditscoringComponent', () => {
  let component: ApprovalcreditscoringComponent;
  let fixture: ComponentFixture<ApprovalcreditscoringComponent>;

  beforeEach(async(() => {
    TestBed.configureTestingModule({
      declarations: [ ApprovalcreditscoringComponent ]
    })
    .compileComponents();
  }));

  beforeEach(() => {
    fixture = TestBed.createComponent(ApprovalcreditscoringComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});

