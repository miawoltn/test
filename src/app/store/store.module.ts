
import { NgModule } from '@angular/core'; 
import { CommonModule } from '@angular/common';

import { StoreRoutingModule } from './store-routing.module';
import { StoreitemsComponent } from './storeitems/storeitems.component'import { StoresComponent } from './stores/stores.component';
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
    StoreRoutingModule,
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
  declarations: [StoreitemsComponent,StoresComponent]
})
export class StoreModule { }

