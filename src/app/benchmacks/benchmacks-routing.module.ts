import { NgModule } from '@angular/core';
import { Routes, RouterModule } from '@angular/router';
import { ActionsComponent } from './actions/actions.component';
import { ActiontypesComponent } from './actiontypes/actiontypes.component';
import { ActiontypeDetailsComponent } from './actiontype_details/actiontype_details.component';
import { ActionDetailsComponent } from './action_details/action_details.component';
import { BenchmarkComponent } from './benchmark/benchmark.component';
import { BenchmarkgraphComponent } from './benchmarkgraph/benchmarkgraph.component';
import { BenchmarkActionsComponent } from './benchmark_actions/benchmark_actions.component';

const routes: Routes = [{
  path: '',
  data: {
    breadcrumb: 'Benchmarks'
  },
  children: [
    { path: 'actions', component: ActionsComponent, data: { breadcrumb: 'Actions' } },
    { path: 'actiontypes', component: ActiontypesComponent, data: { breadcrumb: 'Action Types' } },
    { path: 'actiontype_details', component: ActiontypeDetailsComponent, data: { breadcrumb: 'Action' } },
    { path: 'action_details', component: ActionDetailsComponent, data: { breadcrumb: 'Actions' } },
    { path: 'benchmark', component: BenchmarkComponent, data: { breadcrumb: 'Benchmarks' } },
    { path: '', component: BenchmarkComponent, data: { breadcrumb: 'Benchmarks' } },
    { path: 'benchmarkgraph', component: BenchmarkgraphComponent, data: { breadcrumb: 'Graph' } },
    { path: 'benchmark_actions', component: BenchmarkActionsComponent, data: { breadcrumb: 'Benchmark Actions' } }]
}

];

@NgModule({
  imports: [RouterModule.forChild(routes)],
  exports: [RouterModule]
})
export class BenchmacksRoutingModule { }

