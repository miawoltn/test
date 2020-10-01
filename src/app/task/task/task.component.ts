import { projectUrl } from './../../project/project-url';
import { employeeUrl } from './../../employee/employee-url';
import { Component, OnInit, ViewChild } from '@angular/core';
import { HttpService } from 'src/app/services/http.service';
import swal from 'sweetalert2';
import { ActivatedRoute } from '@angular/router';
import { taskUrl } from '../task-url';
import { MatStepper } from '@angular/material/stepper';

@Component({
    selector: 'app-task',
    templateUrl: './task.component.html',
    styleUrls: ['./task.component.scss'],
})
export class TaskComponent implements OnInit {
    @ViewChild('stepper', { static: true }) private myStepper: MatStepper;

    title = 'Add Task';
    isEditable = true;
    isLinear = true;
    subtotal = 0;

    obj = {
        Task: null,
        PriorityID: null,
        TaskStatusID: null,
        AssignTo: null,
        TaskNoteID: null,
        ProjectID: null,
        CustomerID: null,
        DueDate: null,
        SurName: null,
        TaskNote: null,
        TaskPriority: null,
        TaskStatus: null,
        Priority: null,
    };
    operation = 'Add';
    employee = [];
    project = [];
    tasknote = [];
    taskpriority = [];
    taskstatus = [];

    constructor(protected http: HttpService, protected route: ActivatedRoute) { }

    ngOnInit() {
        this.route.params.subscribe((params) => {
            console.log(params);
            if (params['id']) this.loadItem(params['id']);
        });
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
        this.http.get(taskUrl.tasknote.list).subscribe(
            (success) => {
                this.tasknote = success.data;
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

    // addItem() {
    //   this.obj.detail.push({});
    // }

    // removeItem(i) {
    //   this.obj.detail.splice(i, 1);
    // }

    onConfirm() {
        console.log('TaskComponent -> onConfirm -> this.obj', this.obj);
        this.obj.CustomerID = this.project.find(
            (item) => this.obj.ProjectID == item.id
        ).ProjectDescription;


        this.obj.TaskPriority = this.taskpriority.find(
            (item) => item.id === this.obj.PriorityID
        ).TaskPriority

        this.obj.TaskStatus = this.taskstatus.find(
            (item) => item.id === this.obj.TaskStatusID
        ).TaskStatus

        // console.log(this.obj.TaskStatus)

        this.obj.SurName = this.employee.find(
            (item) => this.obj.AssignTo == item.id
        ).FullName;

        this.obj.TaskNote = this.tasknote.find(
            (item) => this.obj.TaskNoteID == item.id
        ).TaskNote;

        this.obj.TaskStatus = this.taskstatus.find(
            (item) => this.obj.TaskStatusID == item.id
        ).TaskStatus;
    }

    processForm() {
        let url = taskUrl.task.add;
        if (this.operation == 'Update') url = taskUrl.task.update;
        this.save(url);
    }

    save(url) {
        this.http.post(url, this.obj).subscribe(
            (success) => {
                swal.fire('Success', success.message, 'success');
                this.isEditable = false;
            },
            (error) => {
                console.log(error);
                swal.fire(
                    'Error',
                    error.message || 'Some Error Occured',
                    'error'
                );
            }
        );
    }

    resetForm() {
        this.obj = {
            Task: null,
            PriorityID: null,
            TaskStatusID: null,
            AssignTo: null,
            TaskNoteID: null,
            ProjectID: null,
            CustomerID: null,
            DueDate: null,
            SurName: null,
            TaskNote: null,
            TaskPriority: null,
            TaskStatus: null,
            Priority: null,
        };

        this.operation = 'Add';
        this.isEditable = true;
    }

    hideForm() {
        // this.isEditable = false;
        // stepper.reset()
    }

    loadItem(id) {
        this.http.get(taskUrl.task.get + '/' + id).subscribe(
            (success) => {
                this.obj = success.data;
                this.isEditable = true;
                this.operation = 'Update';
            },
            (error) => {
                console.log(error);
                swal.fire(
                    'Error',
                    error.message || 'Some Error Occured',
                    'error'
                );
            }
        );
    }
}
