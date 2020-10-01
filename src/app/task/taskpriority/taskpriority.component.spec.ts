
    import { async, ComponentFixture, TestBed } from '@angular/core/testing';

import { TaskpriorityComponent } from './taskpriority.component';

describe('TaskpriorityComponent', () => {
  let component: TaskpriorityComponent;
  let fixture: ComponentFixture<TaskpriorityComponent>;

  beforeEach(async(() => {
    TestBed.configureTestingModule({
      declarations: [ TaskpriorityComponent ]
    })
    .compileComponents();
  }));

  beforeEach(() => {
    fixture = TestBed.createComponent(TaskpriorityComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});

