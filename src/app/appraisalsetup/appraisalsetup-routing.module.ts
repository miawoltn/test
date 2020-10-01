import { NgModule } from '@angular/core';
import { Routes, RouterModule } from '@angular/router';
import { AppraisalchangeapprovalstageComponent } from './appraisalchangeapprovalstage/appraisalchangeapprovalstage.component'import { AppraisalDynamicdatamappingComponent } from './appraisal_dynamicdatamapping/appraisal_dynamicdatamapping.component'import { AppraisalDynamicsourceComponent } from './appraisal_dynamicsource/appraisal_dynamicsource.component'import { AppraisalRecommenddetailsComponent } from './appraisal_recommenddetails/appraisal_recommenddetails.component'import { AppraisalSystemcategoryComponent } from './appraisal_systemcategory/appraisal_systemcategory.component'import { AppraisalSystemdetailsComponent } from './appraisal_systemdetails/appraisal_systemdetails.component'import { AppraisalSystemsComponent } from './appraisal_systems/appraisal_systems.component'import { AppraisalSystemtypesComponent } from './appraisal_systemtypes/appraisal_systemtypes.component'import { SystemclassComponent } from './systemclass/systemclass.component'

const routes: Routes = [
 { path:"appraisalchangeapprovalstage", component:AppraisalchangeapprovalstageComponent }, { path:"appraisal_dynamicdatamapping", component:AppraisalDynamicdatamappingComponent }, { path:"appraisal_dynamicsource", component:AppraisalDynamicsourceComponent }, { path:"appraisal_recommenddetails", component:AppraisalRecommenddetailsComponent }, { path:"appraisal_systemcategory", component:AppraisalSystemcategoryComponent }, { path:"appraisal_systemdetails", component:AppraisalSystemdetailsComponent }, { path:"appraisal_systems", component:AppraisalSystemsComponent }, { path:"appraisal_systemtypes", component:AppraisalSystemtypesComponent }, { path:"systemclass", component:SystemclassComponent }, 

];

@NgModule({
  imports: [RouterModule.forChild(routes)],
  exports: [RouterModule]
})
export class AppraisalsetupRoutingModule { }

