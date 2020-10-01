
    import { async, ComponentFixture, TestBed } from '@angular/core/testing';

import { Shift_typesComponent } from './shift_types.component';

describe('Shift_typesComponent', () => {
  let component: Shift_typesComponent;
  let fixture: ComponentFixture<Shift_typesComponent>;

  beforeEach(async(() => {
    TestBed.configureTestingModule({
      declarations: [ Shift_typesComponent ]
    })
    .compileComponents();
  }));

  beforeEach(() => {
    fixture = TestBed.createComponent(Shift_typesComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});

