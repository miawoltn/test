
    import { async, ComponentFixture, TestBed } from '@angular/core/testing';

import { EmployeetitleComponent } from './employeetitle.component';

describe('EmployeetitleComponent', () => {
  let component: EmployeetitleComponent;
  let fixture: ComponentFixture<EmployeetitleComponent>;

  beforeEach(async(() => {
    TestBed.configureTestingModule({
      declarations: [ EmployeetitleComponent ]
    })
    .compileComponents();
  }));

  beforeEach(() => {
    fixture = TestBed.createComponent(EmployeetitleComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});

