import { async, ComponentFixture, TestBed } from '@angular/core/testing';

import { BenchmarkgraphComponent } from './benchmarkgraph.component';

describe('BenchmarkgraphComponent', () => {
  let component: BenchmarkgraphComponent;
  let fixture: ComponentFixture<BenchmarkgraphComponent>;

  beforeEach(async(() => {
    TestBed.configureTestingModule({
      declarations: [ BenchmarkgraphComponent ]
    })
    .compileComponents();
  }));

  beforeEach(() => {
    fixture = TestBed.createComponent(BenchmarkgraphComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});

