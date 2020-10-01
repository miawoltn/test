import { NgModule } from '@angular/core';
import { CommonModule } from '@angular/common';

import { PrivilegeRoutingModule } from './privilege-routing.module';
import { PrivilegesComponent } from './privileges/privileges.component';
import { Privilege_activityComponent } from './privilege_activity/privilege_activity.component';
import { Privilege_activitydetailsComponent } from './privilege_activitydetails/privilege_activitydetails.component';
import { Privilege_assignComponent } from './privilege_assign/privilege_assign.component';
import { Privilege_classComponent } from './privilege_class/privilege_class.component';
import { Privilege_detailsComponent } from './privilege_details/privilege_details.component';
import { Privilege_headerComponent } from './privilege_header/privilege_header.component';
import { Privilege_typeComponent } from './privilege_type/privilege_type.component';
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
} from 'devextreme-angular';

@NgModule({
    imports: [
        CommonModule,
        PrivilegeRoutingModule,
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
    ],
    declarations: [
        PrivilegesComponent,
        Privilege_activityComponent,
        Privilege_activitydetailsComponent,
        Privilege_assignComponent,
        Privilege_classComponent,
        Privilege_detailsComponent,
        Privilege_headerComponent,
        Privilege_typeComponent,
    ],
})
export class PrivilegeModule {}
