
import { NgModule } from '@angular/core'; 
import { CommonModule } from '@angular/common';

import { PaymentRoutingModule } from './payment-routing.module';
import { PaymentComponent } from './payment/payment.component'import { PaymentmethodComponent } from './paymentmethod/paymentmethod.component'import { PaymentplanComponent } from './paymentplan/paymentplan.component'import { PaymenttrancheComponent } from './paymenttranche/paymenttranche.component'import { PaymenttypeComponent } from './paymenttype/paymenttype.component';
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
	DxSpeedDialActionModule
} from 'devextreme-angular';

@NgModule({
  imports: [
    CommonModule,
    PaymentRoutingModule,
    FormsModule,
	NgSelectModule,
    MatStepperModule,
    MatIconModule,
	DxSelectBoxModule,
	DxTextAreaModule,
	DxDateBoxModule,
	DxFormModule,
	DxDataGridModule,
	DxSpeedDialActionModule
  ],
  declarations: [PaymentComponent,PaymentmethodComponent,PaymentplanComponent,PaymenttrancheComponent,PaymenttypeComponent]
})
export class PaymentModule { }

