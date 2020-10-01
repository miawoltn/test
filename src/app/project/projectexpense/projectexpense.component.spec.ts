import { async, ComponentFixture, TestBed } from '@angular/core/testing';

import { ProjectexpenseComponent } from './projectexpense.component';

describe('ProjectexpenseComponent', () => {
    let component: ProjectexpenseComponent;
    let fixture: ComponentFixture<ProjectexpenseComponent>;

    beforeEach(async(() => {
        TestBed.configureTestingModule({
            declarations: [ProjectexpenseComponent],
        }).compileComponents();
    }));

    beforeEach(() => {
        fixture = TestBed.createComponent(ProjectexpenseComponent);
        component = fixture.componentInstance;
        fixture.detectChanges();
    });

    it('should create', () => {
        expect(component).toBeTruthy();
    });
});
