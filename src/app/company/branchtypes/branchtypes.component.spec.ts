
    import { async, ComponentFixture, TestBed } from '@angular/core/testing';

import { BranchtypesComponent } from './branchtypes.component';

describe('BranchtypesComponent', () => {
  let component: BranchtypesComponent;
  let fixture: ComponentFixture<BranchtypesComponent>;

  beforeEach(async(() => {
    TestBed.configureTestingModule({
      declarations: [ BranchtypesComponent ]
    })
    .compileComponents();
  }));

  beforeEach(() => {
    fixture = TestBed.createComponent(BranchtypesComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});

