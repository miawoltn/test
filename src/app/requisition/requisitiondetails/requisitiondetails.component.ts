import { Component, OnInit, ViewChild } from '@angular/core';
import { HttpService } from 'src/app/services/http.service';
import { requisitionUrl } from '../requisition-url';
import { itemUrl } from 'src/app/item/item-url';
import swal from 'sweetalert2';
@Component({
    selector: 'app-requisitiondetails',
    templateUrl: './requisitiondetails.component.html',
    styleUrls: ['./requisitiondetails.component.scss'],
})
export class RequisitiondetailsComponent implements OnInit {
    displayedColumns: string[] = [
        'ItemCategoryID',
        'ItemCategoryID',
        'Description',
        'Price',
        'Quantity',
    ];
    data = [];
    obj = {
        ItemID: null,
        RequisitionID: null,
        Description: null,
        Price: null,
        Quantity: null,
    };
    displayForm = false;
    operation = 'Add';
    title = 'Requisition Details';
    parent = 'Requisition';
    items = [];
    requisition = [];
    constructor(protected http: HttpService) {
        this.loadItem = this.loadItem.bind(this);
    }

    ngOnInit() {
        this.http.get(requisitionUrl.requisitiondetails.list).subscribe(
            (res) => {
                this.data = res.data;
            },
            (err) => {
                console.log(err);
            }
        );
        this.http.get(itemUrl.items.list).subscribe(
            (res) => {
                this.items = res.data;
            },
            (error) => {
                console.log(error);
            }
        );
        this.http.get(requisitionUrl.requisition.list).subscribe(
            (res) => {
                this.requisition = res.data;
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
        let url = requisitionUrl.requisitiondetails.add;
        if (this.operation == 'Update')
            url = requisitionUrl.requisitiondetails.update;
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
            ItemID: null,
            RequisitionID: null,
            Description: null,
            Price: null,
            Quantity: null,
        };
        this.hideForm();
        this.operation = 'Add';
    }
}
