import { async, ComponentFixture, TestBed } from "@angular/core/testing";
import { JobshortlistHistoryComponent } from './jobshortlist-history.component';

describe("JobshortlistHistoryComponent", () => {
  let component: JobshortlistHistoryComponent;
  let fixture: ComponentFixture<JobshortlistHistoryComponent>;

  beforeEach(async(() => {
    TestBed.configureTestingModule({
      declarations: [JobshortlistHistoryComponent],
    }).compileComponents();
  }));

  beforeEach(() => {
    fixture = TestBed.createComponent(JobshortlistHistoryComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it("should create", () => {
    expect(component).toBeTruthy();
  });
});
