import { async, ComponentFixture, TestBed } from '@angular/core/testing';

import { SystemclassComponent } from './systemclass.component';

describe('SystemclassComponent', () => {
  let component: SystemclassComponent;
  let fixture: ComponentFixture<SystemclassComponent>;

  beforeEach(async(() => {
    TestBed.configureTestingModule({
      declarations: [ SystemclassComponent ]
    })
    .compileComponents();
  }));

  beforeEach(() => {
    fixture = TestBed.createComponent(SystemclassComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});

