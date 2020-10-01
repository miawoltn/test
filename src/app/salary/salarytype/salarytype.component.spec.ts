
    import { async, ComponentFixture, TestBed } from '@angular/core/testing';

import { SalarytypeComponent } from './salarytype.component';

describe('SalarytypeComponent', () => {
  let component: SalarytypeComponent;
  let fixture: ComponentFixture<SalarytypeComponent>;

  beforeEach(async(() => {
    TestBed.configureTestingModule({
      declarations: [ SalarytypeComponent ]
    })
    .compileComponents();
  }));

  beforeEach(() => {
    fixture = TestBed.createComponent(SalarytypeComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});

