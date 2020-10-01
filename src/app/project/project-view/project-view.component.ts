import { Component, OnInit, ViewChild } from '@angular/core';
import { HttpService } from 'src/app/services/http.service';
import { projectUrl } from '../project-url';
import { customerUrl } from 'src/app/customer/customer-url';
import swal from 'sweetalert2';
import { Router } from '@angular/router';
import { MatStepper } from '@angular/material/stepper';
@Component({
    selector: 'app-project-view',
    templateUrl: './project-view.component.html',
    styleUrls: ['./project-view.component.scss'],
})
export class ProjectViewComponent implements OnInit {
    @ViewChild('stepper', { static: false }) private myStepper: MatStepper;

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
        CustomerTypeID: null,
        ProjectStatus: null,
        ProjectType: null,
    };
    displayForm = false;
    operation = 'Add';
    title = 'Project';
    parent = 'Project';
    customer = [];
    projectstatus = [];
    projectsubtype = [];
    projecttype = [];
    showList = true;

    isEditable = true;
    isLinear = true;
    subtotal = 0;

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

    onConfirm() {
        this.obj.CustomerTypeID = this.customer.find(
            (item) => this.obj.CustomerID == item.id
        ).CustomerType;
        this.obj.ProjectStatus = this.projectstatus.find(
            (item) => this.obj.ProjectStatusID == item.id
        ).ProjectStatus;
        this.obj.ProjectType = this.projecttype.find(
            (item) => this.obj.ProjectTypeID == item.id
        ).ProjectType;
        this.obj.ProjectType = this.projectsubtype.find(
            (item) => this.obj.ProjectSubTypeID == item.id
        ).ProjectSubType;
    }

    processForm() {
        // let url = projectUrl.project.add;
        let url = projectUrl.project.update;
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
        console.log(this.obj.ProjectAwardDate);
        this.obj.ProjectAwardDate = this.obj.ProjectAwardDate.replace(' ', 'T')
        console.log(this.obj.ProjectAwardDate);
        this.obj.ProjectStartDate = this.obj.ProjectStartDate.replace(' ', 'T')
        this.operation = 'Update';
        this.showForm();
        this.showList = false;
    }

    overview(id) {
        const projectId = id.row.data.id;
        this.router.navigate(['project/project-overview', projectId]);
    }

    resetEditForm() {
        this.showList = true;
        this.hideForm();
        this.myStepper.reset()
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
            CustomerTypeID: null,
            ProjectStatus: null,
            ProjectType: null,
        };
        this.hideForm();
        this.operation = 'Add';
        this.showList = true;
    }
}
