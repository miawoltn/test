import { NgModule } from '@angular/core';
import { Routes, RouterModule } from '@angular/router';
import { VendorComponent } from './vendor/vendor.component';
import { VendorcategoryComponent } from './vendorcategory/vendorcategory.component';
import { VendorsComponent } from './vendors/vendors.component';
import { VendortypeComponent } from './vendortype/vendortype.component';

const routes: Routes = [
    { path: 'vendor', component: VendorComponent },
    { path: 'vendorcategory', component: VendorcategoryComponent },
    { path: 'vendors', component: VendorsComponent },
    { path: 'vendortype', component: VendortypeComponent },
];

@NgModule({
    imports: [RouterModule.forChild(routes)],
    exports: [RouterModule],
})
export class VendorRoutingModule {}
