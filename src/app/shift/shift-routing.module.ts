import { NgModule } from '@angular/core';
import { Routes, RouterModule } from '@angular/router';
import { ShiftsComponent } from './shifts/shifts.component';
import { Shift_categoryComponent } from './shift_category/shift_category.component';
import { Shift_configComponent } from './shift_config/shift_config.component';
import { Shift_daysComponent } from './shift_days/shift_days.component';
import { Shift_excludeComponent } from './shift_exclude/shift_exclude.component';
import { Shift_schedulesComponent } from './shift_schedules/shift_schedules.component';
import { Shift_schedule_detailsComponent } from './shift_schedule_details/shift_schedule_details.component';
import { Shift_schedule_employeesComponent } from './shift_schedule_employees/shift_schedule_employees.component';
import { Shift_statusComponent } from './shift_status/shift_status.component';
import { Shift_status_categoryComponent } from './shift_status_category/shift_status_category.component';
import { Shift_templatesComponent } from './shift_templates/shift_templates.component';
import { Shift_template_detailsComponent } from './shift_template_details/shift_template_details.component';
import { Shift_transactionsComponent } from './shift_transactions/shift_transactions.component';
import { Shift_typesComponent } from './shift_types/shift_types.component';

const routes: Routes = [{
    path: '',
    data: { breadcrumb: 'Attendance' },
    children: [
    { path: 'shifts', component: ShiftsComponent, data: { breadcrumb: 'Shift' } },
    { path: 'shift_category', component: Shift_categoryComponent , data: { breadcrumb: 'Shift Category Component' }},
    { path: 'shift_config', component: Shift_configComponent , data: { breadcrumb: 'Shift Configuration Component' } },
    { path: 'shift_days', component: Shift_daysComponent, data: { breadcrumb: 'Shift Days Component' }},
    { path: 'shift_exclude', component: Shift_excludeComponent, data: { breadcrumb: 'Shift Exclude Component' }},
    { path: 'shift_schedules', component: Shift_schedulesComponent, data: { breadcrumb: 'Shift Schedules Component' }},
    {
        path: 'shift_schedule_details',
        component: Shift_schedule_detailsComponent,
        data: { breadcrumb: 'shift Schedule Details' }

    },
    {
        path: 'shift_schedule_employees',
        component: Shift_schedule_employeesComponent,
        data: { breadcrumb: 'shift Schedule Employees' }
    },
    { path: 'shift_status', component: Shift_statusComponent, data: { breadcrumb: 'Shift Status' }},
    {
        path: 'shift_status_category',
        component: Shift_status_categoryComponent,
        data: { breadcrumb: 'Shift Status Category' }
    },
    { path: 'shift_templates', component: Shift_templatesComponent, data: { breadcrumb: 'Shift Templates' }},
    {
        path: 'shift_template_details',
        component: Shift_template_detailsComponent,
        data: { breadcrumb: 'Shift Template Details' }
    },
    { path: 'shift_transactions', component: Shift_transactionsComponent, data: { breadcrumb: 'Shift Transactions' }},
    { path: 'shift_types', component: Shift_typesComponent, data: { breadcrumb: 'Shift Types' }},]}
];

@NgModule({
    imports: [RouterModule.forChild(routes)],
    exports: [RouterModule],
})
export class ShiftRoutingModule {}
