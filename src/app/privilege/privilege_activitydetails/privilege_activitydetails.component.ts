import { Component, OnInit, ViewChild } from '@angular/core';
import { HttpService } from 'src/app/services/http.service';
import { privilegeUrl } from '../privilege-url';
import swal from 'sweetalert2';
@Component({
    selector: 'app-privilege_activitydetails',
    templateUrl: './privilege_activitydetails.component.html',
    styleUrls: ['./privilege_activitydetails.component.scss'],
})
export class Privilege_activitydetailsComponent implements OnInit {
    displayedColumns: string[] = [
        'PrivilegeID',
        'ActivityPrivID',
        'canInsert',
        'canView',
        'canDelete',
        'canUpdate',
    ];
    data = [];
    obj = {
        PrivilegeID: null,
        ActivityPrivID: null,
        canInsert: null,
        canView: null,
        canDelete: null,
        canUpdate: null,
    };
    displayForm = false;
    operation = 'Add';
    title = 'Privilege_activitydetails';
    parent = 'privilege';
    Privileges: any;
    PrivilegeActivity: any;

    choices = [{ value: 1, label: 'Yes' }, { value: 2, label: 'No' }]

    constructor(protected http: HttpService) {
        this.loadItem = this.loadItem.bind(this);
    }

    ngOnInit() {
        this.http.get(privilegeUrl.privilege_activitydetails.list).subscribe(
            (res) => {
                this.data = res.data;
            },
            (err) => {
                console.log(err);
            }
        );

        this.http.get(privilegeUrl.privileges.list).subscribe(
            (res) => {
                this.Privileges = res.data;
            },
            (err) => {
                console.log(err);
            }
        );

        this.http.get(privilegeUrl.privilege_activity.list).subscribe(
            (res) => {
                this.PrivilegeActivity = res.data;
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
        let url = privilegeUrl.privilege_activitydetails.add;
        if (this.operation == 'Update')
            url = privilegeUrl.privilege_activitydetails.update;
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
            PrivilegeID: null,
            ActivityPrivID: null,
            canInsert: null,
            canView: null,
            canDelete: null,
            canUpdate: null,
        };
        this.hideForm();
        this.operation = 'Add';
    }
}
