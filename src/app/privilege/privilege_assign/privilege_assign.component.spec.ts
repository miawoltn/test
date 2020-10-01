import { async, ComponentFixture, TestBed } from '@angular/core/testing';

import { Privilege_assignComponent } from './privilege_assign.component';

describe('Privilege_assignComponent', () => {
    let component: Privilege_assignComponent;
    let fixture: ComponentFixture<Privilege_assignComponent>;

    beforeEach(async(() => {
        TestBed.configureTestingModule({
            declarations: [Privilege_assignComponent],
        }).compileComponents();
    }));

    beforeEach(() => {
        fixture = TestBed.createComponent(Privilege_assignComponent);
        component = fixture.componentInstance;
        fixture.detectChanges();
    });

    it('should create', () => {
        expect(component).toBeTruthy();
    });
});
