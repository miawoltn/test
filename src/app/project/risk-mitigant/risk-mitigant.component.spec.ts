import { async, ComponentFixture, TestBed } from '@angular/core/testing';

import { RiskMitigantComponent } from './risk-mitigant.component';

describe('RiskMitigantComponent', () => {
    let component: RiskMitigantComponent;
    let fixture: ComponentFixture<RiskMitigantComponent>;

    beforeEach(async(() => {
        TestBed.configureTestingModule({
            declarations: [RiskMitigantComponent],
        }).compileComponents();
    }));

    beforeEach(() => {
        fixture = TestBed.createComponent(RiskMitigantComponent);
        component = fixture.componentInstance;
        fixture.detectChanges();
    });

    it('should create', () => {
        expect(component).toBeTruthy();
    });
});
