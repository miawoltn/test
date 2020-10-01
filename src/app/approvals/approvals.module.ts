import { NgModule } from '@angular/core';
import { CommonModule } from '@angular/common';

import { ApprovalsRoutingModule } from './approvals-routing.module';
import { ApprovalBinComponent } from './approval-bin/approval-bin.component';
import { ApprovalComponent } from './approval/approval.component';
import { AppraisalBinComponent } from './appraisal-bin/appraisal-bin.component';
import { KpiApprovalComponent } from './kpi-approval/kpi-approval.component';
import { KpiBinComponent } from './kpi-bin/kpi-bin.component';
import { KpiForApprovalComponent } from './kpi-for-approval/kpi-for-approval.component';
import { LeaveapprovalbinComponent } from './leaveapprovalbin/leaveapprovalbin.component';
import { PendingApprovalsComponent } from './pending-approvals/pending-approvals.component';
import { PendingResumptionComponent } from './pending-resumption/pending-resumption.component';
import { ResumptionApprovalComponent } from './resumption-approval/resumption-approval.component';
import { AppraisalApprovalComponent } from './appraisal_approval/appraisal_approval.component';
import { FormsModule } from '@angular/forms';
import { MatStepperModule } from '@angular/material/stepper';
import { MatIconModule } from '@angular/material/icon';
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
  declarations: [ApprovalBinComponent, ApprovalComponent, AppraisalBinComponent, KpiApprovalComponent, KpiBinComponent,
    KpiForApprovalComponent, LeaveapprovalbinComponent, PendingApprovalsComponent, PendingResumptionComponent, ResumptionApprovalComponent,
    AppraisalApprovalComponent],
  imports: [
    CommonModule,
    ApprovalsRoutingModule, FormsModule,
    MatStepperModule,
    MatIconModule,
    DxSelectBoxModule,
    DxTextAreaModule,
    DxDateBoxModule,
    DxFormModule,
    DxDataGridModule,
    DxSpeedDialActionModule,
    NgSelectModule
  ]
})
export class ApprovalsModule { }
