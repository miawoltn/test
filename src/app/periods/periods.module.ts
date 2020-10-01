import { NgModule } from '@angular/core';
import { CommonModule } from '@angular/common';

import { PeriodsRoutingModule } from './periods-routing.module';
import { PeriodComponent } from './period/period.component';
import { PeriodtypeComponent } from './periodtype/periodtype.component';
import { YearsComponent } from './years/years.component';
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
		PeriodsRoutingModule,
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
	declarations: [PeriodComponent, PeriodtypeComponent, YearsComponent]
})
export class PeriodsModule { }

