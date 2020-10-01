
    import { async, ComponentFixture, TestBed } from '@angular/core/testing';

import { DesignationcategoryComponent } from './designationcategory.component';

describe('DesignationcategoryComponent', () => {
  let component: DesignationcategoryComponent;
  let fixture: ComponentFixture<DesignationcategoryComponent>;

  beforeEach(async(() => {
    TestBed.configureTestingModule({
      declarations: [ DesignationcategoryComponent ]
    })
    .compileComponents();
  }));

  beforeEach(() => {
    fixture = TestBed.createComponent(DesignationcategoryComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});

