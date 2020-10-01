import { async, ComponentFixture, TestBed } from '@angular/core/testing';

import { Privilege_detailsComponent } from './privilege_details.component';

describe('Privilege_detailsComponent', () => {
    let component: Privilege_detailsComponent;
    let fixture: ComponentFixture<Privilege_detailsComponent>;

    beforeEach(async(() => {
        TestBed.configureTestingModule({
            declarations: [Privilege_detailsComponent],
        }).compileComponents();
    }));

    beforeEach(() => {
        fixture = TestBed.createComponent(Privilege_detailsComponent);
        component = fixture.componentInstance;
        fixture.detectChanges();
    });

    it('should create', () => {
        expect(component).toBeTruthy();
    });
});
