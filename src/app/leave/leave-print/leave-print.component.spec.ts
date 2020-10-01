import { async, ComponentFixture, TestBed } from '@angular/core/testing';

import { LeavePrintComponent } from './leave-print.component';

describe('LeavePrintComponent', () => {
  let component: LeavePrintComponent;
  let fixture: ComponentFixture<LeavePrintComponent>;

  beforeEach(async(() => {
    TestBed.configureTestingModule({
      declarations: [ LeavePrintComponent ]
    })
    .compileComponents();
  }));

  beforeEach(() => {
    fixture = TestBed.createComponent(LeavePrintComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
