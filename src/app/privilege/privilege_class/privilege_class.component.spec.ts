import { async, ComponentFixture, TestBed } from '@angular/core/testing';

import { Privilege_classComponent } from './privilege_class.component';

describe('Privilege_classComponent', () => {
    let component: Privilege_classComponent;
    let fixture: ComponentFixture<Privilege_classComponent>;

    beforeEach(async(() => {
        TestBed.configureTestingModule({
            declarations: [Privilege_classComponent],
        }).compileComponents();
    }));

    beforeEach(() => {
        fixture = TestBed.createComponent(Privilege_classComponent);
        component = fixture.componentInstance;
        fixture.detectChanges();
    });

    it('should create', () => {
        expect(component).toBeTruthy();
    });
});
