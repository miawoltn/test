
    import { async, ComponentFixture, TestBed } from '@angular/core/testing';

import { SalaryformulaeComponent } from './salaryformulae.component';

describe('SalaryformulaeComponent', () => {
  let component: SalaryformulaeComponent;
  let fixture: ComponentFixture<SalaryformulaeComponent>;

  beforeEach(async(() => {
    TestBed.configureTestingModule({
      declarations: [ SalaryformulaeComponent ]
    })
    .compileComponents();
  }));

  beforeEach(() => {
    fixture = TestBed.createComponent(SalaryformulaeComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});

