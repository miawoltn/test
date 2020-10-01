import { async, ComponentFixture, TestBed } from '@angular/core/testing';

import { KpiclassComponent } from './kpiclass.component';

describe('KpiclassComponent', () => {
  let component: KpiclassComponent;
  let fixture: ComponentFixture<KpiclassComponent>;

  beforeEach(async(() => {
    TestBed.configureTestingModule({
      declarations: [ KpiclassComponent ]
    })
    .compileComponents();
  }));

  beforeEach(() => {
    fixture = TestBed.createComponent(KpiclassComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});

