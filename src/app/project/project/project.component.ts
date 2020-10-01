import { Component, OnInit, ViewChild } from '@angular/core';
import { HttpService } from 'src/app/services/http.service';
import { projectUrl } from '../project-url';
import { customerUrl } from 'src/app/customer/customer-url';
import swal from 'sweetalert2';
import { Router } from '@angular/router';
@Component({
    selector: 'app-project',
    templateUrl: './project.component.html',
    styleUrls: ['./project.component.scss'],
})
export class ProjectComponent implements OnInit {
    displayedColumns: string[] = [
        'CustomerTypeID',
        'ProjectType',
        'ProjectTypeID',
        'ProjectStatus',
        'ProjectDescription',
        'ProjectLocation',
        'ProjectApprovedBudget',
        'ProjectDuration',
        'ProjectAwardDate',
        'ProjectStartDate',
    ];
    data = [];
    obj = {
        CustomerID: null,
        ProjectTypeID: null,
        ProjectSubTypeID: null,
        ProjectStatusID: null,
        ProjectDescription: null,
        ProjectLocation: null,
        ProjectApprovedBudget: null,
        ProjectDuration: null,
        ProjectAwardDate: null,
        ProjectStartDate: null,
    };
    displayForm = false;
    operation = 'Add';
    title = 'Project';
    parent = 'Project';
    customer = [];
    projectstatus = [];
    projectsubtype = [];
    projecttype = [];
    constructor(protected http: HttpService, private router: Router) {
        this.loadItem = this.loadItem.bind(this);
        this.overview = this.overview.bind(this);
    }

    ngOnInit() {
        this.http.get(projectUrl.project.list).subscribe(
            (res) => {
                this.data = res.data;
            },
            (err) => {
                console.log(err);
            }
        );
        this.http.get(customerUrl.customer.list).subscribe(
            (res) => {
                this.customer = res.data;
            },
            (error) => {
                console.log(error);
            }
        );
        this.http.get(projectUrl.projectstatus.list).subscribe(
            (res) => {
                this.projectstatus = res.data;
            },
            (error) => {
                console.log(error);
            }
        );
        this.http.get(projectUrl.projectsubtype.list).subscribe(
            (res) => {
                this.projectsubtype = res.data;
            },
            (error) => {
                console.log(error);
            }
        );
        this.http.get(projectUrl.projecttype.list).subscribe(
            (res) => {
                this.projecttype = res.data;
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
        let url = projectUrl.project.add;
        if (this.operation == 'Update') url = projectUrl.project.update;
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

    overview(id) {
        const projectId = id.row.data.id;
        this.router.navigate(['project/project-overview', projectId]);
    }

    resetForm() {
        this.obj = {
            CustomerID: null,
            ProjectTypeID: null,
            ProjectSubTypeID: null,
            ProjectStatusID: null,
            ProjectDescription: null,
            ProjectLocation: null,
            ProjectApprovedBudget: null,
            ProjectDuration: null,
            ProjectAwardDate: null,
            ProjectStartDate: null,
        };
        this.hideForm();
        this.operation = 'Add';
    }
}
