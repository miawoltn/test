import { NgModule } from '@angular/core';
import { Routes, RouterModule } from '@angular/router';
import { AppraisaldetailsComponent } from './appraisaldetails/appraisaldetails.component';
import { AppraisalheaderComponent } from './appraisalheader/appraisalheader.component';
import { AppraisalApprovalComponent } from './appraisal_approval/appraisal_approval.component';
import { AppraisalTrainingsComponent } from './appraisal_trainings/appraisal_trainings.component';
import { KpiComponent } from './kpi/kpi.component';
import { KpiForApprovalComponent } from './kpi-for-approval/kpi-for-approval.component';
import { KpiBinComponent } from './kpi-bin/kpi-bin.component';
import { KpiApprovalComponent } from './kpi-approval/kpi-approval.component';
import { AppraisalBinComponent } from './appraisal-bin/appraisal-bin.component';
import { AppraisalChartComponent } from './appraisal-chart/appraisal-chart.component';
import { AppraisalReportComponent } from './appraisal-report/appraisal-report.component';
import { ViewAppraisalsComponent } from './view-appraisals/view-appraisals.component';
import { DashboardComponent } from './dashboard/dashboard.component';

const routes: Routes = [{
  path: '',
  data: {
    breadcrumb: 'Appraisals'
  },
  children: [
    { path: 'dashboard', component: DashboardComponent, data: { breadcrumb: 'Dashboard' } },
    { path: 'appraisaldetails', component: AppraisaldetailsComponent, data: { breadcrumb: 'Appraisal Details' } },
    { path: 'appraisalheader', component: AppraisalheaderComponent, data: { breadcrumb: 'Appraisal Application' } },
    { path: 'appraisal_approval', component: AppraisalApprovalComponent, data: { breadcrumb: 'Appraisal Approval' } },
    { path: 'appraisal_trainings', component: AppraisalTrainingsComponent, data: { breadcrumb: '' } },
    { path: 'kpi', component: KpiComponent, data: { breadcrumb: 'My Appraisal' } },
    { path: 'kpi-approval', component: KpiForApprovalComponent, data: { breadcrumb: 'KPI Approval' } },
    { path: 'kpi-bin', component: KpiBinComponent, data: { breadcrumb: 'KPI Approval Pin' } },
    { path: 'appraisal-bin', component: AppraisalBinComponent, data: { breadcrumb: 'Appraisal Bin' } },
    { path: 'kpi-approval/:id', component: KpiApprovalComponent, data: { breadcrumb: 'KPI Approval' } },
    { path: 'appraisal-approval/:id', component: AppraisalApprovalComponent, data: { breadcrumb: 'Appraisal Approval' } },
    { path: 'appraisal-chart', component: AppraisalChartComponent, data: { breadcrumb: 'Appraisal Chart' } },
    { path: 'appraisal-report', component: AppraisalReportComponent, data: { breadcrumb: 'Appraisal Report' } },
    { path: 'view', component: ViewAppraisalsComponent, data: { breadcrumb: 'View Appraisal' } },
  ]
}
];

@NgModule({
  imports: [RouterModule.forChild(routes)],
  exports: [RouterModule]
})
export class AppraisalRoutingModule { }

