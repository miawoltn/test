import { async, ComponentFixture, TestBed } from '@angular/core/testing';

import { NewResumptionComponent } from './new-resumption.component';

describe('NewResumptionComponent', () => {
  let component: NewResumptionComponent;
  let fixture: ComponentFixture<NewResumptionComponent>;

  beforeEach(async(() => {
    TestBed.configureTestingModule({
      declarations: [ NewResumptionComponent ]
    })
    .compileComponents();
  }));

  beforeEach(() => {
    fixture = TestBed.createComponent(NewResumptionComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
