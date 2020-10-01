import { Component, OnInit, ViewChild } from '@angular/core';
import { HttpService } from 'src/app/services/http.service';
import { projectUrl } from '../project-url';
import swal from 'sweetalert2';
@Component({
    selector: 'app-projecttask',
    templateUrl: './projecttask.component.html',
    styleUrls: ['./projecttask.component.scss'],
})
export class ProjecttaskComponent implements OnInit {
    displayedColumns: string[] = ['ProjectID', 'Task', 'StartDate', 'EndDate'];
    data = [];
    obj = {
        ProjectMilestoneID: null,
        Task: null,
        StartDate: null,
        EndDate: null,
    };
    displayForm = false;
    operation = 'Add';
    title = 'Project Task';
    parent = 'Project';
    projectmilestone = [];
    constructor(protected http: HttpService) {
        this.loadItem = this.loadItem.bind(this);
    }

    ngOnInit() {
        this.http.get(projectUrl.projecttask.list).subscribe(
            (res) => {
                this.data = res.data;
            },
            (err) => {
                console.log(err);
            }
        );
        this.http.get(projectUrl.projectmilestone.list).subscribe(
            (res) => {
                this.projectmilestone = res.data;
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
        let url = projectUrl.projecttask.add;
        if (this.operation == 'Update') url = projectUrl.projecttask.update;
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
        this.obj = this.data.find((item) => item.id === id.row.data.id);
        this.operation = 'Update';
        this.showForm();
    }

    resetForm() {
        this.obj = {
            ProjectMilestoneID: null,
            Task: null,
            StartDate: null,
            EndDate: null,
        };
        this.hideForm();
        this.operation = 'Add';
    }
}
