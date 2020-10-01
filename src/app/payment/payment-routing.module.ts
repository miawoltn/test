
import { NgModule } from '@angular/core';
import { Routes, RouterModule } from '@angular/router';
import { PaymentComponent } from './payment/payment.component'
import { PaymentmethodComponent } from './paymentmethod/paymentmethod.component'
import { PaymentplanComponent } from './paymentplan/paymentplan.component'
import { PaymenttrancheComponent } from './paymenttranche/paymenttranche.component'
import { PaymenttypeComponent } from './paymenttype/paymenttype.component'

const routes: Routes = [
 { path:"payment", component:PaymentComponent }, 
{ path:"paymentmethod", component:PaymentmethodComponent }, 
{ path:"paymentplan", component:PaymentplanComponent }, 
{ path:"paymenttranche", component:PaymenttrancheComponent }, 
{ path:"paymenttype", component:PaymenttypeComponent }, 

];

@NgModule({
  imports: [RouterModule.forChild(routes)],
  exports: [RouterModule]
})
export class PaymentRoutingModule { }

