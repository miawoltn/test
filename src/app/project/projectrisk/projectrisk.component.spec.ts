import { async, ComponentFixture, TestBed } from '@angular/core/testing';

import { ProjectriskComponent } from './projectrisk.component';

describe('ProjectriskComponent', () => {
    let component: ProjectriskComponent;
    let fixture: ComponentFixture<ProjectriskComponent>;

    beforeEach(async(() => {
        TestBed.configureTestingModule({
            declarations: [ProjectriskComponent],
        }).compileComponents();
    }));

    beforeEach(() => {
        fixture = TestBed.createComponent(ProjectriskComponent);
        component = fixture.componentInstance;
        fixture.detectChanges();
    });

    it('should create', () => {
        expect(component).toBeTruthy();
    });
});
