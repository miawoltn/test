import { async, ComponentFixture, TestBed } from '@angular/core/testing';

import { ViewAppraisalsComponent } from './view-appraisals.component';

describe('ViewAppraisalsComponent', () => {
  let component: ViewAppraisalsComponent;
  let fixture: ComponentFixture<ViewAppraisalsComponent>;

  beforeEach(async(() => {
    TestBed.configureTestingModule({
      declarations: [ ViewAppraisalsComponent ]
    })
    .compileComponents();
  }));

  beforeEach(() => {
    fixture = TestBed.createComponent(ViewAppraisalsComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
