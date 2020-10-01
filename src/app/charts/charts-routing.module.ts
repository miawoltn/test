import { NgModule } from '@angular/core';
import { Routes, RouterModule } from '@angular/router';
import { ChartsComponent } from './charts/charts.component';
import { ChartCategoryComponent } from './chart_category/chart_category.component';
import { ChartProvidersComponent } from './chart_providers/chart_providers.component';
import { ChartTypesComponent } from './chart_types/chart_types.component';
import { DashboardsettingComponent } from './dashboardsetting/dashboardsetting.component';

const routes: Routes = [
  {
    path: '',
    data: {
      breadcrumb: 'Chart'
    },
    children: [
      { path: 'charts', component: ChartsComponent, data: { breadcrumb: 'Charts' } },
      { path: 'chart_category', component: ChartCategoryComponent , data: { breadcrumb: 'Chart Category' }},
      { path: 'chart_providers', component: ChartProvidersComponent , data: { breadcrumb: 'Chart Providers' }},
      { path: 'chart_types', component: ChartTypesComponent , data: { breadcrumb: 'Chart Types' }},
      { path: 'dashboardsetting', component: DashboardsettingComponent , data: { breadcrumb: 'Dashboard Settings' }}]
  }
];

@NgModule({
  imports: [RouterModule.forChild(routes)],
  exports: [RouterModule]
})
export class ChartsRoutingModule { }

