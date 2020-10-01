
    import { async, ComponentFixture, TestBed } from '@angular/core/testing';

import { Shift_excludeComponent } from './shift_exclude.component';

describe('Shift_excludeComponent', () => {
  let component: Shift_excludeComponent;
  let fixture: ComponentFixture<Shift_excludeComponent>;

  beforeEach(async(() => {
    TestBed.configureTestingModule({
      declarations: [ Shift_excludeComponent ]
    })
    .compileComponents();
  }));

  beforeEach(() => {
    fixture = TestBed.createComponent(Shift_excludeComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});

