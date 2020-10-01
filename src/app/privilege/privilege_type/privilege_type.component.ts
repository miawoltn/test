import { Component, OnInit, ViewChild } from '@angular/core';
import { HttpService } from 'src/app/services/http.service';
import { privilegeUrl } from '../privilege-url';
import swal from 'sweetalert2';
@Component({
    selector: 'app-privilege_type',
    templateUrl: './privilege_type.component.html',
    styleUrls: ['./privilege_type.component.scss'],
})
export class Privilege_typeComponent implements OnInit {
    displayedColumns: string[] = ['PrivilegeType'];
    data = [];
    obj = { PrivilegeType: null };
    displayForm = false;
    operation = 'Add';
    title = 'Privilege_type';
    parent = 'privilege';

    constructor(protected http: HttpService) {
        this.loadItem = this.loadItem.bind(this);
    }

    ngOnInit() {
        this.http.get(privilegeUrl.privilege_type.list).subscribe(
            (res) => {
                this.data = res.data;
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
        let url = privilegeUrl.privilege_type.add;
        if (this.operation == 'Update')
            url = privilegeUrl.privilege_type.update;
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
        this.obj = { PrivilegeType: null };
        this.hideForm();
        this.operation = 'Add';
    }
}
