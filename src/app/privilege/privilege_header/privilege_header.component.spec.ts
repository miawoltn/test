import { async, ComponentFixture, TestBed } from '@angular/core/testing';

import { Privilege_headerComponent } from './privilege_header.component';

describe('Privilege_headerComponent', () => {
    let component: Privilege_headerComponent;
    let fixture: ComponentFixture<Privilege_headerComponent>;

    beforeEach(async(() => {
        TestBed.configureTestingModule({
            declarations: [Privilege_headerComponent],
        }).compileComponents();
    }));

    beforeEach(() => {
        fixture = TestBed.createComponent(Privilege_headerComponent);
        component = fixture.componentInstance;
        fixture.detectChanges();
    });

    it('should create', () => {
        expect(component).toBeTruthy();
    });
});
