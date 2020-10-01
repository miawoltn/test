
    import { async, ComponentFixture, TestBed } from '@angular/core/testing';

import { Shift_configComponent } from './shift_config.component';

describe('Shift_configComponent', () => {
  let component: Shift_configComponent;
  let fixture: ComponentFixture<Shift_configComponent>;

  beforeEach(async(() => {
    TestBed.configureTestingModule({
      declarations: [ Shift_configComponent ]
    })
    .compileComponents();
  }));

  beforeEach(() => {
    fixture = TestBed.createComponent(Shift_configComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});

