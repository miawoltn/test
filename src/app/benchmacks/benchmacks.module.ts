import { NgModule } from '@angular/core';
import { CommonModule } from '@angular/common';

import { BenchmacksRoutingModule } from './benchmacks-routing.module';
import { ActionsComponent } from './actions/actions.component';import { ActiontypesComponent } from './actiontypes/actiontypes.component';import { ActiontypeDetailsComponent } from './actiontype_details/actiontype_details.component';import { ActionDetailsComponent } from './action_details/action_details.component';import { BenchmarkComponent } from './benchmark/benchmark.component';import { BenchmarkgraphComponent } from './benchmarkgraph/benchmarkgraph.component';import { BenchmarkActionsComponent } from './benchmark_actions/benchmark_actions.component';
import { SharedModule } from '../shared.module';
import { FormsModule } from '@angular/forms';
import { MatIconModule } from '@angular/material/icon';
import { MatStepperModule } from '@angular/material/stepper';
import { NgSelectModule } from '@ng-select/ng-select';
import {
	DxSelectBoxModule,
	DxTextAreaModule,
	DxDateBoxModule,
	DxFormModule,
	DxDataGridModule,
	DxSpeedDialActionModule
} from 'devextreme-angular';

@NgModule({
  imports: [
    CommonModule,
    BenchmacksRoutingModule,
    SharedModule,
    FormsModule,
	NgSelectModule,
    MatStepperModule,
    MatIconModule,
	DxSelectBoxModule,
	DxTextAreaModule,
	DxDateBoxModule,
	DxFormModule,
	DxDataGridModule,
	DxSpeedDialActionModule
  ],
  declarations: [ActionsComponent,ActiontypesComponent,ActiontypeDetailsComponent,ActionDetailsComponent,BenchmarkComponent,BenchmarkgraphComponent,BenchmarkActionsComponent]
})
export class BenchmacksModule { }

