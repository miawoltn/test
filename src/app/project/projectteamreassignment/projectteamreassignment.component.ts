import { Component, OnInit, ViewChild } from '@angular/core';
import { HttpService } from 'src/app/services/http.service';
import { projectUrl } from '../project-url';
import swal from 'sweetalert2';
import { employeeUrl } from 'src/app/employee/employee-url';
@Component({
    selector: 'app-projectteamreassignment',
    templateUrl: './projectteamreassignment.component.html',
    styleUrls: ['./projectteamreassignment.component.scss'],
})
export class ProjectteamreassignmentComponent implements OnInit {
    displayedColumns: string[] = [
        'DateofTransfer',
        'ProjectFrom',
        'ProjectTo',
        'SurName',
        'ReassigningOfficer',
    ];
    data = [];
    obj = {
        DateofTransfer: null,
        ProjectFrom: null,
        ProjectTo: null,
        EmployeeID: null,
        ReassigningOfficer: null,
    };
    displayForm = false;
    operation = 'Add';
    title = 'Projectteamreassignment';
    parent = 'project';
    employee = [];
    constructor(protected http: HttpService) {
        this.loadItem = this.loadItem.bind(this);
    }

    ngOnInit() {
        this.http.get(projectUrl.projectteamreassignment.list).subscribe(
            (res) => {
                this.data = res.data;
            },
            (err) => {
                console.log(err);
            }
        );
        this.http.get(employeeUrl.employee.list).subscribe(
            (res) => {
                this.employee = res.data;
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
        let url = projectUrl.projectteamreassignment.add;
        if (this.operation == 'Update')
            url = projectUrl.projectteamreassignment.update;
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
        this.obj = {
            DateofTransfer: null,
            ProjectFrom: null,
            ProjectTo: null,
            EmployeeID: null,
            ReassigningOfficer: null,
        };
        this.hideForm();
        this.operation = 'Add';
    }
}
