
    import { async, ComponentFixture, TestBed } from '@angular/core/testing';

import { GradelevelsComponent } from './gradelevels.component';

describe('GradelevelsComponent', () => {
  let component: GradelevelsComponent;
  let fixture: ComponentFixture<GradelevelsComponent>;

  beforeEach(async(() => {
    TestBed.configureTestingModule({
      declarations: [ GradelevelsComponent ]
    })
    .compileComponents();
  }));

  beforeEach(() => {
    fixture = TestBed.createComponent(GradelevelsComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});

