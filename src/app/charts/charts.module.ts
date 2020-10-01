import { NgModule } from '@angular/core';
import { CommonModule } from '@angular/common';

import { ChartsRoutingModule } from './charts-routing.module';
import { ChartsComponent } from './charts/charts.component';
import { ChartCategoryComponent } from './chart_category/chart_category.component';
import { ChartProvidersComponent } from './chart_providers/chart_providers.component';
import { ChartTypesComponent } from './chart_types/chart_types.component';
import { DashboardsettingComponent } from './dashboardsetting/dashboardsetting.component';
import { SharedModule } from '../shared.module';
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
		ChartsRoutingModule,
		SharedModule,
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
	declarations: [ChartsComponent, ChartCategoryComponent, ChartProvidersComponent, ChartTypesComponent, DashboardsettingComponent]
})
export class ChartsModule { }

