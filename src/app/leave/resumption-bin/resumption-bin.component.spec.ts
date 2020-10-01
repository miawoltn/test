import { async, ComponentFixture, TestBed } from '@angular/core/testing';

import { ResumptionBinComponent } from './resumption-bin.component';

describe('ResumptionBinComponent', () => {
  let component: ResumptionBinComponent;
  let fixture: ComponentFixture<ResumptionBinComponent>;

  beforeEach(async(() => {
    TestBed.configureTestingModule({
      declarations: [ ResumptionBinComponent ]
    })
    .compileComponents();
  }));

  beforeEach(() => {
    fixture = TestBed.createComponent(ResumptionBinComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
