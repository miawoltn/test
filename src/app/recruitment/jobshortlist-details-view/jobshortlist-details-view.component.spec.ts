import { async, ComponentFixture, TestBed } from "@angular/core/testing";
import { JobshortlistDetailsViewComponent } from './jobshortlist-details-view.component';

describe("JobshortlistDetailsViewComponent", () => {
  let component: JobshortlistDetailsViewComponent;
  let fixture: ComponentFixture<JobshortlistDetailsViewComponent>;

  beforeEach(async(() => {
    TestBed.configureTestingModule({
      declarations: [JobshortlistDetailsViewComponent],
    }).compileComponents();
  }));

  beforeEach(() => {
    fixture = TestBed.createComponent(JobshortlistDetailsViewComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it("should create", () => {
    expect(component).toBeTruthy();
  });
});
