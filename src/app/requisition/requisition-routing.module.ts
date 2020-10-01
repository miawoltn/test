import { NgModule } from '@angular/core';
import { Routes, RouterModule } from '@angular/router';
import { RequisitionComponent } from './requisition/requisition.component';
import { RequisitiondetailsComponent } from './requisitiondetails/requisitiondetails.component';

const routes: Routes = [
    { path: 'requisition', component: RequisitionComponent },
    { path: 'requisitiondetails', component: RequisitiondetailsComponent },
];

@NgModule({
    imports: [RouterModule.forChild(routes)],
    exports: [RouterModule],
})
export class RequisitionRoutingModule {}
