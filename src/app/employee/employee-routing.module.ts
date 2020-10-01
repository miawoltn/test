
import { NgModule } from '@angular/core';
import { Routes, RouterModule } from '@angular/router';
import { EmployeeComponent } from './employee/employee.component';
import { EmployeeeducationComponent } from './employeeeducation/employeeeducation.component';
import { EmployeefamilyComponent } from './employeefamily/employeefamily.component';
import { EmployeeguarantorComponent } from './employeeguarantor/employeeguarantor.component';
import { RelationshipComponent } from './relationship/relationship.component';
import { EmployeedeploymentComponent } from './employeedeployment/employeedeployment.component';
import { EmployeedesignationComponent } from './employeedesignation/employeedesignation.component';
import { EmployeetitleComponent } from './employeetitle/employeetitle.component';
import { EmployeetypeComponent } from './employeetype/employeetype.component';
import { EmployeeprofileComponent } from './employee-profile/employee-profile.component';
import { EmployeerewardComponent } from './employeereward/employeereward.component';
import { EmployeesanctionComponent } from './employeesanction/employeesanction.component';
import { OffenceComponent } from './offence/offence.component';
import { RewardComponent } from './reward/reward.component';
import { SanctionComponent } from './sanction/sanction.component';
import { NewRegistrationComponent } from './new-registration/new-registration.component';
import { EmployeeDataComponent } from './employee-data/employee-data.component';
import { EmployeeReportComponent } from './employee-report/employee-report.component';
import { ReportComponent } from './report/report.component';
import { DashbboardComponent } from './dashbboard/dashbboard.component';
import { FileUploadModule } from './file-upload/file-upload.module';
import { HealthInsuranceProviderComponent } from './health-insurance-provider/health-insurance-provider.component';
import { PensionProviderComponent } from './pension-provider/pension-provider.component';
import { IdentificationComponent } from './identification/identification.component';
import { NewRegistrationOnboardingComponent } from './new-registration-onboarding/new-registration-onboarding.component';
import { EmployeeEditComponent } from './employee-edit/employee-edit.component';
import { EmployeePromptEditComponent } from './employee-prompt-edit/employee-prompt-edit.component';

const routes: Routes = [{
  path: '',
  data: { breadcrumb: 'Employees' },
  children: [
    { path: '', component: DashbboardComponent, data: { breadcrumb: null } },
    { path: 'employee', component: EmployeeComponent, data: { breadcrumb: 'Employee' } },
    { path: 'employeedeployment', component: EmployeedeploymentComponent, data: { breadcrumb: 'Employee Deployment' } },
    { path: 'employeeeducation', component: EmployeeeducationComponent, data: { breadcrumb: 'Employee Eduction' } },
    { path: 'employeefamily', component: EmployeefamilyComponent, data: { breadcrumb: 'Employee Family' } },
    { path: 'employeeguarantor', component: EmployeeguarantorComponent, data: { breadcrumb: 'Employee Guarantors' } },
    { path: 'employeedesignation', component: EmployeedesignationComponent, data: { breadcrumb: 'Employee Designations' } },
    { path: 'employeetitle', component: EmployeetitleComponent, data: { breadcrumb: 'Employee Title' } },
    { path: 'employeetype', component: EmployeetypeComponent, data: { breadcrumb: 'Employee Type' } },
    { path: 'relationship', component: RelationshipComponent, data: { breadcrumb: 'Relationships' } },
    { path: 'employee-profile/:id', component: EmployeeprofileComponent, data: { breadcrumb: 'Employee Profile' } },
    { path: 'employee-data/:id', component: EmployeeDataComponent, data: { breadcrumb: 'Employee Profile' } },
    { path: 'employeereward', component: EmployeerewardComponent, data: { breadcrumb: 'Employee Reward' } },
    { path: 'employeesanction', component: EmployeesanctionComponent, data: { breadcrumb: 'Employee Sanctions' } },
    { path: 'offence', component: OffenceComponent, data: { breadcrumb: 'Offences' } },
    { path: 'reward', component: RewardComponent, data: { breadcrumb: 'Rewards' } },
    { path: 'sanction', component: SanctionComponent, data: { breadcrumb: 'Sanctions' } },
    { path: 'new-employee', component: NewRegistrationComponent, data: { breadcrumb: 'Employee Registration' } },
    { path: 'employee-onboarding/:id', component: NewRegistrationOnboardingComponent, data: { breadcrumb: 'Employee Registration' } },
    { path: 'report-chart', component: EmployeeReportComponent, data: { breadcrumb: 'Employee Reports Chart' } },
    { path: 'report', component: ReportComponent, data: { breadcrumb: 'Employee Reports' } },
    { path: 'file-upload', component: FileUploadModule, data: { breadcrumb: 'Employee Reports' } },
    { path: 'health-insurance-provider', component: HealthInsuranceProviderComponent, data: { breadcrumb: 'Health Insurance Provider' } },
    { path: 'pension-provider', component: PensionProviderComponent, data: { breadcrumb: 'Pension Provider' } },
    { path: 'identification', component: IdentificationComponent, data: { breadcrumb: 'Pension Provider' } },
    { path: 'edit-employee', component: EmployeeEditComponent, data: { breadcrumb: 'Edit Employee' } },
    { path: 'employee-prompt-edit', component: EmployeePromptEditComponent, data: { breadcrumb: 'Edit Employee' } },
  ]
}
];

@NgModule({
  imports: [RouterModule.forChild(routes)],
  exports: [RouterModule]
})
export class EmployeeRoutingModule { }

