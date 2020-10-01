import { NgModule } from '@angular/core';
import { CommonModule } from '@angular/common';

import { ProcurementRoutingModule } from './procurement-routing.module';
import { ProcurementComponent } from './procurement/procurement.component';
import { ProcurementdetailsComponent } from './procurementdetails/procurementdetails.component';
import { ProcurementvendorComponent } from './procurementvendor/procurementvendor.component';
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
import { ProcurementApprovalBinComponent } from './procurement-approval-bin/procurement-approval-bin.component';
import { ProcurementApprovalComponent } from './procurement-approval/procurement-approval.component';

@NgModule({
    imports: [
        CommonModule,
        ProcurementRoutingModule,
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
        ProcurementComponent,
        ProcurementdetailsComponent,
        ProcurementvendorComponent,
        ProcurementApprovalBinComponent,
        ProcurementApprovalComponent
    ],
})
export class ProcurementModule {}
