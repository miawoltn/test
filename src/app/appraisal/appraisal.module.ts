import { NgModule } from '@angular/core';
import { CommonModule } from '@angular/common';

import { AppraisalRoutingModule } from './appraisal-routing.module';
import { AppraisaldetailsComponent } from './appraisaldetails/appraisaldetails.component';
import { AppraisalheaderComponent } from './appraisalheader/appraisalheader.component';
import { AppraisalApprovalComponent } from './appraisal_approval/appraisal_approval.component';
import { AppraisalTrainingsComponent } from './appraisal_trainings/appraisal_trainings.component';
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
	DxSpeedDialActionModule,
	DxValidatorModule,
	DxValidationSummaryModule, DxTemplateModule, DxPivotGridModule, DxChartModule, DxPieChartModule, DxCheckBoxModule
} from 'devextreme-angular';
import { KpiComponent } from './kpi/kpi.component';
import { KpiForApprovalComponent } from './kpi-for-approval/kpi-for-approval.component';
import { KpiBinComponent } from './kpi-bin/kpi-bin.component';
import { KpiApprovalComponent } from './kpi-approval/kpi-approval.component';
import { AppraisalBinComponent } from './appraisal-bin/appraisal-bin.component';
import { AppraisalReportComponent } from './appraisal-report/appraisal-report.component';
import { AppraisalChartComponent } from './appraisal-chart/appraisal-chart.component';
import { MatRadioModule } from '@angular/material/radio';
import { ViewAppraisalsComponent } from './view-appraisals/view-appraisals.component';
import { AppraisalModalComponent } from './appraisal-modal/appraisal-modal.component';
import { DashboardComponent } from './dashboard/dashboard.component';

@NgModule({
	imports: [
		CommonModule,
		AppraisalRoutingModule,
		SharedModule,
		FormsModule,
		NgSelectModule,
		MatStepperModule,
		MatRadioModule,
		MatIconModule,
		DxSelectBoxModule,
		DxTextAreaModule,
		DxDateBoxModule,
		DxFormModule,
		DxDataGridModule,
		DxSpeedDialActionModule,
		DxValidatorModule,
		DxValidationSummaryModule, DxTemplateModule, DxPivotGridModule, DxChartModule, DxPieChartModule, DxCheckBoxModule
	],
	declarations: [AppraisaldetailsComponent, AppraisalheaderComponent, AppraisalApprovalComponent, AppraisalTrainingsComponent,
		KpiComponent, KpiForApprovalComponent, KpiBinComponent, KpiApprovalComponent, AppraisalBinComponent, AppraisalReportComponent,
		AppraisalChartComponent, ViewAppraisalsComponent, AppraisalModalComponent, DashboardComponent]
})
export class AppraisalModule { }

