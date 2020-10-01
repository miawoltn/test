import { async, ComponentFixture, TestBed } from '@angular/core/testing';

import { MyPaySlipsComponent } from './my-pay-slips.component';

describe('MyPaySlipsComponent', () => {
  let component: MyPaySlipsComponent;
  let fixture: ComponentFixture<MyPaySlipsComponent>;

  beforeEach(async(() => {
    TestBed.configureTestingModule({
      declarations: [ MyPaySlipsComponent ]
    })
    .compileComponents();
  }));

  beforeEach(() => {
    fixture = TestBed.createComponent(MyPaySlipsComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
