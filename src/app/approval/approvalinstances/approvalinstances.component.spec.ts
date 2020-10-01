
    import { async, ComponentFixture, TestBed } from '@angular/core/testing';

import { ApprovalinstancesComponent } from './approvalinstances.component';

describe('ApprovalinstancesComponent', () => {
  let component: ApprovalinstancesComponent;
  let fixture: ComponentFixture<ApprovalinstancesComponent>;

  beforeEach(async(() => {
    TestBed.configureTestingModule({
      declarations: [ ApprovalinstancesComponent ]
    })
    .compileComponents();
  }));

  beforeEach(() => {
    fixture = TestBed.createComponent(ApprovalinstancesComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});

