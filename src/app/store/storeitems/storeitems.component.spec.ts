
    import { async, ComponentFixture, TestBed } from '@angular/core/testing';

import { StoreitemsComponent } from './storeitems.component';

describe('StoreitemsComponent', () => {
  let component: StoreitemsComponent;
  let fixture: ComponentFixture<StoreitemsComponent>;

  beforeEach(async(() => {
    TestBed.configureTestingModule({
      declarations: [ StoreitemsComponent ]
    })
    .compileComponents();
  }));

  beforeEach(() => {
    fixture = TestBed.createComponent(StoreitemsComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});

