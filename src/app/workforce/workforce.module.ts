
import { NgModule } from '@angular/core'; 
import { CommonModule } from '@angular/common';

import { WorkforceRoutingModule } from './workforce-routing.module';
import { WorkforceComponent } from './workforce/workforce.component'import { WorkforcehistoryComponent } from './workforcehistory/workforcehistory.component'import { WorkforceoptionsComponent } from './workforceoptions/workforceoptions.component';
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
    WorkforceRoutingModule,
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
  declarations: [WorkforceComponent,WorkforcehistoryComponent,WorkforceoptionsComponent]
})
export class WorkforceModule { }

