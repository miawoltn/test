
import { NgModule } from '@angular/core'; 
import { CommonModule } from '@angular/common';

import { ShiftRoutingModule } from './shift-routing.module';
import { ShiftsComponent } from './shifts/shifts.component'import { Shift_categoryComponent } from './shift_category/shift_category.component'import { Shift_configComponent } from './shift_config/shift_config.component'import { Shift_daysComponent } from './shift_days/shift_days.component'import { Shift_excludeComponent } from './shift_exclude/shift_exclude.component'import { Shift_schedulesComponent } from './shift_schedules/shift_schedules.component'import { Shift_schedule_detailsComponent } from './shift_schedule_details/shift_schedule_details.component'import { Shift_schedule_employeesComponent } from './shift_schedule_employees/shift_schedule_employees.component'import { Shift_statusComponent } from './shift_status/shift_status.component'import { Shift_status_categoryComponent } from './shift_status_category/shift_status_category.component'import { Shift_templatesComponent } from './shift_templates/shift_templates.component'import { Shift_template_detailsComponent } from './shift_template_details/shift_template_details.component'import { Shift_transactionsComponent } from './shift_transactions/shift_transactions.component'import { Shift_typesComponent } from './shift_types/shift_types.component';
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
    ShiftRoutingModule,
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
  declarations: [ShiftsComponent,Shift_categoryComponent,Shift_configComponent,Shift_daysComponent,Shift_excludeComponent,Shift_schedulesComponent,Shift_schedule_detailsComponent,Shift_schedule_employeesComponent,Shift_statusComponent,Shift_status_categoryComponent,Shift_templatesComponent,Shift_template_detailsComponent,Shift_transactionsComponent,Shift_typesComponent]
})
export class ShiftModule { }

