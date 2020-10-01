
    import { async, ComponentFixture, TestBed } from '@angular/core/testing';

import { EmploymenttypeComponent } from './employmenttype.component';

describe('EmploymenttypeComponent', () => {
  let component: EmploymenttypeComponent;
  let fixture: ComponentFixture<EmploymenttypeComponent>;

  beforeEach(async(() => {
    TestBed.configureTestingModule({
      declarations: [ EmploymenttypeComponent ]
    })
    .compileComponents();
  }));

  beforeEach(() => {
    fixture = TestBed.createComponent(EmploymenttypeComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});

