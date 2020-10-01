
    import { async, ComponentFixture, TestBed } from '@angular/core/testing';

import { SalarycomponentsComponent } from './salarycomponents.component';

describe('SalarycomponentsComponent', () => {
  let component: SalarycomponentsComponent;
  let fixture: ComponentFixture<SalarycomponentsComponent>;

  beforeEach(async(() => {
    TestBed.configureTestingModule({
      declarations: [ SalarycomponentsComponent ]
    })
    .compileComponents();
  }));

  beforeEach(() => {
    fixture = TestBed.createComponent(SalarycomponentsComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});

