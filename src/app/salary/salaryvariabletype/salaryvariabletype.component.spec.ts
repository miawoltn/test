
    import { async, ComponentFixture, TestBed } from '@angular/core/testing';

import { SalaryvariabletypeComponent } from './salaryvariabletype.component';

describe('SalaryvariabletypeComponent', () => {
  let component: SalaryvariabletypeComponent;
  let fixture: ComponentFixture<SalaryvariabletypeComponent>;

  beforeEach(async(() => {
    TestBed.configureTestingModule({
      declarations: [ SalaryvariabletypeComponent ]
    })
    .compileComponents();
  }));

  beforeEach(() => {
    fixture = TestBed.createComponent(SalaryvariabletypeComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});

