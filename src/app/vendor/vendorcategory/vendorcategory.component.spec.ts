import { async, ComponentFixture, TestBed } from '@angular/core/testing';

import { VendorcategoryComponent } from './vendorcategory.component';

describe('VendorcategoryComponent', () => {
    let component: VendorcategoryComponent;
    let fixture: ComponentFixture<VendorcategoryComponent>;

    beforeEach(async(() => {
        TestBed.configureTestingModule({
            declarations: [VendorcategoryComponent],
        }).compileComponents();
    }));

    beforeEach(() => {
        fixture = TestBed.createComponent(VendorcategoryComponent);
        component = fixture.componentInstance;
        fixture.detectChanges();
    });

    it('should create', () => {
        expect(component).toBeTruthy();
    });
});
