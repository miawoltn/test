
    import { async, ComponentFixture, TestBed } from '@angular/core/testing';

import { Shift_statusComponent } from './shift_status.component';

describe('Shift_statusComponent', () => {
  let component: Shift_statusComponent;
  let fixture: ComponentFixture<Shift_statusComponent>;

  beforeEach(async(() => {
    TestBed.configureTestingModule({
      declarations: [ Shift_statusComponent ]
    })
    .compileComponents();
  }));

  beforeEach(() => {
    fixture = TestBed.createComponent(Shift_statusComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});

