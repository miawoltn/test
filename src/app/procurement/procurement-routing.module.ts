import { NgModule } from '@angular/core';
import { Routes, RouterModule } from '@angular/router';
import { ProcurementComponent } from './procurement/procurement.component';
import { ProcurementdetailsComponent } from './procurementdetails/procurementdetails.component';
import { ProcurementvendorComponent } from './procurementvendor/procurementvendor.component';
import { ProcurementApprovalBinComponent } from './procurement-approval-bin/procurement-approval-bin.component';
import { ProcurementApprovalComponent } from './procurement-approval/procurement-approval.component';

const routes: Routes = [
    { path: 'procurement', component: ProcurementComponent },
    { path: 'procurementdetails', component: ProcurementdetailsComponent },
    { path: 'procurementvendor', component: ProcurementvendorComponent },
    { path: 'procurement-approval-bin', component: ProcurementApprovalBinComponent },
    { path: 'procurement-approval/:id', component: ProcurementApprovalComponent },
];

@NgModule({
    imports: [RouterModule.forChild(routes)],
    exports: [RouterModule],
})
export class ProcurementRoutingModule {}
