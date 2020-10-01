import { async, ComponentFixture, TestBed } from '@angular/core/testing';

import { Kpi_classscoringComponent } from './kpi_classscoring.component';

describe('Kpi_classscoringComponent', () => {
  let component: Kpi_classscoringComponent;
  let fixture: ComponentFixture<Kpi_classscoringComponent>;

  beforeEach(async(() => {
    TestBed.configureTestingModule({
      declarations: [ Kpi_classscoringComponent ]
    })
    .compileComponents();
  }));

  beforeEach(() => {
    fixture = TestBed.createComponent(Kpi_classscoringComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});

