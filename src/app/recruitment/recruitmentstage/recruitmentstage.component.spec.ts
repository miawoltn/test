
    import { async, ComponentFixture, TestBed } from '@angular/core/testing';

import { RecruitmentstageComponent } from './recruitmentstage.component';

describe('RecruitmentstageComponent', () => {
  let component: RecruitmentstageComponent;
  let fixture: ComponentFixture<RecruitmentstageComponent>;

  beforeEach(async(() => {
    TestBed.configureTestingModule({
      declarations: [ RecruitmentstageComponent ]
    })
    .compileComponents();
  }));

  beforeEach(() => {
    fixture = TestBed.createComponent(RecruitmentstageComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});

