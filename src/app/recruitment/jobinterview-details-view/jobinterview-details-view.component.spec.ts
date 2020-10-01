import { async, ComponentFixture, TestBed } from "@angular/core/testing";
import { JobinterviewDetailsViewComponent } from './jobinterview-details-view.component';

describe("JobinterviewDetailsViewComponent", () => {
  let component: JobinterviewDetailsViewComponent;
  let fixture: ComponentFixture<JobinterviewDetailsViewComponent>;

  beforeEach(async(() => {
    TestBed.configureTestingModule({
      declarations: [JobinterviewDetailsViewComponent],
    }).compileComponents();
  }));

  beforeEach(() => {
    fixture = TestBed.createComponent(JobinterviewDetailsViewComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it("should create", () => {
    expect(component).toBeTruthy();
  });
});
