
    import { async, ComponentFixture, TestBed } from '@angular/core/testing';

import { WorkforceoptionsComponent } from './workforceoptions.component';

describe('WorkforceoptionsComponent', () => {
  let component: WorkforceoptionsComponent;
  let fixture: ComponentFixture<WorkforceoptionsComponent>;

  beforeEach(async(() => {
    TestBed.configureTestingModule({
      declarations: [ WorkforceoptionsComponent ]
    })
    .compileComponents();
  }));

  beforeEach(() => {
    fixture = TestBed.createComponent(WorkforceoptionsComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});

