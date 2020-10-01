
    import { async, ComponentFixture, TestBed } from '@angular/core/testing';

import { ApprovalprocessmoduleComponent } from './approvalprocessmodule.component';

describe('ApprovalprocessmoduleComponent', () => {
  let component: ApprovalprocessmoduleComponent;
  let fixture: ComponentFixture<ApprovalprocessmoduleComponent>;

  beforeEach(async(() => {
    TestBed.configureTestingModule({
      declarations: [ ApprovalprocessmoduleComponent ]
    })
    .compileComponents();
  }));

  beforeEach(() => {
    fixture = TestBed.createComponent(ApprovalprocessmoduleComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});

