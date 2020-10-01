import { NgModule } from '@angular/core';
import { Routes, RouterModule } from '@angular/router';
import { OffenceComponent } from './offence/offence.component';
import { SanctionComponent } from './sanction/sanction.component';
import { EmployeequeryComponent } from './employeequery/employeequery.component';

const routes: Routes = [{
  path: '',
  data: { breadcrumb: 'Sanction' },
  children: [
    { path: 'offence', component: OffenceComponent, data: { breadcrumb: 'Offences' } },
    { path: 'sanction', component: SanctionComponent, data: { breadcrumb: 'Sanctions' } },
    { path: 'employeequery', component: EmployeequeryComponent, data: { breadcrumb: 'Employee Query' } },
  ]
}
];

@NgModule({
  imports: [RouterModule.forChild(routes)],
  exports: [RouterModule]
})
export class SanctionRoutingModule { }
