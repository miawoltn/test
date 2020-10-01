
    import { async, ComponentFixture, TestBed } from '@angular/core/testing';

import { AccountssubtypeComponent } from './accountssubtype.component';

describe('AccountssubtypeComponent', () => {
  let component: AccountssubtypeComponent;
  let fixture: ComponentFixture<AccountssubtypeComponent>;

  beforeEach(async(() => {
    TestBed.configureTestingModule({
      declarations: [ AccountssubtypeComponent ]
    })
    .compileComponents();
  }));

  beforeEach(() => {
    fixture = TestBed.createComponent(AccountssubtypeComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});

