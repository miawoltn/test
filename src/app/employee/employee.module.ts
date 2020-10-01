
import { NgModule } from '@angular/core';
import { CommonModule } from '@angular/common';

import { EmployeeRoutingModule } from './employee-routing.module';
import { EmployeeComponent } from './employee/employee.component'
import { EmployeeeducationComponent } from './employeeeducation/employeeeducation.component'
import { EmployeefamilyComponent } from './employeefamily/employeefamily.component'
import { EmployeeguarantorComponent } from './employeeguarantor/employeeguarantor.component'
import { RelationshipComponent } from './relationship/relationship.component';
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
  DxPivotGridModule,
  DxChartModule,
  DxCheckBoxModule,
  DxPieChartModule,
  DxFileUploaderModule
} from "devextreme-angular";
import { EmployeedeploymentComponent } from "./employeedeployment/employeedeployment.component";
import { EmployeedesignationComponent } from "./employeedesignation/employeedesignation.component";
import { EmployeetitleComponent } from "./employeetitle/employeetitle.component";
import { EmployeetypeComponent } from "./employeetype/employeetype.component";
import { EmployeeprofileComponent } from "./employee-profile/employee-profile.component";
import { EmployeerewardComponent } from "./employeereward/employeereward.component";
import { EmployeesanctionComponent } from "./employeesanction/employeesanction.component";
import { OffenceComponent } from "./offence/offence.component";
import { RewardComponent } from "./reward/reward.component";
import { SanctionComponent } from "./sanction/sanction.component";
import { NewRegistrationComponent } from "./new-registration/new-registration.component";
import { EmployeeDataComponent } from "./employee-data/employee-data.component";
import { EmployeeworkhistoryComponent } from "./employeeworkhistory/employeeworkhistory.component";
import { EmployeeReportComponent } from "./employee-report/employee-report.component";
import { ReportComponent } from "./report/report.component";
import { DashbboardComponent } from "./dashbboard/dashbboard.component";
import { FileUploadModule } from "./file-upload/file-upload.module";
import { PensionProviderComponent } from "./pension-provider/pension-provider.component";
import { HealthInsuranceProviderComponent } from "./health-insurance-provider/health-insurance-provider.component";
import { IdentificationComponent } from "./identification/identification.component";
import { NewRegistrationOnboardingComponent } from './new-registration-onboarding/new-registration-onboarding.component';
import {MatRadioModule} from '@angular/material/radio';
import { EmployeeDependentComponent } from './employeedependent/employeedependent.component';
import { EmployeeModalComponent } from './employee-modal/employee-modal.component';
import { EmployeeEditComponent } from './employee-edit/employee-edit.component';
import { TextMaskModule } from 'angular2-text-mask';
import { EmployeePromptEditComponent } from './employee-prompt-edit/employee-prompt-edit.component';

@NgModule({
  imports: [
    CommonModule,
    EmployeeRoutingModule,
    FormsModule,
    NgSelectModule,
    MatStepperModule,
    MatIconModule,
    MatRadioModule,
    DxSelectBoxModule,
    DxTextAreaModule,
    DxDateBoxModule,
    DxFormModule,
    DxDataGridModule,
    DxSpeedDialActionModule,
    DxPivotGridModule,
    DxChartModule,
    DxCheckBoxModule,
    DxPieChartModule,
    FileUploadModule,
    DxFileUploaderModule,
    TextMaskModule,
  ],
  declarations: [
    EmployeeComponent,
    EmployeedeploymentComponent,
    EmployeeDependentComponent,
    EmployeedesignationComponent,
    EmployeeeducationComponent,
    EmployeefamilyComponent,
    EmployeeguarantorComponent,
    EmployeetitleComponent,
    EmployeetypeComponent,
    RelationshipComponent,
    EmployeeprofileComponent,
    EmployeerewardComponent,
    EmployeesanctionComponent,
    OffenceComponent,
    RewardComponent,
    SanctionComponent,
    NewRegistrationComponent,
    EmployeeDataComponent,
    EmployeeworkhistoryComponent,
    EmployeeReportComponent,
    ReportComponent,
    DashbboardComponent,
    PensionProviderComponent,
    HealthInsuranceProviderComponent,
    IdentificationComponent,
    NewRegistrationOnboardingComponent,
    EmployeeModalComponent,
    EmployeeEditComponent,
    EmployeePromptEditComponent,
  ],
})
export class EmployeeModule { }