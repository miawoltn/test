
import { NgModule } from '@angular/core';
import { Routes, RouterModule } from '@angular/router';
import { HolidaysComponent } from './holidays/holidays.component';
import { LeaveapplicationComponent } from './leaveapplication/leaveapplication.component';
import { LeaveapplicationsetupComponent } from './leaveapplicationsetup/leaveapplicationsetup.component';
import { LeaveapprovalComponent } from './leaveapproval/leaveapproval.component';
import { LeaveemployeeapplicationComponent } from './leaveemployeeapplication/leaveemployeeapplication.component';
import { LeaveplannerComponent } from './leaveplanner/leaveplanner.component';
import { LeaveresumptionComponent } from './leaveresumption/leaveresumption.component';
import { LeavetypeComponent } from './leavetype/leavetype.component';
import { LeaveapprovalbinComponent } from './leaveapprovalbin/leaveapprovalbin.component';
import { PlannerCalendarComponent } from './planner-calendar/planner-calendar.component';
import { PendingApprovalsComponent } from './pending-approvals/pending-approvals.component';
import { PendingApprovalsHrComponent } from './pending-approvals-hr/pending-approvals-hr.component';
import { HrApprovalBinComponent } from './hr-approval-bin/hr-approval-bin.component';
import { PendingResumptionComponent } from './pending-resumption/pending-resumption.component';
import { NewResumptionComponent } from './new-resumption/new-resumption.component';
import { ResumptionApprovalComponent } from './resumption-approval/resumption-approval.component';
import { ResumptionApprovalHrComponent } from './resumption-approval-hr/resumption-approval-hr.component';
import { Calendar2Component } from './calendar2/calendar2.component';
import { DashboardComponent } from './dashboard/dashboard.component';
import { LeaveCalendarComponent } from './leave-calendar/leave-calendar.component';
import { LeaveViewComponent } from './leave-view/leave-view.component';
import { ChartReportComponent } from './chart-report/chart-report.component';
import { LeaveReportComponent } from './leave-report/leave-report.component';
import { LeaveBalancesComponent } from './leave-balances/leave-balances.component';

const routes: Routes = [{
  path: '',
  data: { breadcrumb: 'Leave' },
  children: [
    { path: 'holidays', component: HolidaysComponent, data: { breadcrumb: 'Holidays' } },
    { path: '', component: DashboardComponent, data: { breadcrumb: 'Dashboard' } },
    { path: 'dashboard', component: DashboardComponent, data: { breadcrumb: 'Dashboard' } },
    { path: 'leave-calendar', component: LeaveCalendarComponent, data: { breadcrumb: 'Leave' } },
    { path: 'leaveapplication', component: LeaveapplicationComponent, data: { breadcrumb: 'Leave Application' } },
    { path: 'leaveapplicationsetup', component: LeaveapplicationsetupComponent, data: { breadcrumb: 'Leave Entitlements' } },
    { path: 'leaveapproval', component: LeaveapprovalComponent, data: { breadcrumb: 'Leave Approval' } },
    { path: 'approval', component: PendingApprovalsComponent, data: { breadcrumb: 'Leave Approval Bin' } },
    { path: 'approval-hr', component: PendingApprovalsHrComponent, data: { breadcrumb: 'Leave Approval Bin (HR)' } },
    {
      path: 'leaveemployeeapplication', component: LeaveemployeeapplicationComponent,
      data: { breadcrumb: 'Leave Entitlement (Employee)' }
    },
    { path: 'leaveplanner', component: LeaveplannerComponent, data: { breadcrumb: 'Leave Planner' } },
    { path: 'calendar', component: PlannerCalendarComponent, data: { breadcrumb: 'Leave Calendar' } },
    { path: 'leaveresumption', component: LeaveresumptionComponent, data: { breadcrumb: 'Leave Resumption' } },
    { path: 'leavetype', component: LeavetypeComponent, data: { breadcrumb: 'Leave Types' } },
    { path: 'leave/:id', component: LeaveapprovalbinComponent, data: { breadcrumb: 'Leave Approval' } },
    { path: 'view/:id', component: LeaveViewComponent, data: { breadcrumb: 'Leave Application' } },
    { path: 'resume-approve/:id', component: ResumptionApprovalComponent, data: { breadcrumb: 'Leave Resumption Approval' } },
    { path: 'resume-approve-hr/:id', component: ResumptionApprovalHrComponent, data: { breadcrumb: 'Leave Resumption Approval (HR)' } },
    { path: 'leave-hr/:id', component: HrApprovalBinComponent, data: { breadcrumb: 'Leave Approval (HR)' } },
    { path: 'pending-resumption', component: PendingResumptionComponent, data: { breadcrumb: 'Pending Leave Resumptions' } },
    { path: 'resumption/:id', component: NewResumptionComponent, data: { breadcrumb: 'Leave Resumption Application' } },
    { path: 'calendar2', component: Calendar2Component, data: { breadcrumb: 'Leave Calendar' } },
    { path: 'leave-chart', component: ChartReportComponent, data: { breadcrumb: 'Leave Chart' } },
    { path: 'leave-report', component: LeaveReportComponent, data: { breadcrumb: 'Leave Report' } },
    { path: 'leave-balance', component: LeaveBalancesComponent, data: { breadcrumb: 'Leave Balances' } },
  ]
}
];

@NgModule({
  imports: [RouterModule.forChild(routes)],
  exports: [RouterModule]
})
export class LeaveRoutingModule { }

