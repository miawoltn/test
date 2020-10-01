import { NgModule } from '@angular/core';
import { CommonModule } from '@angular/common';

import { SelfServiceRoutingModule } from './self-service-routing.module';
import { DashboardComponent } from './dashboard/dashboard.component';
import { MyProfileComponent } from './my-profile/my-profile.component';
import { MyPaySlipsComponent } from './my-pay-slips/my-pay-slips.component';
import { ViewPaySlipComponent } from './view-pay-slip/view-pay-slip.component';

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
  DxChartModule,
  DxPieChartModule,
  DxFileUploaderModule, DxCheckBoxModule
} from 'devextreme-angular';
import { EmployeeProfileComponent } from './employee-profile/employee-profile.component';
import { EmployeeProfile2Component } from './employee-profile-2/employee-profile-2.component';
import { FileUploadModule } from '../employee/file-upload/file-upload.module';
import { SelfServiceModalComponent } from './self-service-modal/self-service-modal.component';

@NgModule({
  declarations: [
    DashboardComponent,
    MyProfileComponent,
    MyPaySlipsComponent,
    ViewPaySlipComponent,
    EmployeeProfileComponent,
    EmployeeProfile2Component,
    SelfServiceModalComponent,
  ],
  imports: [
    CommonModule,
    SelfServiceRoutingModule,
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
    DxChartModule,
    DxPieChartModule,
    FileUploadModule,
    DxFileUploaderModule, DxCheckBoxModule
  ],
})
export class SelfServiceModule {}
