
    import { async, ComponentFixture, TestBed } from '@angular/core/testing';

import { ProgrammetypesComponent } from './programmetypes.component';

describe('ProgrammetypesComponent', () => {
  let component: ProgrammetypesComponent;
  let fixture: ComponentFixture<ProgrammetypesComponent>;

  beforeEach(async(() => {
    TestBed.configureTestingModule({
      declarations: [ ProgrammetypesComponent ]
    })
    .compileComponents();
  }));

  beforeEach(() => {
    fixture = TestBed.createComponent(ProgrammetypesComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});

