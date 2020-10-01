import { Component, OnInit, ViewChild } from '@angular/core';
import { HttpService } from 'src/app/services/http.service';
import { projectUrl } from '../project-url';
import swal from 'sweetalert2';
@Component({
    selector: 'app-projectmilestone',
    templateUrl: './projectmilestone.component.html',
    styleUrls: ['./projectmilestone.component.scss'],
})
export class ProjectmilestoneComponent implements OnInit {
    displayedColumns: string[] = [
        'CustomerID',
        'Milestone',
        'StartDate',
        'EndDate',
    ];
    data = [];
    obj = { ProjectID: null, Milestone: null, StartDate: null, EndDate: null };
    displayForm = false;
    operation = 'Add';
    title = 'Project Milestone';
    parent = 'Project';
    project = [];
    constructor(protected http: HttpService) {
        this.loadItem = this.loadItem.bind(this);
    }

    ngOnInit() {
        this.http.get(projectUrl.projectmilestone.list).subscribe(
            (res) => {
                this.data = res.data;
            },
            (err) => {
                console.log(err);
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
        let url = projectUrl.projectmilestone.add;
        if (this.operation == 'Update')
            url = projectUrl.projectmilestone.update;
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
            ProjectID: null,
            Milestone: null,
            StartDate: null,
            EndDate: null,
        };
        this.hideForm();
        this.operation = 'Add';
    }
}
