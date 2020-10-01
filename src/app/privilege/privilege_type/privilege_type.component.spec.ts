import { async, ComponentFixture, TestBed } from '@angular/core/testing';

import { Privilege_typeComponent } from './privilege_type.component';

describe('Privilege_typeComponent', () => {
    let component: Privilege_typeComponent;
    let fixture: ComponentFixture<Privilege_typeComponent>;

    beforeEach(async(() => {
        TestBed.configureTestingModule({
            declarations: [Privilege_typeComponent],
        }).compileComponents();
    }));

    beforeEach(() => {
        fixture = TestBed.createComponent(Privilege_typeComponent);
        component = fixture.componentInstance;
        fixture.detectChanges();
    });

    it('should create', () => {
        expect(component).toBeTruthy();
    });
});
