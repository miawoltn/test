
    import { async, ComponentFixture, TestBed } from '@angular/core/testing';

import { ProcesspayrollComponent } from './processpayroll.component';

describe('ProcesspayrollComponent', () => {
  let component: ProcesspayrollComponent;
  let fixture: ComponentFixture<ProcesspayrollComponent>;

  beforeEach(async(() => {
    TestBed.configureTestingModule({
      declarations: [ ProcesspayrollComponent ]
    })
    .compileComponents();
  }));

  beforeEach(() => {
    fixture = TestBed.createComponent(ProcesspayrollComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});

