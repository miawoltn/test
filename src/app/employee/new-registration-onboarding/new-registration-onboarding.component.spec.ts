import { async, ComponentFixture, TestBed } from '@angular/core/testing';
import { NewRegistrationOnboardingComponent } from './new-registration-onboarding.component';

describe('NewRegistrationOnboardingComponent', () => {
  let component: NewRegistrationOnboardingComponent;
  let fixture: ComponentFixture<NewRegistrationOnboardingComponent>;

  beforeEach(async(() => {
    TestBed.configureTestingModule({
      declarations: [ NewRegistrationOnboardingComponent ]
    })
    .compileComponents();
  }));

  beforeEach(() => {
    fixture = TestBed.createComponent(NewRegistrationOnboardingComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
