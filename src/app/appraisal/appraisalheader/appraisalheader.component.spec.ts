import { async, ComponentFixture, TestBed } from '@angular/core/testing';

import { AppraisalheaderComponent } from './appraisalheader.component';

describe('AppraisalheaderComponent', () => {
  let component: AppraisalheaderComponent;
  let fixture: ComponentFixture<AppraisalheaderComponent>;

  beforeEach(async(() => {
    TestBed.configureTestingModule({
      declarations: [ AppraisalheaderComponent ]
    })
    .compileComponents();
  }));

  beforeEach(() => {
    fixture = TestBed.createComponent(AppraisalheaderComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});

