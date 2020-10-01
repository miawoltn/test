
    import { async, ComponentFixture, TestBed } from '@angular/core/testing';

import { Shift_template_detailsComponent } from './shift_template_details.component';

describe('Shift_template_detailsComponent', () => {
  let component: Shift_template_detailsComponent;
  let fixture: ComponentFixture<Shift_template_detailsComponent>;

  beforeEach(async(() => {
    TestBed.configureTestingModule({
      declarations: [ Shift_template_detailsComponent ]
    })
    .compileComponents();
  }));

  beforeEach(() => {
    fixture = TestBed.createComponent(Shift_template_detailsComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});

