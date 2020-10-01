import { async, ComponentFixture, TestBed } from '@angular/core/testing';
import { ProcurementApprovalBinComponent } from './procurement-approval-bin.component';

describe('ProcurementApprovalBinComponent', () => {
    let component: ProcurementApprovalBinComponent;
    let fixture: ComponentFixture<ProcurementApprovalBinComponent>;

    beforeEach(async(() => {
        TestBed.configureTestingModule({
            declarations: [ProcurementApprovalBinComponent],
        }).compileComponents();
    }));

    beforeEach(() => {
        fixture = TestBed.createComponent(ProcurementApprovalBinComponent);
        component = fixture.componentInstance;
        fixture.detectChanges();
    });

    it('should create', () => {
        expect(component).toBeTruthy();
    });
});
