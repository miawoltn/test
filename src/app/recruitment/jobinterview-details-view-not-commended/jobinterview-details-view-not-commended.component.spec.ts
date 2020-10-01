import { async, ComponentFixture, TestBed } from "@angular/core/testing";
import { JobinterviewDetailsViewNotRecommendedComponent } from './jobinterview-details-view-not-commended.component';


describe("JobinterviewDetailsViewNotRecommendedComponent", () => {
  let component: JobinterviewDetailsViewNotRecommendedComponent;
  let fixture: ComponentFixture<JobinterviewDetailsViewNotRecommendedComponent>;

  beforeEach(async(() => {
    TestBed.configureTestingModule({
      declarations: [JobinterviewDetailsViewNotRecommendedComponent],
    }).compileComponents();
  }));

  beforeEach(() => {
    fixture = TestBed.createComponent(JobinterviewDetailsViewNotRecommendedComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it("should create", () => {
    expect(component).toBeTruthy();
  });
});
