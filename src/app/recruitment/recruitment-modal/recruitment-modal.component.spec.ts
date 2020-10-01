import { async, ComponentFixture, TestBed } from '@angular/core/testing';

import { RecruitmentModalComponent } from './recruitment-modal.component';

describe('RecruitmentModalComponent', () => {
  let component: RecruitmentModalComponent;
  let fixture: ComponentFixture<RecruitmentModalComponent>;

  beforeEach(async(() => {
    TestBed.configureTestingModule({
      declarations: [ RecruitmentModalComponent ]
    })
    .compileComponents();
  }));

  beforeEach(() => {
    fixture = TestBed.createComponent(RecruitmentModalComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
