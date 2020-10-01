
    import { async, ComponentFixture, TestBed } from '@angular/core/testing';

import { ProjectsubcategoryComponent } from './projectsubcategory.component';

describe('ProjectsubcategoryComponent', () => {
  let component: ProjectsubcategoryComponent;
  let fixture: ComponentFixture<ProjectsubcategoryComponent>;

  beforeEach(async(() => {
    TestBed.configureTestingModule({
      declarations: [ ProjectsubcategoryComponent ]
    })
    .compileComponents();
  }));

  beforeEach(() => {
    fixture = TestBed.createComponent(ProjectsubcategoryComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});

