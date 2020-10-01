import { async, ComponentFixture, TestBed } from '@angular/core/testing';

import { KpiconfigComponent } from './kpiconfig.component';

describe('KpiconfigComponent', () => {
  let component: KpiconfigComponent;
  let fixture: ComponentFixture<KpiconfigComponent>;

  beforeEach(async(() => {
    TestBed.configureTestingModule({
      declarations: [ KpiconfigComponent ]
    })
    .compileComponents();
  }));

  beforeEach(() => {
    fixture = TestBed.createComponent(KpiconfigComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});

