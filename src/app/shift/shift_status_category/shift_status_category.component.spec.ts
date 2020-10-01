
    import { async, ComponentFixture, TestBed } from '@angular/core/testing';

import { Shift_status_categoryComponent } from './shift_status_category.component';

describe('Shift_status_categoryComponent', () => {
  let component: Shift_status_categoryComponent;
  let fixture: ComponentFixture<Shift_status_categoryComponent>;

  beforeEach(async(() => {
    TestBed.configureTestingModule({
      declarations: [ Shift_status_categoryComponent ]
    })
    .compileComponents();
  }));

  beforeEach(() => {
    fixture = TestBed.createComponent(Shift_status_categoryComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});

