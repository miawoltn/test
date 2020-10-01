
    import { async, ComponentFixture, TestBed } from '@angular/core/testing';

import { TasknoteComponent } from './tasknote.component';

describe('TasknoteComponent', () => {
  let component: TasknoteComponent;
  let fixture: ComponentFixture<TasknoteComponent>;

  beforeEach(async(() => {
    TestBed.configureTestingModule({
      declarations: [ TasknoteComponent ]
    })
    .compileComponents();
  }));

  beforeEach(() => {
    fixture = TestBed.createComponent(TasknoteComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});

