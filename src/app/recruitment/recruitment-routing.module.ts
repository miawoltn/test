import { NgModule } from '@angular/core';
import { Routes, RouterModule } from '@angular/router';
import { ApplicantcvComponent } from './applicantcv/applicantcv.component';
import { ApplicantsComponent } from './applicants/applicants.component';
import { ContracttypeComponent } from './contracttype/contracttype.component';
import { EmploymenttypeComponent } from './employmenttype/employmenttype.component';
import { ExperiencelevelComponent } from './experiencelevel/experiencelevel.component';
import { JobapplicationComponent } from './jobapplication/jobapplication.component';
import { JobinterviewComponent } from './jobinterview/jobinterview.component';
import { JobinterviewdetailComponent } from './jobinterviewdetail/jobinterviewdetail.component';
import { JobofferComponent } from './joboffer/joboffer.component';
import { JobshortlistComponent } from './jobshortlist/jobshortlist.component';
import { JobshortlistdetailComponent } from './jobshortlistdetail/jobshortlistdetail.component';
import { RecruitmentstageComponent } from './recruitmentstage/recruitmentstage.component';
import { RecruitmentstatusComponent } from './recruitmentstatus/recruitmentstatus.component';
import { VacancyComponent } from './vacancy/vacancy.component';
import { JobInterviewViewComponent } from './jobinterview-view/jobinterview-view.component';
import { JobShortlistViewComponent } from './jobshortlist-view/jobshortlist-view.component';
import { SkillsComponent } from './skills/skills.component';
import { JobshortlistDetailsViewComponent } from './jobshortlist-details-view/jobshortlist-details-view.component';
import { JobinterviewDetailsViewComponent } from './jobinterview-details-view/jobinterview-details-view.component';
import { YearsOfExperienceComponent } from './years-of-experience/years-of-experience.component';
import { ProfessionsComponent } from './professions/professions.component';
import { Joboffer2Component } from './joboffer2/joboffer2.component';
import { ApplicantProfileComponent } from './applicant-profile/applicant-profile.component';
// tslint:disable-next-line:max-line-length
import { JobinterviewDetailsViewNotRecommendedComponent } from './jobinterview-details-view-not-commended/jobinterview-details-view-not-commended.component';
import { ProfessionGroupComponent } from './profession-group/profession-group.component';
import { EmployeeOnboardingComponent } from './employee-onboarding/employee-onboarding.component';
import { JobshortlistHistoryComponent } from './jobshortlist-history/jobshortlist-history.component';
import { JobinterviewHistoryComponent } from './jobinterview-history/jobinterview-history.component';
import { DashboardComponent } from './dashboard/dashboard.component';

const routes: Routes = [{
    path: '',
    data: {
        breadcrumb: 'Recruitment'
    },
    children: [
        { path: '', component: DashboardComponent, data: { breadcrumb: 'Dashboard' } },
        { path: 'dashboard', component: DashboardComponent, data: { breadcrumb: 'Dashboard' } },
        { path: 'applicantcv', component: ApplicantcvComponent, data: { breadcrumb: '' } },
        { path: 'applicant-profile/:id', component: ApplicantProfileComponent, data: { breadcrumb: 'Applicant Profile' } },
        { path: 'applicants', component: ApplicantsComponent, data: { breadcrumb: 'Applicants' } },
        { path: 'contracttype', component: ContracttypeComponent, data: { breadcrumb: 'Contract Type' } },
        { path: 'employmenttype', component: EmploymenttypeComponent, data: { breadcrumb: 'Employeement Type' } },
        { path: 'experiencelevel', component: ExperiencelevelComponent, data: { breadcrumb: 'Experience Level' } },
        { path: 'jobapplication', component: JobapplicationComponent, data: { breadcrumb: 'Job Applications' } },
        { path: 'jobinterview', component: JobinterviewComponent, data: { breadcrumb: 'Create Job Interview' } },
        { path: 'jobinterview-view', component: JobInterviewViewComponent, data: { breadcrumb: 'View Job Interviews' } },
        { path: 'jobshortlist-detail-view', component: JobshortlistDetailsViewComponent, data: { breadcrumb: 'View Job Interviews' } },
        { path: 'jobinterview-detail-view', component: JobinterviewDetailsViewComponent, data: { breadcrumb: 'View Job Interviews' } },
        {
            path: 'jobinterview-detail-view-not-recommended',
            component: JobinterviewDetailsViewNotRecommendedComponent, data: { breadcrumb: 'View Job Interviews' }
        },
        { path: 'jobinterviewdetail', component: JobinterviewdetailComponent, data: { breadcrumb: '' } },
        { path: 'jobinterview-history', component: JobinterviewHistoryComponent, data: { breadcrumb: '' } },
        { path: 'joboffer', component: JobofferComponent, data: { breadcrumb: 'Job Offer Bin' } },
        { path: 'joboffer2', component: Joboffer2Component, data: { breadcrumb: 'Job Offers' } },
        { path: 'jobshortlist', component: JobshortlistComponent, data: { breadcrumb: 'Shortlisting' } },
        { path: 'jobshortlist-view', component: JobShortlistViewComponent, data: { breadcrumb: 'Shortlisting' } },
        { path: 'jobshortlistdetail', component: JobshortlistdetailComponent, data: { breadcrumb: '' } },
        { path: 'jobshortlist-history', component: JobshortlistHistoryComponent, data: { breadcrumb: '' } },
        { path: 'recruitmentstage', component: RecruitmentstageComponent, data: { breadcrumb: 'Recruitment Stages' } },
        { path: 'recruitmentstatus', component: RecruitmentstatusComponent, data: { breadcrumb: 'Recruitment Status' } },
        { path: 'vacancy', component: VacancyComponent, data: { breadcrumb: 'Vacancy' } },
        { path: 'skills', component: SkillsComponent, data: { breadcrumb: 'Skill' } },
        { path: 'years-of-experience', component: YearsOfExperienceComponent, data: { breadcrumb: 'Years Of Experience' } },
        { path: 'professions', component: ProfessionsComponent, data: { breadcrumb: 'Professions' } },
        { path: 'profession-group', component: ProfessionGroupComponent, data: { breadcrumb: 'Profession Group' } },
        { path: 'on-boarding', component: EmployeeOnboardingComponent, data: { breadcrumb: 'Employee On-Boarding' } },
    ]
},
];

@NgModule({
    imports: [RouterModule.forChild(routes)],
    exports: [RouterModule],
})
export class RecruitmentRoutingModule { }
