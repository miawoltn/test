import { async, ComponentFixture, TestBed } from '@angular/core/testing';

import { PeriodtypeComponent } from './periodtype.component';

describe('PeriodtypeComponent', () => {
  let component: PeriodtypeComponent;
  let fixture: ComponentFixture<PeriodtypeComponent>;

  beforeEach(async(() => {
    TestBed.configureTestingModule({
      declarations: [ PeriodtypeComponent ]
    })
    .compileComponents();
  }));

  beforeEach(() => {
    fixture = TestBed.createComponent(PeriodtypeComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});

