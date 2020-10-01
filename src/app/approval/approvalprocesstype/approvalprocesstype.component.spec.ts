
    import { async, ComponentFixture, TestBed } from '@angular/core/testing';

import { ApprovalprocesstypeComponent } from './approvalprocesstype.component';

describe('ApprovalprocesstypeComponent', () => {
  let component: ApprovalprocesstypeComponent;
  let fixture: ComponentFixture<ApprovalprocesstypeComponent>;

  beforeEach(async(() => {
    TestBed.configureTestingModule({
      declarations: [ ApprovalprocesstypeComponent ]
    })
    .compileComponents();
  }));

  beforeEach(() => {
    fixture = TestBed.createComponent(ApprovalprocesstypeComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});

