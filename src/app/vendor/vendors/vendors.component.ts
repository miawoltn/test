import { Component, OnInit, ViewChild } from '@angular/core';
import { HttpService } from 'src/app/services/http.service';
import { vendorUrl } from '../vendor-url';
import swal from 'sweetalert2';
@Component({
    selector: 'app-vendors',
    templateUrl: './vendors.component.html',
    styleUrls: ['./vendors.component.scss'],
})
export class VendorsComponent implements OnInit {
    displayedColumns: string[] = [
        'VendorCategory',
        'VendorName',
        'Address',
        'TIN',
        'AccountNumber',
        'Bank',
    ];
    data = [];
    obj = {
        VendorCategoryID: null,
        VendorName: null,
        Address: null,
        TIN: null,
        AccountNumber: null,
        Bank: null,
        StatusID: null,
    };
    displayForm = false;
    operation = 'Add';
    title = 'Vendors';
    parent = 'vendor';
    status = [];
    vendorcategory = [];
    constructor(protected http: HttpService) {
        this.loadItem = this.loadItem.bind(this);
    }

    ngOnInit() {
        this.http.get(vendorUrl.vendors.list).subscribe(
            (res) => {
                this.data = res.data;
            },
            (err) => {
                console.log(err);
            }
        );
        // this.http.get(Url.status.list)
        //   .subscribe(res => {
        //     this.status = res.data;
        //   }, error => { console.log(error) });
        this.http.get(vendorUrl.vendorcategory.list).subscribe(
            (res) => {
                this.vendorcategory = res.data;
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
        let url = vendorUrl.vendors.add;
        if (this.operation == 'Update') url = vendorUrl.vendors.update;
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
            VendorCategoryID: null,
            VendorName: null,
            Address: null,
            TIN: null,
            AccountNumber: null,
            Bank: null,
            StatusID: null,
        };
        this.hideForm();
        this.operation = 'Add';
    }
}
