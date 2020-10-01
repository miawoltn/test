import { async, ComponentFixture, TestBed } from '@angular/core/testing';

import { Chart_typesComponent } from './chart_types.component';

describe('Chart_typesComponent', () => {
  let component: Chart_typesComponent;
  let fixture: ComponentFixture<Chart_typesComponent>;

  beforeEach(async(() => {
    TestBed.configureTestingModule({
      declarations: [ Chart_typesComponent ]
    })
    .compileComponents();
  }));

  beforeEach(() => {
    fixture = TestBed.createComponent(Chart_typesComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});

