
import { NgModule } from '@angular/core'; 
import { CommonModule } from '@angular/common';

import { ItemRoutingModule } from './item-routing.module';
import { ItemcategoryComponent } from './itemcategory/itemcategory.component'import { ItemsComponent } from './items/items.component'import { ItemstatusComponent } from './itemstatus/itemstatus.component'import { ItemtypeComponent } from './itemtype/itemtype.component';
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
    ItemRoutingModule,
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
  declarations: [ItemcategoryComponent,ItemsComponent,ItemstatusComponent,ItemtypeComponent]
})
export class ItemModule { }

