import { async, ComponentFixture, TestBed } from '@angular/core/testing';

import { QueryevaluationComponent } from './queryevaluation.component';

describe('QueryevaluationComponent', () => {
  let component: QueryevaluationComponent;
  let fixture: ComponentFixture<QueryevaluationComponent>;

  beforeEach(async(() => {
    TestBed.configureTestingModule({
      declarations: [ QueryevaluationComponent ]
    })
    .compileComponents();
  }));

  beforeEach(() => {
    fixture = TestBed.createComponent(QueryevaluationComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
