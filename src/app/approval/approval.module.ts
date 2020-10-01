
import { NgModule } from '@angular/core'; 
import { CommonModule } from '@angular/common';

import { ApprovalRoutingModule } from './approval-routing.module';
import { ApprovalComponent } from './approval/approval.component'import { ApprovalcreditscoringComponent } from './approvalcreditscoring/approvalcreditscoring.component'import { ApprovalinstancesComponent } from './approvalinstances/approvalinstances.component'import { ApprovallimitComponent } from './approvallimit/approvallimit.component'import { ApprovalloanComponent } from './approvalloan/approvalloan.component'import { ApprovalprocessflowComponent } from './approvalprocessflow/approvalprocessflow.component'import { ApprovalprocessmoduleComponent } from './approvalprocessmodule/approvalprocessmodule.component'import { ApprovalprocesstypeComponent } from './approvalprocesstype/approvalprocesstype.component'import { ApprovalstagesComponent } from './approvalstages/approvalstages.component'import { ApprovaltypeComponent } from './approvaltype/approvaltype.component';
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
    ApprovalRoutingModule,
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
  declarations: [ApprovalComponent,ApprovalcreditscoringComponent,ApprovalinstancesComponent,ApprovallimitComponent,ApprovalloanComponent,ApprovalprocessflowComponent,ApprovalprocessmoduleComponent,ApprovalprocesstypeComponent,ApprovalstagesComponent,ApprovaltypeComponent]
})
export class ApprovalModule { }

