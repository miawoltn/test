import { async, ComponentFixture, TestBed } from '@angular/core/testing';

import { Chart_providersComponent } from './chart_providers.component';

describe('Chart_providersComponent', () => {
  let component: Chart_providersComponent;
  let fixture: ComponentFixture<Chart_providersComponent>;

  beforeEach(async(() => {
    TestBed.configureTestingModule({
      declarations: [ Chart_providersComponent ]
    })
    .compileComponents();
  }));

  beforeEach(() => {
    fixture = TestBed.createComponent(Chart_providersComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});

