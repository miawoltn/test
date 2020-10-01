import { async, ComponentFixture, TestBed } from '@angular/core/testing';
import { ProjectsubInfoComponent } from './projectsub-info.component';

describe('ProjectsubInfoComponent', () => {
    let component: ProjectsubInfoComponent;
    let fixture: ComponentFixture<ProjectsubInfoComponent>;

    beforeEach(async(() => {
        TestBed.configureTestingModule({
            declarations: [ProjectsubInfoComponent],
        }).compileComponents();
    }));

    beforeEach(() => {
        fixture = TestBed.createComponent(ProjectsubInfoComponent);
        component = fixture.componentInstance;
        fixture.detectChanges();
    });

    it('should create', () => {
        expect(component).toBeTruthy();
    });
});