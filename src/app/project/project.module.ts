import { NgModule } from '@angular/core';
import { CommonModule } from '@angular/common';

import { ProjectRoutingModule } from './project-routing.module';
import { MilestonemonitoringComponent } from './milestonemonitoring/milestonemonitoring.component';
import { ProjectComponent } from './project/project.component';
import { ProjectdocumentuploadComponent } from './projectdocumentupload/projectdocumentupload.component';
import { ProjectexpenseComponent } from './projectexpense/projectexpense.component';
import { ProjectmanagerComponent } from './projectmanager/projectmanager.component';
import { ProjectmilestoneComponent } from './projectmilestone/projectmilestone.component';
import { ProjectreviewComponent } from './projectreview/projectreview.component';
import { ProjectreviewplanComponent } from './projectreviewplan/projectreviewplan.component';
import { ProjectriskComponent } from './projectrisk/projectrisk.component';
import { ProjectstatusComponent } from './projectstatus/projectstatus.component';
import { ProjectsubtypeComponent } from './projectsubtype/projectsubtype.component';
import { ProjecttaskComponent } from './projecttask/projecttask.component';
import { ProjectteamComponent } from './projectteam/projectteam.component';
import { ProjecttoolComponent } from './projecttool/projecttool.component';
import { ProjecttypeComponent } from './projecttype/projecttype.component';
import { RiskComponent } from './risk/risk.component';
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
    DxSpeedDialActionModule,
    DxTreeListModule
} from 'devextreme-angular';
import { ProjectOverviewComponent } from './project-overview/project-overview.component';
import { RiskMitigantComponent } from './risk-mitigant/risk-mitigant.component';
import { DashboardComponent } from './dashboard/dashboard.component';
import { ProjectcategoryComponent } from './projectcategory/projectcategory.component';
import { ProjectsubcategoryComponent } from './projectsubcategory/projectsubcategory.component';
import { ProjectteamreassignmentComponent } from './projectteamreassignment/projectteamreassignment.component';
import { ProjectViewComponent } from './project-view/project-view.component';
import { ProjectsubComponent } from './projectsub/projectsub.component';
import { ProjectsubViewComponent } from './projectsub-view/projectsub-view.component';
import { ProjectsubInfoComponent } from './projectsub-info/projectsub-info.component';

@NgModule({
    imports: [
        CommonModule,
        ProjectRoutingModule,
        FormsModule,
        NgSelectModule,
        MatStepperModule,
        MatIconModule,
        DxSelectBoxModule,
        DxTextAreaModule,
        DxDateBoxModule,
        DxFormModule,
        DxDataGridModule,
        DxSpeedDialActionModule,
        DxTreeListModule,
    ],
    declarations: [
        MilestonemonitoringComponent,
        ProjectComponent,
        ProjectOverviewComponent,
        ProjectdocumentuploadComponent,
        ProjectexpenseComponent,
        ProjectmanagerComponent,
        ProjectmilestoneComponent,
        ProjectreviewComponent,
        ProjectreviewplanComponent,
        ProjectriskComponent,
        ProjectstatusComponent,
        ProjectsubtypeComponent,
        ProjecttaskComponent,
        ProjectteamComponent,
        ProjecttoolComponent,
        ProjecttypeComponent,
        RiskComponent,
        RiskMitigantComponent,
        DashboardComponent,
        ProjectcategoryComponent,
        ProjectsubcategoryComponent,
        ProjectteamreassignmentComponent,
        ProjectViewComponent,
        ProjectsubComponent,
        ProjectsubViewComponent,
        ProjectsubInfoComponent,
    ],
})
export class ProjectModule {}
