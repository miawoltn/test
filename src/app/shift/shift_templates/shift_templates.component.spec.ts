
    import { async, ComponentFixture, TestBed } from '@angular/core/testing';

import { Shift_templatesComponent } from './shift_templates.component';

describe('Shift_templatesComponent', () => {
  let component: Shift_templatesComponent;
  let fixture: ComponentFixture<Shift_templatesComponent>;

  beforeEach(async(() => {
    TestBed.configureTestingModule({
      declarations: [ Shift_templatesComponent ]
    })
    .compileComponents();
  }));

  beforeEach(() => {
    fixture = TestBed.createComponent(Shift_templatesComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});

