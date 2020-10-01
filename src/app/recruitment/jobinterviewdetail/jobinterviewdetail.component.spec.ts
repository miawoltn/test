
    import { async, ComponentFixture, TestBed } from '@angular/core/testing';

import { JobinterviewdetailComponent } from './jobinterviewdetail.component';

describe('JobinterviewdetailComponent', () => {
  let component: JobinterviewdetailComponent;
  let fixture: ComponentFixture<JobinterviewdetailComponent>;

  beforeEach(async(() => {
    TestBed.configureTestingModule({
      declarations: [ JobinterviewdetailComponent ]
    })
    .compileComponents();
  }));

  beforeEach(() => {
    fixture = TestBed.createComponent(JobinterviewdetailComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});

