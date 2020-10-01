
    import { async, ComponentFixture, TestBed } from '@angular/core/testing';

import { ApprovalprocessflowComponent } from './approvalprocessflow.component';

describe('ApprovalprocessflowComponent', () => {
  let component: ApprovalprocessflowComponent;
  let fixture: ComponentFixture<ApprovalprocessflowComponent>;

  beforeEach(async(() => {
    TestBed.configureTestingModule({
      declarations: [ ApprovalprocessflowComponent ]
    })
    .compileComponents();
  }));

  beforeEach(() => {
    fixture = TestBed.createComponent(ApprovalprocessflowComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});

