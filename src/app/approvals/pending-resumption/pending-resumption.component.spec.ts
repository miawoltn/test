import { async, ComponentFixture, TestBed } from '@angular/core/testing';

import { PendingResumptionComponent } from './pending-resumption.component';

describe('PendingResumptionComponent', () => {
  let component: PendingResumptionComponent;
  let fixture: ComponentFixture<PendingResumptionComponent>;

  beforeEach(async(() => {
    TestBed.configureTestingModule({
      declarations: [ PendingResumptionComponent ]
    })
    .compileComponents();
  }));

  beforeEach(() => {
    fixture = TestBed.createComponent(PendingResumptionComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
