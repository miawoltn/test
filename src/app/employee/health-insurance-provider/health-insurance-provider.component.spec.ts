import { async, ComponentFixture, TestBed } from "@angular/core/testing";
import { HealthInsuranceProviderComponent } from "./health-insurance-provider.component";

describe("HealthInsuranceProviderComponent", () => {
  let component: HealthInsuranceProviderComponent;
  let fixture: ComponentFixture<HealthInsuranceProviderComponent>;

  beforeEach(async(() => {
    TestBed.configureTestingModule({
      declarations: [HealthInsuranceProviderComponent],
    }).compileComponents();
  }));

  beforeEach(() => {
    fixture = TestBed.createComponent(HealthInsuranceProviderComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it("should create", () => {
    expect(component).toBeTruthy();
  });
});
