import { Component, OnInit, ViewChild } from '@angular/core';
import { HttpService } from 'src/app/services/http.service';
import { taskUrl } from '../task-url';
import swal from 'sweetalert2';
import { MatStepper } from '@angular/material/stepper';
import { employeeUrl } from 'src/app/employee/employee-url';
import { projectUrl } from 'src/app/project/project-url';
@Component({
    selector: 'app-tasknote-view',
    templateUrl: './tasknote-view.component.html',
    styleUrls: ['./tasknote-view.component.scss'],
})
export class TasknoteViewComponent implements OnInit {
    displayedColumns: string[] = ['TaskPriority'];
    data = [];
    obj = { TaskPriority: null };
    displayForm = false;
    operation = 'Add';
    title = 'Taskpriority';
    parent = 'task';
    tasknotes: any;
    tasknoteList: any;
    taskInfo: any;
    employee: any;
    project: any;
    taskpriority: any;
    taskstatus: any;

    constructor(protected http: HttpService) {
        this.loadItem = this.loadItem.bind(this);
    }

    ngOnInit() {
        this.http.get(taskUrl.task.list).subscribe(
            (res) => {
                this.data = res.data;
            },
            (err) => {
                console.log(err);
            }
        );

        this.http.get(taskUrl.tasknote.list).subscribe(
            (res) => {
                this.tasknotes = res.data;
            },
            (err) => {
                console.log(err);
            }
        );

        this.http.get(employeeUrl.employee.list).subscribe(
            (success) => {
                this.employee = success.data;
            },
            (error) => {
                console.log(error);
            }
        );
        this.http.get(projectUrl.project.list).subscribe(
            (success) => {
                this.project = success.data;
            },
            (error) => {
                console.log(error);
            }
        );

        this.http.get(taskUrl.taskpriority.list).subscribe(
            (success) => {
                this.taskpriority = success.data;
            },
            (error) => {
                console.log(error);
            }
        );
        this.http.get(taskUrl.taskstatus.list).subscribe(
            (success) => {
                this.taskstatus = success.data;
            },
            (error) => {
                console.log(error);
            }
        );
    }

    showForm() {
        this.displayForm = true;
        window.scrollTo({ top: 0, left: 0, behavior: 'smooth' });
    }

    hideForm() {
        this.displayForm = false;
    }

    loadItem(id) {
        let taskId = id.row.data.TaskID;
        this.taskInfo = this.data.find(i => i.TaskID == taskId);
        console.log(this.taskInfo)

        this.taskInfo.Project = this.project.find(
            (item) => this.taskInfo.ProjectID == item.id
        ).ProjectDescription;
        
        this.taskInfo.TaskPriority = this.taskpriority.find(
            (item) => item.id === this.taskInfo.PriorityID
        ).TaskPriority
        
        this.taskInfo.TaskStatus = this.taskstatus.find(
            (item) => item.id === this.taskInfo.TaskStatusID
        ).TaskStatus

        this.taskInfo.AssignTo = this.employee.find(
            (item) => this.taskInfo.AssignTo == item.id
        ).FullName;



        this.tasknoteList = this.tasknotes.filter((item) => item.TaskID == taskId);
        console.log(this.tasknoteList)
        // this.operation = 'Update';
        this.showForm();
    }

    resetForm() {
        this.hideForm();
    }
}
