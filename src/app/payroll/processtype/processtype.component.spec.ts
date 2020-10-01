
    import { async, ComponentFixture, TestBed } from '@angular/core/testing';

import { ProcesstypeComponent } from './processtype.component';

describe('ProcesstypeComponent', () => {
  let component: ProcesstypeComponent;
  let fixture: ComponentFixture<ProcesstypeComponent>;

  beforeEach(async(() => {
    TestBed.configureTestingModule({
      declarations: [ ProcesstypeComponent ]
    })
    .compileComponents();
  }));

  beforeEach(() => {
    fixture = TestBed.createComponent(ProcesstypeComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});

