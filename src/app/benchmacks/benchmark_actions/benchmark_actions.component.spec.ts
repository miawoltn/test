import { async, ComponentFixture, TestBed } from '@angular/core/testing';

import { Benchmark_actionsComponent } from './benchmark_actions.component';

describe('Benchmark_actionsComponent', () => {
  let component: Benchmark_actionsComponent;
  let fixture: ComponentFixture<Benchmark_actionsComponent>;

  beforeEach(async(() => {
    TestBed.configureTestingModule({
      declarations: [ Benchmark_actionsComponent ]
    })
    .compileComponents();
  }));

  beforeEach(() => {
    fixture = TestBed.createComponent(Benchmark_actionsComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});

