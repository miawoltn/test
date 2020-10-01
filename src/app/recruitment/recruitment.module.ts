import { NgModule } from "@angular/core";
import { CommonModule } from "@angular/common";

import { RecruitmentRoutingModule } from "./recruitment-routing.module";
import { ApplicantcvComponent } from "./applicantcv/applicantcv.component";
import { ApplicantsComponent } from "./applicants/applicants.component";
import { ContracttypeComponent } from "./contracttype/contracttype.component";
import { EmploymenttypeComponent } from "./employmenttype/employmenttype.component";
import { ExperiencelevelComponent } from "./experiencelevel/experiencelevel.component";
import { JobapplicationComponent } from "./jobapplication/jobapplication.component";
import { JobinterviewComponent } from "./jobinterview/jobinterview.component";
import { JobinterviewdetailComponent } from "./jobinterviewdetail/jobinterviewdetail.component";
import { JobofferComponent } from "./joboffer/joboffer.component";
import { JobshortlistComponent, DialogContentExampleDialog } from "./jobshortlist/jobshortlist.component";
import { JobshortlistdetailComponent } from "./jobshortlistdetail/jobshortlistdetail.component";
import { RecruitmentstageComponent } from "./recruitmentstage/recruitmentstage.component";
import { RecruitmentstatusComponent } from "./recruitmentstatus/recruitmentstatus.component";
import { VacancyComponent } from "./vacancy/vacancy.component";
import { FormsModule } from "@angular/forms";
import { MatIconModule } from "@angular/material/icon";
import { MatStepperModule } from "@angular/material/stepper";
import { NgSelectModule } from "@ng-select/ng-select";
import { MatRadioModule } from '@angular/material/radio';
import {
  DxSelectBoxModule,
  DxTextAreaModule,
  DxDateBoxModule,
  DxFormModule,
  DxDataGridModule,
  DxSpeedDialActionModule, DxCheckBoxModule, DxChartModule, DxPieChartModule
} from 'devextreme-angular';
import { JobInterviewViewComponent } from './jobinterview-view/jobinterview-view.component';
import { JobShortlistViewComponent } from './jobshortlist-view/jobshortlist-view.component';
import { SkillsComponent } from './skills/skills.component';
import { JobshortlistDetailsViewComponent } from './jobshortlist-details-view/jobshortlist-details-view.component';
import { JobinterviewDetailsViewComponent } from './jobinterview-details-view/jobinterview-details-view.component';
import { YearsOfExperienceComponent } from './years-of-experience/years-of-experience.component';
import { ProfessionsComponent } from './professions/professions.component';

import { CKEditorModule } from 'ckeditor4-angular';
import { Joboffer2Component } from './joboffer2/joboffer2.component';
import { ApplicantProfileComponent } from './applicant-profile/applicant-profile.component';
// tslint:disable-next-line:import-spacing
import { JobinterviewDetailsViewNotRecommendedComponent }
  from './jobinterview-details-view-not-commended/jobinterview-details-view-not-commended.component';
import { ProfessionGroupComponent } from './profession-group/profession-group.component';
import { EmployeeOnboardingComponent } from './employee-onboarding/employee-onboarding.component';
import { JobshortlistHistoryComponent, VacancyDialog } from './jobshortlist-history/jobshortlist-history.component';
import { JobinterviewHistoryComponent } from './jobinterview-history/jobinterview-history.component';
import { RecruitmentModalComponent } from './recruitment-modal/recruitment-modal.component';
import { DashboardComponent } from './dashboard/dashboard.component';

@NgModule({
  imports: [
    CommonModule,
    RecruitmentRoutingModule,
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
    MatRadioModule,
    CKEditorModule,
    DxCheckBoxModule, DxChartModule, DxPieChartModule
  ],
  declarations: [
    ApplicantProfileComponent,
    ApplicantcvComponent,
    ApplicantsComponent,
    ContracttypeComponent,
    EmploymenttypeComponent,
    ExperiencelevelComponent,
    JobapplicationComponent,
    JobinterviewComponent,
    JobinterviewdetailComponent,
    JobinterviewDetailsViewComponent,
    JobinterviewHistoryComponent,
    JobofferComponent,
    Joboffer2Component,
    JobshortlistComponent,
    JobshortlistdetailComponent,
    JobshortlistDetailsViewComponent,
    JobshortlistHistoryComponent,
    RecruitmentstageComponent,
    RecruitmentstatusComponent,
    VacancyComponent,
    JobInterviewViewComponent,
    JobShortlistViewComponent,
    SkillsComponent,
    YearsOfExperienceComponent,
    ProfessionsComponent,
    ProfessionGroupComponent,
    JobinterviewDetailsViewNotRecommendedComponent,
    DialogContentExampleDialog,
    VacancyDialog,
    EmployeeOnboardingComponent,
    RecruitmentModalComponent,
    DashboardComponent
  ],
})
export class RecruitmentModule { }
