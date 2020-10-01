import { NgModule } from '@angular/core';
import { Routes, RouterModule } from '@angular/router';
import { KpiComponent } from './kpi/kpi.component';
import { KpiclassComponent } from './kpiclass/kpiclass.component';
import { KpiconfigComponent } from './kpiconfig/kpiconfig.component';
import { KpiconfigApprovalComponent } from './kpiconfig_approval/kpiconfig_approval.component';
import { KpiClassscoringComponent } from './kpi_classscoring/kpi_classscoring.component';
import { KpiTypeComponent } from './kpi_type/kpi_type.component';
import { KpiTypescoringComponent } from './kpi_typescoring/kpi_typescoring.component';

const routes: Routes = [{
  path: '',
  data: {
    breadcrumb: 'KPI'
  },
  children: [
    { path: 'kpi', component: KpiComponent , data: { breadcrumb: 'KPI' } },
    { path: 'kpiclass', component: KpiclassComponent , data: { breadcrumb: 'KPI Class' } },
    { path: 'kpiconfig', component: KpiconfigComponent , data: { breadcrumb: 'KPI Config' } },
    { path: 'kpiconfig_approval', component: KpiconfigApprovalComponent , data: { breadcrumb: 'KPI Approval' } },
    { path: 'kpi_classscoring', component: KpiClassscoringComponent , data: { breadcrumb: 'KPI Class Scoring' } },
    { path: 'kpi_type', component: KpiTypeComponent , data: { breadcrumb: 'KPI Type' } },
    { path: '', component: KpiTypeComponent , data: { breadcrumb: 'KPI Type' } },
    { path: 'kpi_typescoring', component: KpiTypescoringComponent , data: { breadcrumb: 'KPI Type Scoring' } }]
}

];

@NgModule({
  imports: [RouterModule.forChild(routes)],
  exports: [RouterModule]
})
export class KpiRoutingModule { }

