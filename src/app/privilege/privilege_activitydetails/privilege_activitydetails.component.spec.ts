import { async, ComponentFixture, TestBed } from '@angular/core/testing';

import { Privilege_activitydetailsComponent } from './privilege_activitydetails.component';

describe('Privilege_activitydetailsComponent', () => {
    let component: Privilege_activitydetailsComponent;
    let fixture: ComponentFixture<Privilege_activitydetailsComponent>;

    beforeEach(async(() => {
        TestBed.configureTestingModule({
            declarations: [Privilege_activitydetailsComponent],
        }).compileComponents();
    }));

    beforeEach(() => {
        fixture = TestBed.createComponent(Privilege_activitydetailsComponent);
        component = fixture.componentInstance;
        fixture.detectChanges();
    });

    it('should create', () => {
        expect(component).toBeTruthy();
    });
});
