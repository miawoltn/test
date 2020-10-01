
    import { async, ComponentFixture, TestBed } from '@angular/core/testing';

import { ProjectcategoryComponent } from './projectcategory.component';

describe('ProjectcategoryComponent', () => {
  let component: ProjectcategoryComponent;
  let fixture: ComponentFixture<ProjectcategoryComponent>;

  beforeEach(async(() => {
    TestBed.configureTestingModule({
      declarations: [ ProjectcategoryComponent ]
    })
    .compileComponents();
  }));

  beforeEach(() => {
    fixture = TestBed.createComponent(ProjectcategoryComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});

