
    import { async, ComponentFixture, TestBed } from '@angular/core/testing';

import { DepartmentgroupComponent } from './departmentgroup.component';

describe('DepartmentgroupComponent', () => {
  let component: DepartmentgroupComponent;
  let fixture: ComponentFixture<DepartmentgroupComponent>;

  beforeEach(async(() => {
    TestBed.configureTestingModule({
      declarations: [ DepartmentgroupComponent ]
    })
    .compileComponents();
  }));

  beforeEach(() => {
    fixture = TestBed.createComponent(DepartmentgroupComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});

