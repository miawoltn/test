import { async, ComponentFixture, TestBed } from '@angular/core/testing';

import { ProjectdocumentuploadComponent } from './projectdocumentupload.component';

describe('ProjectdocumentuploadComponent', () => {
    let component: ProjectdocumentuploadComponent;
    let fixture: ComponentFixture<ProjectdocumentuploadComponent>;

    beforeEach(async(() => {
        TestBed.configureTestingModule({
            declarations: [ProjectdocumentuploadComponent],
        }).compileComponents();
    }));

    beforeEach(() => {
        fixture = TestBed.createComponent(ProjectdocumentuploadComponent);
        component = fixture.componentInstance;
        fixture.detectChanges();
    });

    it('should create', () => {
        expect(component).toBeTruthy();
    });
});
