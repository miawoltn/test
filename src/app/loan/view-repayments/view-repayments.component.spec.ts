import { async, ComponentFixture, TestBed } from '@angular/core/testing';

import { ViewRepaymentsComponent } from './view-repayments.component';

describe('ViewRepaymentsComponent', () => {
  let component: ViewRepaymentsComponent;
  let fixture: ComponentFixture<ViewRepaymentsComponent>;

  beforeEach(async(() => {
    TestBed.configureTestingModule({
      declarations: [ ViewRepaymentsComponent ]
    })
    .compileComponents();
  }));

  beforeEach(() => {
    fixture = TestBed.createComponent(ViewRepaymentsComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
