import { async, ComponentFixture, TestBed } from '@angular/core/testing';

import { SelfServiceModalComponent } from './self-service-modal.component';

describe('SelfServiceModalComponent', () => {
  let component: SelfServiceModalComponent;
  let fixture: ComponentFixture<SelfServiceModalComponent>;

  beforeEach(async(() => {
    TestBed.configureTestingModule({
      declarations: [ SelfServiceModalComponent ]
    })
    .compileComponents();
  }));

  beforeEach(() => {
    fixture = TestBed.createComponent(SelfServiceModalComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
