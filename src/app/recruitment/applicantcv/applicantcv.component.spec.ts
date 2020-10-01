
    import { async, ComponentFixture, TestBed } from '@angular/core/testing';

import { ApplicantcvComponent } from './applicantcv.component';

describe('ApplicantcvComponent', () => {
  let component: ApplicantcvComponent;
  let fixture: ComponentFixture<ApplicantcvComponent>;

  beforeEach(async(() => {
    TestBed.configureTestingModule({
      declarations: [ ApplicantcvComponent ]
    })
    .compileComponents();
  }));

  beforeEach(() => {
    fixture = TestBed.createComponent(ApplicantcvComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});

