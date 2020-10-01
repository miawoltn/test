
    import { async, ComponentFixture, TestBed } from '@angular/core/testing';

import { SalarytaxstatusComponent } from './salarytaxstatus.component';

describe('SalarytaxstatusComponent', () => {
  let component: SalarytaxstatusComponent;
  let fixture: ComponentFixture<SalarytaxstatusComponent>;

  beforeEach(async(() => {
    TestBed.configureTestingModule({
      declarations: [ SalarytaxstatusComponent ]
    })
    .compileComponents();
  }));

  beforeEach(() => {
    fixture = TestBed.createComponent(SalarytaxstatusComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});

