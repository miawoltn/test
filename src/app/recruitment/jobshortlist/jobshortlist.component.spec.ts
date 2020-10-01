
    import { async, ComponentFixture, TestBed } from '@angular/core/testing';

import { JobshortlistComponent } from './jobshortlist.component';

describe('JobshortlistComponent', () => {
  let component: JobshortlistComponent;
  let fixture: ComponentFixture<JobshortlistComponent>;

  beforeEach(async(() => {
    TestBed.configureTestingModule({
      declarations: [ JobshortlistComponent ]
    })
    .compileComponents();
  }));

  beforeEach(() => {
    fixture = TestBed.createComponent(JobshortlistComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});

