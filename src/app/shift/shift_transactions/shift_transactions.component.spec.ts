
    import { async, ComponentFixture, TestBed } from '@angular/core/testing';

import { Shift_transactionsComponent } from './shift_transactions.component';

describe('Shift_transactionsComponent', () => {
  let component: Shift_transactionsComponent;
  let fixture: ComponentFixture<Shift_transactionsComponent>;

  beforeEach(async(() => {
    TestBed.configureTestingModule({
      declarations: [ Shift_transactionsComponent ]
    })
    .compileComponents();
  }));

  beforeEach(() => {
    fixture = TestBed.createComponent(Shift_transactionsComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});

