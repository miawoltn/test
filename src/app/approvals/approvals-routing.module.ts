import { NgModule } from '@angular/core';
import { Routes, RouterModule } from '@angular/router';
import { ApprovalBinComponent } from './approval-bin/approval-bin.component';
import { ApprovalComponent } from './approval/approval.component';
import { AppraisalBinComponent } from './appraisal-bin/appraisal-bin.component';
import { KpiApprovalComponent } from './kpi-approval/kpi-approval.component';
import { KpiBinComponent } from './kpi-bin/kpi-bin.component';
import { KpiForApprovalComponent } from './kpi-for-approval/kpi-for-approval.component';
import { LeaveapprovalbinComponent } from './leaveapprovalbin/leaveapprovalbin.component';
import { PendingApprovalsComponent } from './pending-approvals/pending-approvals.component';
import { PendingResumptionComponent } from './pending-resumption/pending-resumption.component';
import { ResumptionApprovalComponent } from './resumption-approval/resumption-approval.component';
import { AppraisalApprovalComponent } from './appraisal_approval/appraisal_approval.component';


const routes: Routes = [{ path: 'kpi-approval', component: KpiForApprovalComponent, data: { breadcrumb: 'KPI Approval' } },
{ path: 'kpi-bin', component: KpiBinComponent, data: { breadcrumb: 'KPI Approval Pin' } },
{ path: 'appraisal-bin', component: AppraisalBinComponent, data: { breadcrumb: 'Appraisal Bin' } },
{ path: 'kpi-approval/:id', component: KpiApprovalComponent, data: { breadcrumb: 'KPI Approval' } },
{ path: 'appraisal-approval/:id', component: AppraisalApprovalComponent, data: { breadcrumb: 'Appraisal Approval' } },
{ path: 'pending-resumption', component: PendingResumptionComponent, data: { breadcrumb: 'Pending Leave Resumptions' } },
{ path: 'approval', component: PendingApprovalsComponent, data: { breadcrumb: 'Leave Approval Bin' } },
{ path: 'leave/:id', component: LeaveapprovalbinComponent, data: { breadcrumb: 'Leave Approval' } },
{ path: 'resume-approve/:id', component: ResumptionApprovalComponent, data: { breadcrumb: 'Leave Resumption Approval' } },
];

@NgModule({
  imports: [RouterModule.forChild(routes)],
  exports: [RouterModule]
})
export class ApprovalsRoutingModule { }
