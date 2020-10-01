import { async, ComponentFixture, TestBed } from '@angular/core/testing';

import { KpiBinComponent } from './kpi-bin.component';

describe('KpiBinComponent', () => {
  let component: KpiBinComponent;
  let fixture: ComponentFixture<KpiBinComponent>;

  beforeEach(async(() => {
    TestBed.configureTestingModule({
      declarations: [ KpiBinComponent ]
    })
    .compileComponents();
  }));

  beforeEach(() => {
    fixture = TestBed.createComponent(KpiBinComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
