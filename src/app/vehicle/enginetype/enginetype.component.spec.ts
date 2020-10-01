
    import { async, ComponentFixture, TestBed } from '@angular/core/testing';

import { EnginetypeComponent } from './enginetype.component';

describe('EnginetypeComponent', () => {
  let component: EnginetypeComponent;
  let fixture: ComponentFixture<EnginetypeComponent>;

  beforeEach(async(() => {
    TestBed.configureTestingModule({
      declarations: [ EnginetypeComponent ]
    })
    .compileComponents();
  }));

  beforeEach(() => {
    fixture = TestBed.createComponent(EnginetypeComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});

