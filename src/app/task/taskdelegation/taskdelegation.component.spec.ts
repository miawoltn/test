
    import { async, ComponentFixture, TestBed } from '@angular/core/testing';

import { TaskdelegationComponent } from './taskdelegation.component';

describe('TaskdelegationComponent', () => {
  let component: TaskdelegationComponent;
  let fixture: ComponentFixture<TaskdelegationComponent>;

  beforeEach(async(() => {
    TestBed.configureTestingModule({
      declarations: [ TaskdelegationComponent ]
    })
    .compileComponents();
  }));

  beforeEach(() => {
    fixture = TestBed.createComponent(TaskdelegationComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});

