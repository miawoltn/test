import { async, ComponentFixture, TestBed } from '@angular/core/testing';

import { AppraisalModalComponent } from './appraisal-modal.component';

describe('AppraisalModalComponent', () => {
  let component: AppraisalModalComponent;
  let fixture: ComponentFixture<AppraisalModalComponent>;

  beforeEach(async(() => {
    TestBed.configureTestingModule({
      declarations: [ AppraisalModalComponent ]
    })
    .compileComponents();
  }));

  beforeEach(() => {
    fixture = TestBed.createComponent(AppraisalModalComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
