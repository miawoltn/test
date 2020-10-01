import { Component, OnInit, ViewChild } from '@angular/core';
import { HttpService } from 'src/app/services/http.service';
import { requisitionUrl } from '../requisition-url';
import { itemUrl } from 'src/app/item/item-url';
import { storeUrl } from 'src/app/store/store-url';
import swal from 'sweetalert2';
@Component({
    selector: 'app-requisition',
    templateUrl: './requisition.component.html',
    styleUrls: ['./requisition.component.scss'],
})
export class RequisitionComponent implements OnInit {
    displayedColumns: string[] = [
        'ItemCategory',
        'StoreName',
        'RequestDate',
        'RequestBy',
    ];
    data = [];
    obj = {
        ItemCategoryID: null,
        StoreID: null,
        RequestDate: null,
        RequestBy: null,
    };
    displayForm = false;
    operation = 'Add';
    title = 'Requisition';
    parent = 'requisition';
    itemcategory = [];
    stores = [];
    constructor(protected http: HttpService) {
        this.loadItem = this.loadItem.bind(this);
    }

    ngOnInit() {
        this.http.get(requisitionUrl.requisition.list).subscribe(
            (res) => {
                this.data = res.data;
            },
            (err) => {
                console.log(err);
            }
        );
        this.http.get(itemUrl.itemcategory.list).subscribe(
            (res) => {
                this.itemcategory = res.data;
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
        let url = requisitionUrl.requisition.add;
        if (this.operation == 'Update') url = requisitionUrl.requisition.update;
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
            ItemCategoryID: null,
            StoreID: null,
            RequestDate: null,
            RequestBy: null,
        };
        this.hideForm();
        this.operation = 'Add';
    }
}
