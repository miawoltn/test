
    import { async, ComponentFixture, TestBed } from '@angular/core/testing';

import { JobinterviewComponent } from './jobinterview.component';

describe('JobinterviewComponent', () => {
  let component: JobinterviewComponent;
  let fixture: ComponentFixture<JobinterviewComponent>;

  beforeEach(async(() => {
    TestBed.configureTestingModule({
      declarations: [ JobinterviewComponent ]
    })
    .compileComponents();
  }));

  beforeEach(() => {
    fixture = TestBed.createComponent(JobinterviewComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});

