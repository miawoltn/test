
import { NgModule } from '@angular/core';
import { CommonModule } from '@angular/common';

import { LoanRoutingModule } from './loan-routing.module';
import { LoanapplicationComponent } from './loanapplication/loanapplication.component'
import { LoanapprovalComponent } from './loanapproval/loanapproval.component'
import { LoanrepaymentComponent } from './loanrepayment/loanrepayment.component'
import { LoanrepaymentsourceComponent } from './loanrepaymentsource/loanrepaymentsource.component'
import { LoanrepaymenttypeComponent } from './loanrepaymenttype/loanrepaymenttype.component'
import { LoantypesComponent } from './loantypes/loantypes.component';
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
	DxTabPanelModule,
	DxChartModule,
	DxCheckBoxModule,
	DxPivotGridModule,
	DxPieChartModule
} from 'devextreme-angular';
import { ViewApplicationsComponent } from './view-applications/view-applications.component';
import { ApprovalBinComponent } from './approval-bin/approval-bin.component';
import { ApprovalBinHrComponent } from './approval-bin-hr/approval-bin-hr.component';
import { ApprovalComponent } from './approval/approval.component';
import { ApprovalHrComponent } from './approval-hr/approval-hr.component';
import { ViewRepaymentsComponent } from './view-repayments/view-repayments.component';
import { LoanReportComponent } from './loan-report/loan-report.component';
import { LoanChartComponent } from './loan-chart/loan-chart.component';
import { LoanChart2Component } from './loan-chart2/loan-chart2.component';
import { LoanModalComponent } from './loan-modal/loan-modal.component';
import { DashboardComponent } from './dashboard/dashboard.component';

@NgModule({
	imports: [
		CommonModule,
		LoanRoutingModule,
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
		DxTabPanelModule,
		DxChartModule,
		DxCheckBoxModule, DxPivotGridModule, DxPieChartModule
	],
	declarations: [LoanapplicationComponent, LoanapprovalComponent, LoanrepaymentComponent, LoanrepaymentsourceComponent,
		LoanrepaymenttypeComponent, LoantypesComponent, ViewApplicationsComponent, ApprovalBinComponent, ApprovalBinHrComponent,
		ApprovalComponent,
		ApprovalHrComponent, ViewRepaymentsComponent, LoanReportComponent, LoanChartComponent, LoanChart2Component,
		LoanModalComponent, DashboardComponent]
})
export class LoanModule { }

