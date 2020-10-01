
import { NgModule } from '@angular/core'; 
import { CommonModule } from '@angular/common';

import { CustomerRoutingModule } from './customer-routing.module';
import { CustomerComponent } from './customer/customer.component'import { CustomersubtypeComponent } from './customersubtype/customersubtype.component'import { CustomertypeComponent } from './customertype/customertype.component';
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
    CustomerRoutingModule,
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
  declarations: [CustomerComponent,CustomersubtypeComponent,CustomertypeComponent]
})
export class CustomerModule { }

