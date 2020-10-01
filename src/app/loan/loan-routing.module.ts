
import { NgModule } from '@angular/core';
import { Routes, RouterModule } from '@angular/router';
import { LoanapplicationComponent } from './loanapplication/loanapplication.component';
import { LoanapprovalComponent } from './loanapproval/loanapproval.component';
import { LoanrepaymentComponent } from './loanrepayment/loanrepayment.component';
import { LoanrepaymentsourceComponent } from './loanrepaymentsource/loanrepaymentsource.component';
import { LoanrepaymenttypeComponent } from './loanrepaymenttype/loanrepaymenttype.component';
import { LoantypesComponent } from './loantypes/loantypes.component';
import { ViewApplicationsComponent } from './view-applications/view-applications.component';
import { ApprovalBinComponent } from './approval-bin/approval-bin.component';
import { ApprovalComponent } from './approval/approval.component';
import { ApprovalBinHrComponent } from './approval-bin-hr/approval-bin-hr.component';
import { ApprovalHrComponent } from './approval-hr/approval-hr.component';
import { LoanReportComponent } from './loan-report/loan-report.component';
import { LoanChartComponent } from './loan-chart/loan-chart.component';
import { DashboardComponent } from './dashboard/dashboard.component';

const routes: Routes = [{
  path: '',
  data: { breadcrumb: 'Loans' },
  children: [
    { path: 'loanapplication', component: LoanapplicationComponent, data: { breadcrumb: 'Loan Application' } },
    { path: 'view-applications', component: ViewApplicationsComponent, data: { breadcrumb: 'Loan Applications' } },
    { path: '', component: ViewApplicationsComponent, data: { breadcrumb: 'Loan Applications' } },
    { path: 'dashboard', component: DashboardComponent, data: { breadcrumb: 'Dashboard' } },
    { path: 'approval-bin', component: ApprovalBinComponent, data: { breadcrumb: 'Loan Approval Bin' } },
    { path: 'approval/:id', component: ApprovalComponent, data: { breadcrumb: 'Loan Approval' } },
    { path: 'approval-bin-hr', component: ApprovalBinHrComponent, data: { breadcrumb: 'Loan Approval Bin (HR)' } },
    { path: 'approval-hr/:id', component: ApprovalHrComponent, data: { breadcrumb: 'Loan Approval (HR)' } },
    { path: 'loanapproval', component: LoanapprovalComponent, data: { breadcrumb: 'Loan Approval' } },
    { path: 'loanrepayment', component: LoanrepaymentComponent, data: { breadcrumb: 'Loan Repayment' } },
    { path: 'loanrepaymentsource', component: LoanrepaymentsourceComponent, data: { breadcrumb: 'Repayment Sources' } },
    { path: 'loanrepaymenttype', component: LoanrepaymenttypeComponent, data: { breadcrumb: 'Repayment Types' } },
    { path: 'loantypes', component: LoantypesComponent, data: { breadcrumb: 'Loan Types' } },
    { path: 'loan-report', component: LoanReportComponent, data: { breadcrumb: 'Loan Report' } },
    { path: 'loan-chart', component: LoanChartComponent, data: { breadcrumb: 'Loan Chart' } },
  ]
}
];

@NgModule({
  imports: [RouterModule.forChild(routes)],
  exports: [RouterModule]
})
export class LoanRoutingModule { }

