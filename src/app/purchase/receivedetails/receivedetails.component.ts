import { Component, OnInit, ViewChild } from '@angular/core';
import { HttpService } from 'src/app/services/http.service';
import { purchaseUrl } from '../purchase-url';
import { itemUrl } from 'src/app/item/item-url';
import swal from 'sweetalert2';
@Component({
    selector: 'app-receivedetails',
    templateUrl: './receivedetails.component.html',
    styleUrls: ['./receivedetails.component.scss'],
})
export class ReceivedetailsComponent implements OnInit {
    displayedColumns: string[] = [
        'Price',
        'Description',
        'Quantity',
        'ItemCategoryID',
        'StoreID',
    ];
    data = [];
    obj = {
        Price: null,
        Description: null,
        Quantity: null,
        ItemID: null,
        ReceiveOrderID: null,
    };
    displayForm = false;
    operation = 'Add';
    title = 'Receive Details';
    parent = 'Purchase';
    items = [];
    receiveorders = [];
    constructor(protected http: HttpService) {
        this.loadItem = this.loadItem.bind(this);
    }

    ngOnInit() {
        this.http.get(purchaseUrl.receivedetails.list).subscribe(
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
        this.http.get(purchaseUrl.receiveorders.list).subscribe(
            (res) => {
                this.receiveorders = res.data;
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
        let url = purchaseUrl.receivedetails.add;
        if (this.operation == 'Update') url = purchaseUrl.receivedetails.update;
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
            Price: null,
            Description: null,
            Quantity: null,
            ItemID: null,
            ReceiveOrderID: null,
        };
        this.hideForm();
        this.operation = 'Add';
    }
}
