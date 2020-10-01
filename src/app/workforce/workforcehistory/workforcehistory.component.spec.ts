
    import { async, ComponentFixture, TestBed } from '@angular/core/testing';

import { WorkforcehistoryComponent } from './workforcehistory.component';

describe('WorkforcehistoryComponent', () => {
  let component: WorkforcehistoryComponent;
  let fixture: ComponentFixture<WorkforcehistoryComponent>;

  beforeEach(async(() => {
    TestBed.configureTestingModule({
      declarations: [ WorkforcehistoryComponent ]
    })
    .compileComponents();
  }));

  beforeEach(() => {
    fixture = TestBed.createComponent(WorkforcehistoryComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});

