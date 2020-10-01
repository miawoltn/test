import { async, ComponentFixture, TestBed } from '@angular/core/testing';

import { Kpi_typescoringComponent } from './kpi_typescoring.component';

describe('Kpi_typescoringComponent', () => {
  let component: Kpi_typescoringComponent;
  let fixture: ComponentFixture<Kpi_typescoringComponent>;

  beforeEach(async(() => {
    TestBed.configureTestingModule({
      declarations: [ Kpi_typescoringComponent ]
    })
    .compileComponents();
  }));

  beforeEach(() => {
    fixture = TestBed.createComponent(Kpi_typescoringComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});

