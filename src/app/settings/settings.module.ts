
import { NgModule } from '@angular/core';
import { CommonModule } from '@angular/common';

import { SettingsRoutingModule } from './settings-routing.module';
import { StatusesComponent } from './statuses/statuses.component'
import { YearComponent } from './year/year.component';
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
import { MaritalstatusComponent } from './maritalstatus/maritalstatus.component';
import { GenderComponent } from './gender/gender.component';
import { DocumenttypeComponent } from './documenttype/documenttype.component';
import { DurationComponent } from './duration/duration.component';
import { PriorityComponent } from './priority/priority.component';
import { EquipmentComponent } from './equipment/equipment.component';

@NgModule({
	imports: [
		CommonModule,
		SettingsRoutingModule,
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
	declarations: [GenderComponent,MaritalstatusComponent, StatusesComponent, YearComponent, DocumenttypeComponent, DurationComponent, EquipmentComponent, PriorityComponent]
})
export class SettingsModule { }

