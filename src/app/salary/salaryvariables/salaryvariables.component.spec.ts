
    import { async, ComponentFixture, TestBed } from '@angular/core/testing';

import { SalaryvariablesComponent } from './salaryvariables.component';

describe('SalaryvariablesComponent', () => {
  let component: SalaryvariablesComponent;
  let fixture: ComponentFixture<SalaryvariablesComponent>;

  beforeEach(async(() => {
    TestBed.configureTestingModule({
      declarations: [ SalaryvariablesComponent ]
    })
    .compileComponents();
  }));

  beforeEach(() => {
    fixture = TestBed.createComponent(SalaryvariablesComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});

