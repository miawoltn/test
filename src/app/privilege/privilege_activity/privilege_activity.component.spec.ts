import { async, ComponentFixture, TestBed } from '@angular/core/testing';

import { Privilege_activityComponent } from './privilege_activity.component';

describe('Privilege_activityComponent', () => {
    let component: Privilege_activityComponent;
    let fixture: ComponentFixture<Privilege_activityComponent>;

    beforeEach(async(() => {
        TestBed.configureTestingModule({
            declarations: [Privilege_activityComponent],
        }).compileComponents();
    }));

    beforeEach(() => {
        fixture = TestBed.createComponent(Privilege_activityComponent);
        component = fixture.componentInstance;
        fixture.detectChanges();
    });

    it('should create', () => {
        expect(component).toBeTruthy();
    });
});
