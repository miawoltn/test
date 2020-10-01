import { async, ComponentFixture, TestBed } from '@angular/core/testing';

import { AppraisalChartComponent } from './appraisal-chart.component';

describe('AppraisalChartComponent', () => {
  let component: AppraisalChartComponent;
  let fixture: ComponentFixture<AppraisalChartComponent>;

  beforeEach(async(() => {
    TestBed.configureTestingModule({
      declarations: [ AppraisalChartComponent ]
    })
    .compileComponents();
  }));

  beforeEach(() => {
    fixture = TestBed.createComponent(AppraisalChartComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
