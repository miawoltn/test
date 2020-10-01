import { NgModule } from '@angular/core';
import { Routes, RouterModule } from '@angular/router';
import { PeriodComponent } from './period/period.component'import { PeriodtypeComponent } from './periodtype/periodtype.component'import { YearsComponent } from './years/years.component'

const routes: Routes = [
 { path:"period", component:PeriodComponent }, { path:"periodtype", component:PeriodtypeComponent }, { path:"years", component:YearsComponent }, 

];

@NgModule({
  imports: [RouterModule.forChild(routes)],
  exports: [RouterModule]
})
export class PeriodsRoutingModule { }

