
import { NgModule } from '@angular/core';
import { Routes, RouterModule } from '@angular/router';
import { ApprovalComponent } from './approval/approval.component'
import { ApprovalcreditscoringComponent } from './approvalcreditscoring/approvalcreditscoring.component'
import { ApprovalinstancesComponent } from './approvalinstances/approvalinstances.component'
import { ApprovallimitComponent } from './approvallimit/approvallimit.component'
import { ApprovalloanComponent } from './approvalloan/approvalloan.component'
import { ApprovalprocessflowComponent } from './approvalprocessflow/approvalprocessflow.component'
import { ApprovalprocessmoduleComponent } from './approvalprocessmodule/approvalprocessmodule.component'
import { ApprovalprocesstypeComponent } from './approvalprocesstype/approvalprocesstype.component'
import { ApprovalstagesComponent } from './approvalstages/approvalstages.component'
import { ApprovaltypeComponent } from './approvaltype/approvaltype.component'

const routes: Routes = [{
  path: '',
  data: {
    breadcrumb: 'Workflows'
  },
  children: [
    {
      path: "approval", component: ApprovalComponent,
      data: {
        breadcrumb: 'Approvals'
      }
    },
    {
      path: "approvalcreditscoring", component: ApprovalcreditscoringComponent,
      data: {
        breadcrumb: 'Workflows'
      }
    },
    {
      path: "approvalinstances", component: ApprovalinstancesComponent,
      data: {
        breadcrumb: 'Approval Instances'
      }
    },
    {
      path: "approvallimit", component: ApprovallimitComponent,
      data: {
        breadcrumb: 'Approval Limit'
      }
    },
    {
      path: "approvalloan", component: ApprovalloanComponent,
      data: {
        breadcrumb: 'Workflows'
      }
    },
    {
      path: "approvalprocessflow", component: ApprovalprocessflowComponent,
      data: {
        breadcrumb: 'Process Flow'
      }
    },
    {
      path: "approvalprocessmodule", component: ApprovalprocessmoduleComponent,
      data: {
        breadcrumb: 'Process Modules'
      }
    },
    {
      path: "", component: ApprovalprocessmoduleComponent,
      data: {
        breadcrumb: 'Process Modules'
      }
    },
    {
      path: "approvalprocesstype", component: ApprovalprocesstypeComponent,
      data: {
        breadcrumb: 'Process Types'
      }
    },
    {
      path: "approvalstages", component: ApprovalstagesComponent,
      data: {
        breadcrumb: 'Approval Stages'
      }
    },
    {
      path: "approvaltype", component: ApprovaltypeComponent,
      data: {
        breadcrumb: 'Approval Types'
      }
    },]
}

];

@NgModule({
  imports: [RouterModule.forChild(routes)],
  exports: [RouterModule]
})
export class ApprovalRoutingModule { }

