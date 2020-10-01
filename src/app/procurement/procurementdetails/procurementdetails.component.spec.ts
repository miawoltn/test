import { async, ComponentFixture, TestBed } from '@angular/core/testing';

import { ProcurementdetailsComponent } from './procurementdetails.component';

describe('ProcurementdetailsComponent', () => {
    let component: ProcurementdetailsComponent;
    let fixture: ComponentFixture<ProcurementdetailsComponent>;

    beforeEach(async(() => {
        TestBed.configureTestingModule({
            declarations: [ProcurementdetailsComponent],
        }).compileComponents();
    }));

    beforeEach(() => {
        fixture = TestBed.createComponent(ProcurementdetailsComponent);
        component = fixture.componentInstance;
        fixture.detectChanges();
    });

    it('should create', () => {
        expect(component).toBeTruthy();
    });
});
