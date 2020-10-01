import { async, ComponentFixture, TestBed } from '@angular/core/testing';

import { Chart_categoryComponent } from './chart_category.component';

describe('Chart_categoryComponent', () => {
  let component: Chart_categoryComponent;
  let fixture: ComponentFixture<Chart_categoryComponent>;

  beforeEach(async(() => {
    TestBed.configureTestingModule({
      declarations: [ Chart_categoryComponent ]
    })
    .compileComponents();
  }));

  beforeEach(() => {
    fixture = TestBed.createComponent(Chart_categoryComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});

