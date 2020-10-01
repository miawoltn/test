import { async, ComponentFixture, TestBed } from '@angular/core/testing';

import { Kpi_typeComponent } from './kpi_type.component';

describe('Kpi_typeComponent', () => {
  let component: Kpi_typeComponent;
  let fixture: ComponentFixture<Kpi_typeComponent>;

  beforeEach(async(() => {
    TestBed.configureTestingModule({
      declarations: [ Kpi_typeComponent ]
    })
    .compileComponents();
  }));

  beforeEach(() => {
    fixture = TestBed.createComponent(Kpi_typeComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});

