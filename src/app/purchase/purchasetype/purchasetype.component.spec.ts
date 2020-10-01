import { async, ComponentFixture, TestBed } from '@angular/core/testing';

import { PurchasetypeComponent } from './purchasetype.component';

describe('PurchasetypeComponent', () => {
    let component: PurchasetypeComponent;
    let fixture: ComponentFixture<PurchasetypeComponent>;

    beforeEach(async(() => {
        TestBed.configureTestingModule({
            declarations: [PurchasetypeComponent],
        }).compileComponents();
    }));

    beforeEach(() => {
        fixture = TestBed.createComponent(PurchasetypeComponent);
        component = fixture.componentInstance;
        fixture.detectChanges();
    });

    it('should create', () => {
        expect(component).toBeTruthy();
    });
});
