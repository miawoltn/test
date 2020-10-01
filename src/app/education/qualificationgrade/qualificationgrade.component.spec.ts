
    import { async, ComponentFixture, TestBed } from '@angular/core/testing';

import { QualificationgradeComponent } from './qualificationgrade.component';

describe('QualificationgradeComponent', () => {
  let component: QualificationgradeComponent;
  let fixture: ComponentFixture<QualificationgradeComponent>;

  beforeEach(async(() => {
    TestBed.configureTestingModule({
      declarations: [ QualificationgradeComponent ]
    })
    .compileComponents();
  }));

  beforeEach(() => {
    fixture = TestBed.createComponent(QualificationgradeComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});

