import { async, ComponentFixture, TestBed } from '@angular/core/testing';

import { ProjecttoolComponent } from './projecttool.component';

describe('ProjecttoolComponent', () => {
    let component: ProjecttoolComponent;
    let fixture: ComponentFixture<ProjecttoolComponent>;

    beforeEach(async(() => {
        TestBed.configureTestingModule({
            declarations: [ProjecttoolComponent],
        }).compileComponents();
    }));

    beforeEach(() => {
        fixture = TestBed.createComponent(ProjecttoolComponent);
        component = fixture.componentInstance;
        fixture.detectChanges();
    });

    it('should create', () => {
        expect(component).toBeTruthy();
    });
});
