
    import { async, ComponentFixture, TestBed } from '@angular/core/testing';

import { CustomersubtypeComponent } from './customersubtype.component';

describe('CustomersubtypeComponent', () => {
  let component: CustomersubtypeComponent;
  let fixture: ComponentFixture<CustomersubtypeComponent>;

  beforeEach(async(() => {
    TestBed.configureTestingModule({
      declarations: [ CustomersubtypeComponent ]
    })
    .compileComponents();
  }));

  beforeEach(() => {
    fixture = TestBed.createComponent(CustomersubtypeComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});

