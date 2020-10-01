import { NgModule } from '@angular/core';
import { Routes, RouterModule } from '@angular/router';
import { PurchaseComponent } from './purchase/purchase.component';
import { PurchasedetailsComponent } from './purchasedetails/purchasedetails.component';
import { PurchasetypeComponent } from './purchasetype/purchasetype.component';
import { ReceiptComponent } from './receipt/receipt.component';
import { ReceivedetailsComponent } from './receivedetails/receivedetails.component';
import { ReceiveordersComponent } from './receiveorders/receiveorders.component';

const routes: Routes = [
    { path: 'purchase', component: PurchaseComponent },
    { path: 'purchasedetails', component: PurchasedetailsComponent },
    { path: 'purchasetype', component: PurchasetypeComponent },
    { path: 'receipt', component: ReceiptComponent },
    { path: 'receivedetails', component: ReceivedetailsComponent },
    { path: 'receiveorders', component: ReceiveordersComponent },
];

@NgModule({
    imports: [RouterModule.forChild(routes)],
    exports: [RouterModule],
})
export class PurchaseRoutingModule {}
