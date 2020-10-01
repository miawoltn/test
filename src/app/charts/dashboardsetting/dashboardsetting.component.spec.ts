import { async, ComponentFixture, TestBed } from '@angular/core/testing';

import { DashboardsettingComponent } from './dashboardsetting.component';

describe('DashboardsettingComponent', () => {
  let component: DashboardsettingComponent;
  let fixture: ComponentFixture<DashboardsettingComponent>;

  beforeEach(async(() => {
    TestBed.configureTestingModule({
      declarations: [ DashboardsettingComponent ]
    })
    .compileComponents();
  }));

  beforeEach(() => {
    fixture = TestBed.createComponent(DashboardsettingComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});

