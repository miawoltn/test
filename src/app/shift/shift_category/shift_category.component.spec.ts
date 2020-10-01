
    import { async, ComponentFixture, TestBed } from '@angular/core/testing';

import { Shift_categoryComponent } from './shift_category.component';

describe('Shift_categoryComponent', () => {
  let component: Shift_categoryComponent;
  let fixture: ComponentFixture<Shift_categoryComponent>;

  beforeEach(async(() => {
    TestBed.configureTestingModule({
      declarations: [ Shift_categoryComponent ]
    })
    .compileComponents();
  }));

  beforeEach(() => {
    fixture = TestBed.createComponent(Shift_categoryComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});

