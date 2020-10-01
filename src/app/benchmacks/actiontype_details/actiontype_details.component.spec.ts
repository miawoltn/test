import { async, ComponentFixture, TestBed } from '@angular/core/testing';

import { Actiontype_detailsComponent } from './actiontype_details.component';

describe('Actiontype_detailsComponent', () => {
  let component: Actiontype_detailsComponent;
  let fixture: ComponentFixture<Actiontype_detailsComponent>;

  beforeEach(async(() => {
    TestBed.configureTestingModule({
      declarations: [ Actiontype_detailsComponent ]
    })
    .compileComponents();
  }));

  beforeEach(() => {
    fixture = TestBed.createComponent(Actiontype_detailsComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});

