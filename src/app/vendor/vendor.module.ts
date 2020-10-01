import { NgModule } from '@angular/core';
import { CommonModule } from '@angular/common';

import { VendorRoutingModule } from './vendor-routing.module';
import { VendorComponent } from './vendor/vendor.component';
import { VendorcategoryComponent } from './vendorcategory/vendorcategory.component';
import { VendorsComponent } from './vendors/vendors.component';
import { VendortypeComponent } from './vendortype/vendortype.component';
import { FormsModule } from '@angular/forms';
import { MatIconModule } from '@angular/material/icon';
import { MatStepperModule } from '@angular/material/stepper';
import { NgSelectModule } from '@ng-select/ng-select';
import {
    DxSelectBoxModule,
    DxTextAreaModule,
    DxDateBoxModule,
    DxFormModule,
    DxDataGridModule,
    DxSpeedDialActionModule,
} from 'devextreme-angular';

@NgModule({
    imports: [
        CommonModule,
        VendorRoutingModule,
        FormsModule,
        NgSelectModule,
        MatStepperModule,
        MatIconModule,
        DxSelectBoxModule,
        DxTextAreaModule,
        DxDateBoxModule,
        DxFormModule,
        DxDataGridModule,
        DxSpeedDialActionModule,
    ],
    declarations: [
        VendorComponent,
        VendorcategoryComponent,
        VendorsComponent,
        VendortypeComponent,
    ],
})
export class VendorModule {}
