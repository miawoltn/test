import { async, ComponentFixture, TestBed } from '@angular/core/testing';
import { ProjectsubViewComponent } from './projectsub-view.component';

describe('ProjectsubViewComponent', () => {
    let component: ProjectsubViewComponent;
    let fixture: ComponentFixture<ProjectsubViewComponent>;

    beforeEach(async(() => {
        TestBed.configureTestingModule({
            declarations: [ProjectsubViewComponent],
        }).compileComponents();
    }));

    beforeEach(() => {
        fixture = TestBed.createComponent(ProjectsubViewComponent);
        component = fixture.componentInstance;
        fixture.detectChanges();
    });

    it('should create', () => {
        expect(component).toBeTruthy();
    });
});