
    import { async, ComponentFixture, TestBed } from '@angular/core/testing';

import { ApprovalstagesComponent } from './approvalstages.component';

describe('ApprovalstagesComponent', () => {
  let component: ApprovalstagesComponent;
  let fixture: ComponentFixture<ApprovalstagesComponent>;

  beforeEach(async(() => {
    TestBed.configureTestingModule({
      declarations: [ ApprovalstagesComponent ]
    })
    .compileComponents();
  }));

  beforeEach(() => {
    fixture = TestBed.createComponent(ApprovalstagesComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});

