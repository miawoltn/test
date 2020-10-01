import { async, ComponentFixture, TestBed } from "@angular/core/testing";
import { JobinterviewHistoryComponent } from './jobinterview-history.component';

describe("JobinterviewHistoryComponent", () => {
  let component: JobinterviewHistoryComponent;
  let fixture: ComponentFixture<JobinterviewHistoryComponent>;

  beforeEach(async(() => {
    TestBed.configureTestingModule({
      declarations: [JobinterviewHistoryComponent],
    }).compileComponents();
  }));

  beforeEach(() => {
    fixture = TestBed.createComponent(JobinterviewHistoryComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it("should create", () => {
    expect(component).toBeTruthy();
  });
});
