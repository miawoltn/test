import { NgModule } from '@angular/core';
import { CommonModule } from '@angular/common';

import { AppraisalsetupRoutingModule } from './appraisalsetup-routing.module';
import { AppraisalchangeapprovalstageComponent } from './appraisalchangeapprovalstage/appraisalchangeapprovalstage.component';import { AppraisalDynamicdatamappingComponent } from './appraisal_dynamicdatamapping/appraisal_dynamicdatamapping.component';import { AppraisalDynamicsourceComponent } from './appraisal_dynamicsource/appraisal_dynamicsource.component';import { AppraisalRecommenddetailsComponent } from './appraisal_recommenddetails/appraisal_recommenddetails.component';import { AppraisalSystemcategoryComponent } from './appraisal_systemcategory/appraisal_systemcategory.component';import { AppraisalSystemdetailsComponent } from './appraisal_systemdetails/appraisal_systemdetails.component';import { AppraisalSystemsComponent } from './appraisal_systems/appraisal_systems.component';import { AppraisalSystemtypesComponent } from './appraisal_systemtypes/appraisal_systemtypes.component';import { SystemclassComponent } from './systemclass/systemclass.component';
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

