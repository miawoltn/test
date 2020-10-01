import { async, ComponentFixture, TestBed } from '@angular/core/testing';

import { Kpiconfig_approvalComponent } from './kpiconfig_approval.component';

describe('Kpiconfig_approvalComponent', () => {
  let component: Kpiconfig_approvalComponent;
  let fixture: ComponentFixture<Kpiconfig_approvalComponent>;

  beforeEach(async(() => {
    TestBed.configureTestingModule({
      declarations: [ Kpiconfig_approvalComponent ]
    })
    .compileComponents();
  }));

  beforeEach(() => {
    fixture = TestBed.createComponent(Kpiconfig_approvalComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});

