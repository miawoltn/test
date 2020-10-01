import { NgModule } from '@angular/core';
import { Routes, RouterModule } from '@angular/router';

import { QueryresponseComponent } from './queryresponse/queryresponse.component';
import { QueryevaluationComponent } from './queryevaluation/queryevaluation.component';


const routes: Routes = [{
  path: '',
  data: {breadcrumb: 'Query Response' },
  children: [
    {
      path: 'replies', component: QueryresponseComponent,
      data: { breadcrumb: 'Replies' }
    },
    {
      path: 'evaluation', component: QueryevaluationComponent,
      data: { breadcrumb: 'Evaluation' }
    },
  ]
}];

@NgModule({
  imports: [RouterModule.forChild(routes)],
  exports: [RouterModule]
})
export class EmployeequeryresponseRoutingModule { }
