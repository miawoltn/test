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

import { SanctionRoutingModule } from './sanction-routing.module';
import { SanctionComponent } from './sanction/sanction.component';
import { OffenceComponent } from './offence/offence.component';
import { EmployeequeryComponent } from './employeequery/employeequery.component';


@NgModule({
  declarations: [SanctionComponent, OffenceComponent, EmployeequeryComponent],
  imports: [
    CommonModule,
    SanctionRoutingModule,
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
		DxPivotGridModule, DxChartModule, DxCheckBoxModule, DxPieChartModule,
  ]
})
export class SanctionModule { }
