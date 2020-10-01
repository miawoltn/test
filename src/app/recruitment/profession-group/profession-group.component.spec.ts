import { async, ComponentFixture, TestBed } from "@angular/core/testing";
import { ProfessionGroupComponent } from './profession-group.component';

describe("ProfessionGroupComponent", () => {
  let component: ProfessionGroupComponent;
  let fixture: ComponentFixture<ProfessionGroupComponent>;

  beforeEach(async(() => {
    TestBed.configureTestingModule({
      declarations: [ProfessionGroupComponent],
    }).compileComponents();
  }));

  beforeEach(() => {
    fixture = TestBed.createComponent(ProfessionGroupComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it("should create", () => {
    expect(component).toBeTruthy();
  });
});
