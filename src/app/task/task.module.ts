import { NgModule } from '@angular/core';
import { CommonModule } from '@angular/common';

import { TaskRoutingModule } from './task-routing.module';
import { TaskComponent } from './task/task.component';
import { TasknoteComponent } from './tasknote/tasknote.component';
import { TaskpriorityComponent } from './taskpriority/taskpriority.component';
import { TaskstatusComponent } from './taskstatus/taskstatus.component';
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
    DxSchedulerModule, DxScrollViewModule, DxSortableModule, DxPivotGridModule, DxChartModule, DxCheckBoxModule, DxPieChartModule
} from 'devextreme-angular';
import { TaskdelegationComponent } from './taskdelegation/taskdelegation.component';
import { TasknoteViewComponent } from './tasknote-view/tasknote-view.component';
import { TaskCalendarComponent } from './task-calendar/task-calendar.component';
import { TasknoteAdminComponent } from './tasknote-admin/tasknote-admin.component';
import { TaskAdminComponent } from './task-admin/task-admin.component';
import { ViewTasksComponent, DialogOverviewExampleDialog, TaskNoteDialog } from './view-tasks/view-tasks.component';
import { MatDialogModule } from '@angular/material/dialog';
import { RateTasksComponent } from './rate-tasks/rate-tasks.component';
import { TaskReportComponent } from './task-report/task-report.component';
import { TaskChartComponent } from './task-chart/task-chart.component';

@NgModule({
    imports: [
        CommonModule,
        TaskRoutingModule,
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
        DxSchedulerModule, DxScrollViewModule, DxSortableModule,
        MatDialogModule,
        DxPivotGridModule,
        DxChartModule, DxCheckBoxModule, DxPieChartModule
    ],
    declarations: [
        TaskComponent,
        TaskdelegationComponent,
        TasknoteComponent,
        TaskpriorityComponent,
        TaskstatusComponent,
        TasknoteViewComponent,
        TaskCalendarComponent,
        TasknoteComponent,
        TasknoteAdminComponent,
        TaskAdminComponent,
        ViewTasksComponent,
        DialogOverviewExampleDialog,
        RateTasksComponent, TaskNoteDialog, TaskReportComponent, TaskChartComponent
    ],
})
export class TaskModule { }
