
    import { async, ComponentFixture, TestBed } from '@angular/core/testing';

import { SalaryvariablecategoryComponent } from './salaryvariablecategory.component';

describe('SalaryvariablecategoryComponent', () => {
  let component: SalaryvariablecategoryComponent;
  let fixture: ComponentFixture<SalaryvariablecategoryComponent>;

  beforeEach(async(() => {
    TestBed.configureTestingModule({
      declarations: [ SalaryvariablecategoryComponent ]
    })
    .compileComponents();
  }));

  beforeEach(() => {
    fixture = TestBed.createComponent(SalaryvariablecategoryComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});

