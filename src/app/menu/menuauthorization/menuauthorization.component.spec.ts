import { async, ComponentFixture, TestBed } from '@angular/core/testing';

import { MenuauthorizationComponent } from './menuauthorization.component';

describe('MenuauthorizationComponent', () => {
    let component: MenuauthorizationComponent;
    let fixture: ComponentFixture<MenuauthorizationComponent>;

    beforeEach(async(() => {
        TestBed.configureTestingModule({
            declarations: [MenuauthorizationComponent],
        }).compileComponents();
    }));

    beforeEach(() => {
        fixture = TestBed.createComponent(MenuauthorizationComponent);
        component = fixture.componentInstance;
        fixture.detectChanges();
    });

    it('should create', () => {
        expect(component).toBeTruthy();
    });
});
