import { async, ComponentFixture, TestBed } from '@angular/core/testing';

import { ExpenselineComponent } from './expenseline.component';

describe('ExpenselineComponent', () => {
    let component: ExpenselineComponent;
    let fixture: ComponentFixture<ExpenselineComponent>;

    beforeEach(async(() => {
        TestBed.configureTestingModule({
            declarations: [ExpenselineComponent],
        }).compileComponents();
    }));

    beforeEach(() => {
        fixture = TestBed.createComponent(ExpenselineComponent);
        component = fixture.componentInstance;
        fixture.detectChanges();
    });

    it('should create', () => {
        expect(component).toBeTruthy();
    });
});
