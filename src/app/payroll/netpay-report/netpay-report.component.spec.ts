import { async, ComponentFixture, TestBed } from '@angular/core/testing';

import { NetpayReportComponent } from './netpay-report.component';

describe('NetpayReportComponent', () => {
  let component: NetpayReportComponent;
  let fixture: ComponentFixture<NetpayReportComponent>;

  beforeEach(async(() => {
    TestBed.configureTestingModule({
      declarations: [ NetpayReportComponent ]
    })
    .compileComponents();
  }));

  beforeEach(() => {
    fixture = TestBed.createComponent(NetpayReportComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
