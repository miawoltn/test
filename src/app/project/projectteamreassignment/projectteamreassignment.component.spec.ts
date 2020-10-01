
    import { async, ComponentFixture, TestBed } from '@angular/core/testing';

import { ProjectteamreassignmentComponent } from './projectteamreassignment.component';

describe('ProjectteamreassignmentComponent', () => {
  let component: ProjectteamreassignmentComponent;
  let fixture: ComponentFixture<ProjectteamreassignmentComponent>;

  beforeEach(async(() => {
    TestBed.configureTestingModule({
      declarations: [ ProjectteamreassignmentComponent ]
    })
    .compileComponents();
  }));

  beforeEach(() => {
    fixture = TestBed.createComponent(ProjectteamreassignmentComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});

