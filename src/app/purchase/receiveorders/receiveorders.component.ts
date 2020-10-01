import { Component, OnInit, ViewChild } from '@angular/core';
import { HttpService } from 'src/app/services/http.service';
import { purchaseUrl } from '../purchase-url';
import { storeUrl } from 'src/app/store/store-url';
import swal from 'sweetalert2';
import { approvalUrl } from 'src/app/approval/approval-url';
@Component({
    selector: 'app-receiveorders',
    templateUrl: './receiveorders.component.html',
    styleUrls: ['./receiveorders.component.scss'],
})
export class ReceiveordersComponent implements OnInit {
    displayedColumns: string[] = [
        'StoreName',
        'ReceiveDate',
        'ApprovalStages',
        'ProcurementID',
        'ApprovalOfficerID',
    ];
    data = [];
    obj = {
        StoreID: null,
        ReceiveDate: null,
        ApprovalStagesID: null,
        PurchaseID: null,
        ApprovalOfficerID: null,
    };
    displayForm = false;
    operation = 'Add';
    title = 'Receive Orders';
    parent = 'Purchase';
    approvalstages = [];
    purchase = [];
    stores = [];
    constructor(protected http: HttpService) {
        this.loadItem = this.loadItem.bind(this);
    }

    ngOnInit() {
        this.http.get(purchaseUrl.receiveorders.list).subscribe(
            (res) => {
                this.data = res.data;
            },
            (err) => {
                console.log(err);
            }
        );
        this.http.get(purchaseUrl.purchase.list).subscribe(
            (res) => {
                this.purchase = res.data;
            },
            (error) => {
                console.log(error);
            }
        );
        this.http.get(storeUrl.stores.list).subscribe(
            (res) => {
                this.stores = res.data;
            },
            (error) => {
                console.log(error);
            }
        );
        this.http.get(approvalUrl.approvalstages.list).subscribe(
            (res) => {
                this.approvalstages = res.data;
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
        let url = purchaseUrl.receiveorders.add;
        if (this.operation == 'Update') url = purchaseUrl.receiveorders.update;
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
            StoreID: null,
            ReceiveDate: null,
            ApprovalStagesID: null,
            PurchaseID: null,
            ApprovalOfficerID: null,
        };
        this.hideForm();
        this.operation = 'Add';
    }
}
