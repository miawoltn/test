
    import { async, ComponentFixture, TestBed } from '@angular/core/testing';

import { SchooltypesComponent } from './schooltypes.component';

describe('SchooltypesComponent', () => {
  let component: SchooltypesComponent;
  let fixture: ComponentFixture<SchooltypesComponent>;

  beforeEach(async(() => {
    TestBed.configureTestingModule({
      declarations: [ SchooltypesComponent ]
    })
    .compileComponents();
  }));

  beforeEach(() => {
    fixture = TestBed.createComponent(SchooltypesComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});

