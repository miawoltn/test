import { projectUrl } from './../../project/project-url';

import { Component, OnInit, ViewChild } from '@angular/core';
import { HttpService } from 'src/app/services/http.service';
import { taskUrl } from '../task-url';
import swal from 'sweetalert2';
@Component({
    selector: 'app-taskdelegation',
    templateUrl: './taskdelegation.component.html',
    styleUrls: ['./taskdelegation.component.scss'],
})
export class TaskdelegationComponent implements OnInit {
    displayedColumns: string[] = ['CustomerID', 'ProjectID', 'TaskStatus'];
    data = [];
    obj = { ProjectID: null, ProjectTeamID: null, TaskStatusID: null };
    displayForm = false;
    operation = 'Add';
    title = 'Task Delegation';
    parent = 'Task';
    project = [];
    projectteam = [];
    taskstatus = [];
    constructor(protected http: HttpService) {
        this.loadItem = this.loadItem.bind(this);
    }

    ngOnInit() {
        this.http.get(taskUrl.taskdelegation.list).subscribe(
            (res) => {
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
        this.http.get(projectUrl.project.list).subscribe(
            (res) => {
                this.project = res.data;
            },
            (error) => {
                console.log(error);
            }
        );
        this.http.get(projectUrl.projectteam.list).subscribe(
            (res) => {
                this.projectteam = res.data;
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

    addItem() {
        this.resetForm();
        this.showForm();
    }

    processForm() {
        let url = taskUrl.taskdelegation.add;
        if (this.operation == 'Update') url = taskUrl.taskdelegation.update;
        this.save(url);
    }

    save(url) {
        this.http.post(url, this.obj).subscribe(
            (res) => {
                this.data = res.data;
                swal.fire('Process Complete', res.message, 'success');
                this.resetForm();
            },
            (err) => {
                console.log(err);
                swal.fire('Process Unsuccessful', err.error.message, 'error');
            }
        );
    }

    loadItem(id) {
        this.obj = this.data.find((item) => item.id == id.row.data.id);
        this.operation = 'Update';
        this.showForm();
    }

    resetForm() {
        this.obj = { ProjectID: null, ProjectTeamID: null, TaskStatusID: null };
        this.hideForm();
        this.operation = 'Add';
    }
}
