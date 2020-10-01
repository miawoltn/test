
import { NgModule } from '@angular/core';
import { CommonModule } from '@angular/common';

import { LeaveRoutingModule } from './leave-routing.module';
import { HolidaysComponent } from './holidays/holidays.component'
import { LeaveapplicationComponent } from './leaveapplication/leaveapplication.component'
import { LeaveapplicationsetupComponent } from './leaveapplicationsetup/leaveapplicationsetup.component'
import { LeaveapprovalComponent } from './leaveapproval/leaveapproval.component'
import { LeaveemployeeapplicationComponent } from './leaveemployeeapplication/leaveemployeeapplication.component'
import { LeaveplannerComponent } from './leaveplanner/leaveplanner.component'
import { LeaveresumptionComponent } from './leaveresumption/leaveresumption.component'
import { LeavetypeComponent } from './leavetype/leavetype.component';
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
	DxSpeedDialActionModule, DxSchedulerModule, DxPivotGridModule,
	DxChartModule,
	DxCheckBoxModule,
	DxPieChartModule
} from 'devextreme-angular';

import { PlannerCalendarComponent } from './planner-calendar/planner-calendar.component';
import { LeaveapprovalbinComponent } from './leaveapprovalbin/leaveapprovalbin.component';
import { PendingApprovalsComponent } from './pending-approvals/pending-approvals.component';
import { SharedModule } from '../shared.module';
import { PendingApprovalsHrComponent } from './pending-approvals-hr/pending-approvals-hr.component';
import { HrApprovalBinComponent } from './hr-approval-bin/hr-approval-bin.component';
import { PendingResumptionComponent } from './pending-resumption/pending-resumption.component';
import { NewResumptionComponent } from './new-resumption/new-resumption.component';
import { ResumptionBinComponent } from './resumption-bin/resumption-bin.component';
import { ResumptionApprovalComponent } from './resumption-approval/resumption-approval.component';
import { ResumptionApprovalHrComponent } from './resumption-approval-hr/resumption-approval-hr.component';
import { Calendar2Component } from './calendar2/calendar2.component';
import { DashboardComponent } from './dashboard/dashboard.component';
import { LeaveCalendarComponent } from './leave-calendar/leave-calendar.component';
import { LeaveViewComponent } from './leave-view/leave-view.component';

import { FullCalendarModule } from '@fullcalendar/angular';
import resourceTimelinePlugin from '@fullcalendar/resource-timeline'; // a plugin
import dayGridPlugin from '@fullcalendar/daygrid';
import { ChartReportComponent } from './chart-report/chart-report.component';
import { LeaveReportComponent } from './leave-report/leave-report.component';
import { LeavePrintComponent } from './leave-print/leave-print.component';
import { LeaveModalComponent } from './leave-modal/leave-modal.component';
import { LeaveBalancesComponent } from './leave-balances/leave-balances.component'; // a plugin

FullCalendarModule.registerPlugins([
	resourceTimelinePlugin,
	dayGridPlugin
]);
@NgModule({
	imports: [
		CommonModule,
		LeaveRoutingModule,
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
		DxSchedulerModule,
		SharedModule,
		DxPivotGridModule, FullCalendarModule,
		DxChartModule, DxCheckBoxModule, DxPieChartModule
	],
	declarations: [HolidaysComponent, LeaveapplicationComponent, LeaveapplicationsetupComponent,
		LeaveapprovalComponent, LeaveemployeeapplicationComponent, LeaveplannerComponent, LeaveresumptionComponent,
		LeavetypeComponent, PlannerCalendarComponent, LeaveapprovalbinComponent, PendingApprovalsComponent,
		PendingApprovalsHrComponent, HrApprovalBinComponent, PendingResumptionComponent, NewResumptionComponent, ResumptionBinComponent,
		ResumptionApprovalComponent, ResumptionApprovalHrComponent, Calendar2Component, DashboardComponent, LeaveCalendarComponent,
		LeaveViewComponent, ChartReportComponent, LeaveReportComponent, LeavePrintComponent, LeaveModalComponent, LeaveBalancesComponent]
})
export class LeaveModule { }

