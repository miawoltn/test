import { NgModule } from '@angular/core';
import { Routes, RouterModule } from '@angular/router';
import { TaskComponent } from './task/task.component';
import { TaskdelegationComponent } from './taskdelegation/taskdelegation.component';
import { TasknoteComponent } from './tasknote/tasknote.component';
import { TaskpriorityComponent } from './taskpriority/taskpriority.component';
import { TaskstatusComponent } from './taskstatus/taskstatus.component';
import { TasknoteViewComponent } from './tasknote-view/tasknote-view.component';
import { TaskCalendarComponent } from './task-calendar/task-calendar.component';
import { TasknoteAdminComponent } from './tasknote-admin/tasknote-admin.component';
import { TaskAdminComponent } from './task-admin/task-admin.component';
import { ViewTasksComponent } from './view-tasks/view-tasks.component';
import { RateTasksComponent } from './rate-tasks/rate-tasks.component';
import { TaskReportComponent } from './task-report/task-report.component';
import { TaskChartComponent } from './task-chart/task-chart.component';

const routes: Routes = [{
    path: '',
    data: { breadcrumb: 'Task Manager' },
    children: [
        { path: 'task', component: TaskComponent, data: { breadcrumb: 'Tasks' } },
        { path: 'task-admin', component: TaskAdminComponent, data: { breadcrumb: 'Task Admin' } },
        { path: 'task-calendar', component: TaskCalendarComponent, data: { breadcrumb: 'Task Calendar' } },
        { path: 'taskdelegation', component: TaskdelegationComponent, data: { breadcrumb: 'Task Delegation' } },
        { path: 'tasknote', component: TasknoteComponent, data: { breadcrumb: 'Task Notes' } },
        { path: 'tasknote-admin', component: TasknoteAdminComponent, data: { breadcrumb: 'Task Notes (Admin)' } },
        { path: 'tasknote-view', component: TasknoteViewComponent, data: { breadcrumb: 'View Task Note' } },
        { path: 'taskpriority', component: TaskpriorityComponent, data: { breadcrumb: 'Priority' } },
        { path: 'taskstatus', component: TaskstatusComponent, data: { breadcrumb: 'Task Status' } },
        { path: 'view', component: ViewTasksComponent, data: { breadcrumb: 'View Tasks' } },
        { path: 'rate', component: RateTasksComponent, data: { breadcrumb: 'Rate Tasks' } },
        { path: 'report', component: TaskReportComponent, data: { breadcrumb: 'Report' } },
        { path: 'chart', component: TaskChartComponent, data: { breadcrumb: 'Charts' } },
        { path: '', component: ViewTasksComponent, data: { breadcrumb: 'View Tasks' } }]
}
];

@NgModule({
    imports: [RouterModule.forChild(routes)],
    exports: [RouterModule],
})
export class TaskRoutingModule { }
