import { async, ComponentFixture, TestBed } from "@angular/core/testing";
import { Joboffer2Component } from './joboffer2.component';

describe("Joboffer2Component", () => {
  let component: Joboffer2Component;
  let fixture: ComponentFixture<Joboffer2Component>;

  beforeEach(async(() => {
    TestBed.configureTestingModule({
      declarations: [Joboffer2Component],
    }).compileComponents();
  }));

  beforeEach(() => {
    fixture = TestBed.createComponent(Joboffer2Component);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it("should create", () => {
    expect(component).toBeTruthy();
  });
});
