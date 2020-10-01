import { async, ComponentFixture, TestBed } from '@angular/core/testing';

import { RateTasksComponent } from './rate-tasks.component';

describe('RateTasksComponent', () => {
  let component: RateTasksComponent;
  let fixture: ComponentFixture<RateTasksComponent>;

  beforeEach(async(() => {
    TestBed.configureTestingModule({
      declarations: [ RateTasksComponent ]
    })
    .compileComponents();
  }));

  beforeEach(() => {
    fixture = TestBed.createComponent(RateTasksComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
