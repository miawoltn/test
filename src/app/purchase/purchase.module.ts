import { NgModule } from '@angular/core';
import { CommonModule } from '@angular/common';

import { PurchaseRoutingModule } from './purchase-routing.module';
import { PurchaseComponent } from './purchase/purchase.component';
import { PurchasedetailsComponent } from './purchasedetails/purchasedetails.component';
import { PurchasetypeComponent } from './purchasetype/purchasetype.component';
import { ReceiptComponent } from './receipt/receipt.component';
import { ReceivedetailsComponent } from './receivedetails/receivedetails.component';
import { ReceiveordersComponent } from './receiveorders/receiveorders.component';
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
        PurchaseRoutingModule,
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
        PurchaseComponent,
        PurchasedetailsComponent,
        PurchasetypeComponent,
        ReceiptComponent,
        ReceivedetailsComponent,
        ReceiveordersComponent,
    ],
})
export class PurchaseModule {}
