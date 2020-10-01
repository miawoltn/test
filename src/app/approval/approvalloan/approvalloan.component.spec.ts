
    import { async, ComponentFixture, TestBed } from '@angular/core/testing';

import { ApprovalloanComponent } from './approvalloan.component';

describe('ApprovalloanComponent', () => {
  let component: ApprovalloanComponent;
  let fixture: ComponentFixture<ApprovalloanComponent>;

  beforeEach(async(() => {
    TestBed.configureTestingModule({
      declarations: [ ApprovalloanComponent ]
    })
    .compileComponents();
  }));

  beforeEach(() => {
    fixture = TestBed.createComponent(ApprovalloanComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});

