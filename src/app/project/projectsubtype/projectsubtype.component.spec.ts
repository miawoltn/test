import { async, ComponentFixture, TestBed } from '@angular/core/testing';

import { ProjectsubtypeComponent } from './projectsubtype.component';

describe('ProjectsubtypeComponent', () => {
    let component: ProjectsubtypeComponent;
    let fixture: ComponentFixture<ProjectsubtypeComponent>;

    beforeEach(async(() => {
        TestBed.configureTestingModule({
            declarations: [ProjectsubtypeComponent],
        }).compileComponents();
    }));

    beforeEach(() => {
        fixture = TestBed.createComponent(ProjectsubtypeComponent);
        component = fixture.componentInstance;
        fixture.detectChanges();
    });

    it('should create', () => {
        expect(component).toBeTruthy();
    });
});
