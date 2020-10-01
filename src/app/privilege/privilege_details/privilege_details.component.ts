import { privilegeUrl } from './../privilege-url';
import { employeeUrl } from 'src/app/employee/employee-url';
import { Component, OnInit, ViewChild } from '@angular/core';
import { HttpService } from 'src/app/services/http.service';
import swal from 'sweetalert2';
@Component({
    selector: 'app-privilege_details',
    templateUrl: './privilege_details.component.html',
    styleUrls: ['./privilege_details.component.scss'],
})
export class Privilege_detailsComponent implements OnInit {
    displayedColumns: string[] = ['employee_id', 'statusID', 'PrivHeaderID'];
    data = [];
    obj = { employee_id: null, statusID: null, PrivHeaderID: null };
    displayForm = false;
    operation = 'Add';
    title = 'Privilege_details';
    parent = 'privilege';
    Employees: any;
    PrivHeader: any;

    constructor(protected http: HttpService) {
        this.loadItem = this.loadItem.bind(this);
    }

    ngOnInit() {
        this.http.get(privilegeUrl.privilege_details.list).subscribe(
            (res) => {
                this.data = res.data;
            },
            (err) => {
                console.log(err);
            }
        );

        this.http.get(employeeUrl.employee.list).subscribe(
            (res) => {
                this.Employees = res.data;
            },
            (err) => {
                console.log(err);
            }
        );

        this.http.get(privilegeUrl.privilege_header.list).subscribe(
            (res) => {
                this.PrivHeader = res.data;
            },
            (err) => {
                console.log(err);
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
        let url = privilegeUrl.privilege_details.add;
        if (this.operation == 'Update')
            url = privilegeUrl.privilege_details.update;
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
        this.obj = { employee_id: null, statusID: null, PrivHeaderID: null };
        this.hideForm();
        this.operation = 'Add';
    }
}
