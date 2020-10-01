import { Component, OnInit, ViewChild } from '@angular/core';
import { HttpService } from 'src/app/services/http.service';
import { taskUrl } from '../task-url';
import swal from 'sweetalert2';
import { MatStepper } from '@angular/material/stepper';
import { employeeUrl } from 'src/app/employee/employee-url';
import { projectUrl } from 'src/app/project/project-url';
@Component({
    selector: 'app-tasknote-admin',
    templateUrl: './tasknote-admin.component.html',
    styleUrls: ['./tasknote-admin.component.scss'],
})
export class TasknoteAdminComponent implements OnInit {
    @ViewChild('stepper' ,{ static: true }) private myStepper: MatStepper;
    displayedColumns: string[] = ['TaskNote', 'TaskID', 'TaskStatus'];
    data = [];
    displayForm = false;
    operation = 'Add';
    parent = 'task';
    taskstatus = [];
    task: any;
    obj2 = {
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

    title = 'Add Task Note';
    isEditable = true;
    isLinear = true;
    subtotal = 0;

    employee = [];
    project = [];
    tasknote = [];
    taskpriority = [];

    obj = {
        TaskNote: null,
        TaskID: null,
        Task: null,
        TaskStatusID: null,
        TaskStatus: null,
    };

    isEditForm = false;

    constructor(protected http: HttpService) {
        this.loadItem = this.loadItem.bind(this);
        this.editItem = this.editItem.bind(this);
    }

    ngOnInit() {
        this.http.get(taskUrl.task.list).subscribe(
            (res) => {
                console.log(res.data);
                this.data = res.data;
            },
            (err) => {
                console.log(err);
            }
        );

        this.http.get(taskUrl.taskstatus.list).subscribe(
            (res) => {
                this.taskstatus = res.data;
            },
            (error) => {
                console.log(error);
            }
        );

        this.http.get(taskUrl.task.list).subscribe(
            (res) => {
                this.task = res.data;
            },
            (error) => {
                console.log(error);
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
    }

    showForm() {
        this.displayForm = true;
        window.scrollTo({ top: 0, left: 0, behavior: 'smooth' });
    }

    showEditForm() {
        this.isEditForm = true;
        window.scrollTo({ top: 0, left: 0, behavior: 'smooth' });
    }

    hideForm() {
        this.displayForm = false;
    }

    hideEditForm() {
        this.isEditForm = false;
    }

    addItem() {
        this.resetForm();
        this.showForm();
    }

    processForm() {
        let url = taskUrl.tasknote.add;
        if (this.operation === 'Update') { url = taskUrl.tasknote.update; }
        this.save(url);
    }

    processEditForm() {
        // let url = taskUrl.tasknote.add;
        const url = taskUrl.task.update;
        this.saveUpdate(url);
    }

    saveUpdate(url) {
        this.http.post(url, this.obj2).subscribe(
            (success) => {
                swal.fire('Success', success.message, 'success');
                this.isEditable = false;
                this.myStepper.reset();
                this.isEditForm = false;
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

    save(url) {
        this.http.post(url, this.obj).subscribe(
            (success) => {
                swal.fire('Success', success.message, 'success');
                this.isEditable = false;
                this.myStepper.reset();
                this.hideForm();
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

    onConfirm() {
        this.obj.TaskStatus = this.taskstatus.find(
            (item) => this.obj.TaskStatusID === item.id
        ).TaskStatus;
    }

    onConfirmEdit() {
        console.log('TaskComponent -> onConfirm -> this.obj', this.obj);
        this.obj2.CustomerID = this.project.find(
            (item) => this.obj2.ProjectID === item.id
        ).ProjectDescription;


        this.obj2.TaskPriority = this.taskpriority.find(
            (item) => item.id === this.obj2.PriorityID
        ).TaskPriority;

        this.obj2.TaskStatus = this.taskstatus.find(
            (item) => item.id === this.obj2.TaskStatusID
        ).TaskStatus;

        // console.log(this.obj.TaskStatus)

        this.obj2.SurName = this.employee.find(
            (item) => this.obj2.AssignTo === item.id
        ).FullName;

        this.obj2.TaskNote = this.tasknote.find(
            (item) => this.obj2.TaskNoteID === item.id
        ).TaskNote;

        this.obj2.TaskStatus = this.taskstatus.find(
            (item) => this.obj.TaskStatusID === item.id
        ).TaskStatus;
    }

    loadItem(id) {
        console.log('TasknoteComponent -> loadItem -> id', id);

        this.obj.TaskID = id.row.data.TaskID;
        this.obj.Task = id.row.data.Task;
        // this.obj = this.data.find((item) => item.id == id.row.data.id);
        // this.operation = 'Update';
        this.showForm();
        this.isEditForm = false;
    }

    editItem(id) {
        this.obj2 = this.data.find((item) => item.id === id.row.data.id);
        this.obj2.DueDate = this.obj2.DueDate.replace(' ', 'T');
        this.operation = 'Update';
        this.showEditForm();
        this.hideForm();
    }

    resetForm() {
        this.obj = {
            TaskNote: null,
            TaskID: null,
            Task: null,
            TaskStatusID: null,
            TaskStatus: null,
        };
        this.hideForm();
        this.operation = 'Add';
    }
}
