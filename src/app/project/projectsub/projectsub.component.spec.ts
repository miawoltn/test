
    import { async, ComponentFixture, TestBed } from '@angular/core/testing';

import { ProjectsubComponent } from './projectsub.component';

describe('ProjectsubComponent', () => {
  let component: ProjectsubComponent;
  let fixture: ComponentFixture<ProjectsubComponent>;

  beforeEach(async(() => {
    TestBed.configureTestingModule({
      declarations: [ ProjectsubComponent ]
    })
    .compileComponents();
  }));

  beforeEach(() => {
    fixture = TestBed.createComponent(ProjectsubComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});

