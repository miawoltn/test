import { NgModule } from '@angular/core';
import { CommonModule } from '@angular/common';

import { AppraisalsetupRoutingModule } from './appraisalsetup-routing.module';
import { AppraisalchangeapprovalstageComponent } from './appraisalchangeapprovalstage/appraisalchangeapprovalstage.component';
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
    AppraisalsetupRoutingModule,
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
  declarations: [AppraisalchangeapprovalstageComponent,AppraisalDynamicdatamappingComponent,AppraisalDynamicsourceComponent,AppraisalRecommenddetailsComponent,AppraisalSystemcategoryComponent,AppraisalSystemdetailsComponent,AppraisalSystemsComponent,AppraisalSystemtypesComponent,SystemclassComponent]
})
export class AppraisalsetupModule { }
