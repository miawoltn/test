
import { NgModule } from '@angular/core';
import { Routes, RouterModule } from '@angular/router';
import { SalarycomponentsComponent } from './salarycomponents/salarycomponents.component';
import { SalaryformulaeComponent } from './salaryformulae/salaryformulae.component';
import { SalarytaxstatusComponent } from './salarytaxstatus/salarytaxstatus.component';
import { SalarytypeComponent } from './salarytype/salarytype.component';
import { SalaryvariablecategoryComponent } from './salaryvariablecategory/salaryvariablecategory.component';
import { SalaryvariablesComponent } from './salaryvariables/salaryvariables.component';
import { SalaryvariabletypeComponent } from './salaryvariabletype/salaryvariabletype.component';

const routes: Routes = [{
  path: '',
  data: { breadcrumb: 'Salary Setup' },
  children: [
    { path: '', component: SalarycomponentsComponent, data: { breadcrumb: 'Salary Components' } },
    { path: 'salarycomponents', component: SalarycomponentsComponent, data: { breadcrumb: 'Salary Components' } },
    { path: 'salaryformulae', component: SalaryformulaeComponent, data: { breadcrumb: 'Salary Formulae' } },
    { path: 'salarytaxstatus', component: SalarytaxstatusComponent, data: { breadcrumb: 'Tax Status' } },
    { path: 'salarytype', component: SalarytypeComponent, data: { breadcrumb: 'Salary Type' } },
    { path: 'salaryvariablecategory', component: SalaryvariablecategoryComponent, data: { breadcrumb: 'Variable Category' } },
    { path: 'salaryvariables', component: SalaryvariablesComponent, data: { breadcrumb: 'Salary Variables' } },
    { path: 'salaryvariabletype', component: SalaryvariabletypeComponent, data: { breadcrumb: 'Variable Types' } },]
}

];

@NgModule({
  imports: [RouterModule.forChild(routes)],
  exports: [RouterModule]
})
export class SalaryRoutingModule { }

