import { async, ComponentFixture, TestBed } from '@angular/core/testing';
import { TasknoteViewComponent } from './tasknote-view.component';

describe('TasknoteViewComponent', () => {
    let component: TasknoteViewComponent;
    let fixture: ComponentFixture<TasknoteViewComponent>;

    beforeEach(async(() => {
        TestBed.configureTestingModule({
            declarations: [TasknoteViewComponent],
        }).compileComponents();
    }));

    beforeEach(() => {
        fixture = TestBed.createComponent(TasknoteViewComponent);
        component = fixture.componentInstance;
        fixture.detectChanges();
    });

    it('should create', () => {
        expect(component).toBeTruthy();
    });
});
