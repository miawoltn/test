import { async, ComponentFixture, TestBed } from '@angular/core/testing';

import { AppraisalBinComponent } from './appraisal-bin.component';

describe('AppraisalBinComponent', () => {
  let component: AppraisalBinComponent;
  let fixture: ComponentFixture<AppraisalBinComponent>;

  beforeEach(async(() => {
    TestBed.configureTestingModule({
      declarations: [ AppraisalBinComponent ]
    })
    .compileComponents();
  }));

  beforeEach(() => {
    fixture = TestBed.createComponent(AppraisalBinComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
