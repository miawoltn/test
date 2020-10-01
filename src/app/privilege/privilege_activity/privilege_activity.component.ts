import { approvalUrl } from 'src/app/approval/approval-url';
import { Component, OnInit, ViewChild } from '@angular/core';
import { HttpService } from 'src/app/services/http.service';
import { privilegeUrl } from '../privilege-url';
import swal from 'sweetalert2';
@Component({
    selector: 'app-privilege_activity',
    templateUrl: './privilege_activity.component.html',
    styleUrls: ['./privilege_activity.component.scss'],
})
export class Privilege_activityComponent implements OnInit {
    displayedColumns: string[] = [
        'Activity_Name',
        'pagepath',
        'order_by',
        'stage_id',
    ];
    data = [];
    obj = {
        Activity_Name: null,
        pagepath: null,
        order_by: null,
        stage_id: null,
    };
    displayForm = false;
    operation = 'Add';
    title = 'Privilege_activity';
    parent = 'privilege';
    ApprovalStages: any;

    constructor(protected http: HttpService) {
        this.loadItem = this.loadItem.bind(this);
    }

    ngOnInit() {
        this.http.get(privilegeUrl.privilege_activity.list).subscribe(
            (res) => {
                this.data = res.data;
            },
            (err) => {
                console.log(err);
            }
        );

        this.http.get(approvalUrl.approvalstages.list).subscribe(
            (res) => {
                this.ApprovalStages = res.data;
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
        let url = privilegeUrl.privilege_activity.add;
        if (this.operation == 'Update')
            url = privilegeUrl.privilege_activity.update;
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
            Activity_Name: null,
            pagepath: null,
            order_by: null,
            stage_id: null,
        };
        this.hideForm();
        this.operation = 'Add';
    }
}
