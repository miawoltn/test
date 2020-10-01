import { async, ComponentFixture, TestBed } from '@angular/core/testing';

import { ProjectreviewplanComponent } from './projectreviewplan.component';

describe('ProjectreviewplanComponent', () => {
    let component: ProjectreviewplanComponent;
    let fixture: ComponentFixture<ProjectreviewplanComponent>;

    beforeEach(async(() => {
        TestBed.configureTestingModule({
            declarations: [ProjectreviewplanComponent],
        }).compileComponents();
    }));

    beforeEach(() => {
        fixture = TestBed.createComponent(ProjectreviewplanComponent);
        component = fixture.componentInstance;
        fixture.detectChanges();
    });

    it('should create', () => {
        expect(component).toBeTruthy();
    });
});
