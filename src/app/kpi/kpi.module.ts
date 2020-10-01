import { NgModule } from '@angular/core';
import { CommonModule } from '@angular/common';

import { KpiRoutingModule } from './kpi-routing.module';
import { KpiComponent } from './kpi/kpi.component';import { KpiclassComponent } from './kpiclass/kpiclass.component';import { KpiconfigComponent } from './kpiconfig/kpiconfig.component';import { KpiconfigApprovalComponent } from './kpiconfig_approval/kpiconfig_approval.component';import { KpiClassscoringComponent } from './kpi_classscoring/kpi_classscoring.component';import { KpiTypeComponent } from './kpi_type/kpi_type.component';import { KpiTypescoringComponent } from './kpi_typescoring/kpi_typescoring.component';
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
    KpiRoutingModule,
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
  declarations: [KpiComponent,KpiclassComponent,KpiconfigComponent,KpiconfigApprovalComponent,KpiClassscoringComponent,KpiTypeComponent,KpiTypescoringComponent]
})
export class KpiModule { }

