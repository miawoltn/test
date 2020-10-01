
import { NgModule } from '@angular/core';
import { Routes, RouterModule } from '@angular/router';
import { CustomerComponent } from './customer/customer.component'
import { CustomersubtypeComponent } from './customersubtype/customersubtype.component'
import { CustomertypeComponent } from './customertype/customertype.component'

const routes: Routes = [
  { path: "customer", component: CustomerComponent },
  { path: "customersubtype", component: CustomersubtypeComponent },
  { path: "customertype", component: CustomertypeComponent },

];

@NgModule({
  imports: [RouterModule.forChild(routes)],
  exports: [RouterModule]
})
export class CustomerRoutingModule { }