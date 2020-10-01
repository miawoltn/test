import { NgModule } from '@angular/core';
import { Routes, RouterModule } from '@angular/router';
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

const routes: Routes = [{
    path: '',
    data: { breadcrumb: 'Project Mgt' },
    children: [
        { path: '', component: DashboardComponent, data: { breadcrumb: 'Dashboard' } },
        { path: 'milestonemonitoring', component: MilestonemonitoringComponent, data: { breadcrumb: 'Milestones' } },
        { path: 'project', component: ProjectComponent, data: { breadcrumb: 'Projects' } },
        { path: 'projectcategory', component: ProjectcategoryComponent, data: { breadcrumb: 'Projects' } },
        { path: 'projectsubcategory', component: ProjectsubcategoryComponent, data: { breadcrumb: 'Projects' } },
        { path: 'projectteamreassignment', component: ProjectteamreassignmentComponent, data: { breadcrumb: 'Projects' } },
        { path: 'project-view', component: ProjectViewComponent, data: { breadcrumb: 'Projects' } },
        { path: 'projectsub', component: ProjectsubComponent, data: { breadcrumb: 'Projects' } },
        { path: 'projectsub-view/:id', component: ProjectsubViewComponent, data: { breadcrumb: 'Projects' } },
        { path: 'projectsub-info/:id', component: ProjectsubInfoComponent, data: { breadcrumb: 'Projects' } },
        { path: 'project-overview/:id', component: ProjectOverviewComponent, data: { breadcrumb: 'Profie Information' } },
        {
            path: 'projectdocumentupload',
            component: ProjectdocumentuploadComponent
            , data: { breadcrumb: 'Uploads' }
        },
        { path: 'projectexpense', component: ProjectexpenseComponent, data: { breadcrumb: 'Expenses' } },
        { path: 'projectmanager', component: ProjectmanagerComponent, data: { breadcrumb: 'Project Managers' } },
        { path: 'projectmilestone', component: ProjectmilestoneComponent, data: { breadcrumb: 'Project Milestone' } },
        { path: 'projectreview', component: ProjectreviewComponent, data: { breadcrumb: 'Project Review' } },
        { path: 'projectreviewplan', component: ProjectreviewplanComponent, data: { breadcrumb: 'Review Plan' } },
        { path: 'projectrisk', component: ProjectriskComponent, data: { breadcrumb: 'Project Risks' } },
        { path: 'projectstatus', component: ProjectstatusComponent, data: { breadcrumb: 'Project Status' } },
        { path: 'projectsubtype', component: ProjectsubtypeComponent, data: { breadcrumb: 'Project Sub Type' } },
        { path: 'projecttask', component: ProjecttaskComponent, data: { breadcrumb: 'Project Task' } },
        { path: 'projectteam', component: ProjectteamComponent, data: { breadcrumb: 'Teams' } },
        { path: 'projecttool', component: ProjecttoolComponent, data: { breadcrumb: 'Tools' } },
        { path: 'projecttype', component: ProjecttypeComponent, data: { breadcrumb: 'Prject Types' } },
        { path: 'risk', component: RiskComponent, data: { breadcrumb: 'Risks' } },
        { path: 'risk-mitigant', component: RiskMitigantComponent, data: { breadcrumb: 'Risk Mitigants' } }
    ]
}
];

@NgModule({
    imports: [RouterModule.forChild(routes)],
    exports: [RouterModule],
})
export class ProjectRoutingModule { }
