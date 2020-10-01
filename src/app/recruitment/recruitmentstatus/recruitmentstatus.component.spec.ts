
    import { async, ComponentFixture, TestBed } from '@angular/core/testing';

import { RecruitmentstatusComponent } from './recruitmentstatus.component';

describe('RecruitmentstatusComponent', () => {
  let component: RecruitmentstatusComponent;
  let fixture: ComponentFixture<RecruitmentstatusComponent>;

  beforeEach(async(() => {
    TestBed.configureTestingModule({
      declarations: [ RecruitmentstatusComponent ]
    })
    .compileComponents();
  }));

  beforeEach(() => {
    fixture = TestBed.createComponent(RecruitmentstatusComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});

