
import { NgModule } from '@angular/core';
import { Routes, RouterModule } from '@angular/router';
import { WorkforceComponent } from './workforce/workforce.component'import { WorkforcehistoryComponent } from './workforcehistory/workforcehistory.component'import { WorkforceoptionsComponent } from './workforceoptions/workforceoptions.component'

const routes: Routes = [
 { path:"workforce", component:WorkforceComponent }, { path:"workforcehistory", component:WorkforcehistoryComponent }, { path:"workforceoptions", component:WorkforceoptionsComponent }, 

];

@NgModule({
  imports: [RouterModule.forChild(routes)],
  exports: [RouterModule]
})
export class WorkforceRoutingModule { }

