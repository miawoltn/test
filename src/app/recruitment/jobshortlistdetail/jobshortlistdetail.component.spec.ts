
    import { async, ComponentFixture, TestBed } from '@angular/core/testing';

import { JobshortlistdetailComponent } from './jobshortlistdetail.component';

describe('JobshortlistdetailComponent', () => {
  let component: JobshortlistdetailComponent;
  let fixture: ComponentFixture<JobshortlistdetailComponent>;

  beforeEach(async(() => {
    TestBed.configureTestingModule({
      declarations: [ JobshortlistdetailComponent ]
    })
    .compileComponents();
  }));

  beforeEach(() => {
    fixture = TestBed.createComponent(JobshortlistdetailComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});

