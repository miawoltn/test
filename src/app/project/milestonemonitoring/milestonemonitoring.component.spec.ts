import { async, ComponentFixture, TestBed } from '@angular/core/testing';

import { MilestonemonitoringComponent } from './milestonemonitoring.component';

describe('MilestonemonitoringComponent', () => {
    let component: MilestonemonitoringComponent;
    let fixture: ComponentFixture<MilestonemonitoringComponent>;

    beforeEach(async(() => {
        TestBed.configureTestingModule({
            declarations: [MilestonemonitoringComponent],
        }).compileComponents();
    }));

    beforeEach(() => {
        fixture = TestBed.createComponent(MilestonemonitoringComponent);
        component = fixture.componentInstance;
        fixture.detectChanges();
    });

    it('should create', () => {
        expect(component).toBeTruthy();
    });
});
