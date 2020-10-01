
    import { async, ComponentFixture, TestBed } from '@angular/core/testing';

import { ItemstatusComponent } from './itemstatus.component';

describe('ItemstatusComponent', () => {
  let component: ItemstatusComponent;
  let fixture: ComponentFixture<ItemstatusComponent>;

  beforeEach(async(() => {
    TestBed.configureTestingModule({
      declarations: [ ItemstatusComponent ]
    })
    .compileComponents();
  }));

  beforeEach(() => {
    fixture = TestBed.createComponent(ItemstatusComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});

