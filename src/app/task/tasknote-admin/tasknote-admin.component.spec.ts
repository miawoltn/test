import { async, ComponentFixture, TestBed } from '@angular/core/testing';
import { TasknoteAdminComponent } from './tasknote-admin.component';

describe('TasknoteAdminComponent', () => {
    let component: TasknoteAdminComponent;
    let fixture: ComponentFixture<TasknoteAdminComponent>;

    beforeEach(async(() => {
        TestBed.configureTestingModule({
            declarations: [TasknoteAdminComponent],
        }).compileComponents();
    }));

    beforeEach(() => {
        fixture = TestBed.createComponent(TasknoteAdminComponent);
        component = fixture.componentInstance;
        fixture.detectChanges();
    });

    it('should create', () => {
        expect(component).toBeTruthy();
    });
});
