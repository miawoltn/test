import { async, ComponentFixture, TestBed } from '@angular/core/testing';

import { ProcurementvendorComponent } from './procurementvendor.component';

describe('ProcurementvendorComponent', () => {
    let component: ProcurementvendorComponent;
    let fixture: ComponentFixture<ProcurementvendorComponent>;

    beforeEach(async(() => {
        TestBed.configureTestingModule({
            declarations: [ProcurementvendorComponent],
        }).compileComponents();
    }));

    beforeEach(() => {
        fixture = TestBed.createComponent(ProcurementvendorComponent);
        component = fixture.componentInstance;
        fixture.detectChanges();
    });

    it('should create', () => {
        expect(component).toBeTruthy();
    });
});
