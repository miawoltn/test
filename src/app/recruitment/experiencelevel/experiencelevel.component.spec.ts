
    import { async, ComponentFixture, TestBed } from '@angular/core/testing';

import { ExperiencelevelComponent } from './experiencelevel.component';

describe('ExperiencelevelComponent', () => {
  let component: ExperiencelevelComponent;
  let fixture: ComponentFixture<ExperiencelevelComponent>;

  beforeEach(async(() => {
    TestBed.configureTestingModule({
      declarations: [ ExperiencelevelComponent ]
    })
    .compileComponents();
  }));

  beforeEach(() => {
    fixture = TestBed.createComponent(ExperiencelevelComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});

