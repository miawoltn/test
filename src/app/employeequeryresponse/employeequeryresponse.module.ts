import { NgModule } from '@angular/core';
import { CommonModule } from '@angular/common';
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
	DxSpeedDialActionModule, DxPivotGridModule, DxChartModule, DxCheckBoxModule, DxPieChartModule
} from 'devextreme-angular';

import { EmployeequeryresponseRoutingModule } from './employeequeryresponse-routing.module';
import { QueryresponseComponent } from './queryresponse/queryresponse.component';
import { QueryevaluationComponent } from './queryevaluation/queryevaluation.component';


@NgModule({
  declarations: [QueryresponseComponent, QueryevaluationComponent],
  imports: [
    CommonModule,
    EmployeequeryresponseRoutingModule,
    FormsModule,
		NgSelectModule,
		MatStepperModule,
		MatIconModule,
		DxSelectBoxModule,
		DxTextAreaModule,
		DxDateBoxModule,
		DxFormModule,
		DxDataGridModule,
		DxSpeedDialActionModule,
    DxPivotGridModule, 
    DxChartModule, 
    DxCheckBoxModule, 
    DxPieChartModule,
  ]
})
export class EmployeequeryresponseModule { }
