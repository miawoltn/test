import { Component, OnInit, ViewChild } from '@angular/core';
import { HttpService } from 'src/app/services/http.service';
import { vendorUrl } from '../vendor-url';
import swal from 'sweetalert2';
@Component({
    selector: 'app-vendor',
    templateUrl: './vendor.component.html',
    styleUrls: ['./vendor.component.scss'],
})
export class VendorComponent implements OnInit {
    displayedColumns: string[] = [
        'VendorName',
        'VendorCategory',
        'VendorPhysicalAddress',
        'VendorEmail',
        'VendorPhoneNum',
        'TIN',
        'ContactPerson',
        'ContactEmail',
        'ContactPhone',
        'StatusID',
    ];
    data = [];
    obj = {
        VendorName: null,
        VendorCategoryID: null,
        VendorPhysicalAddress: null,
        VendorEmail: null,
        VendorPhoneNum: null,
        TIN: null,
        ContactPerson: null,
        ContactEmail: null,
        ContactPhone: null,
        StatusID: null,
    };
    displayForm = false;
    operation = 'Add';
    title = 'Vendor';
    parent = 'Vendor';
    vendorcategory = [];
    constructor(protected http: HttpService) {
        this.loadItem = this.loadItem.bind(this);
    }

    ngOnInit() {
        this.http.get(vendorUrl.vendor.list).subscribe(
            (res) => {
                this.data = res.data;
            },
            (err) => {
                console.log(err);
            }
        );
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
        let url = vendorUrl.vendor.add;
        if (this.operation == 'Update') url = vendorUrl.vendor.update;
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
            VendorName: null,
            VendorCategoryID: null,
            VendorPhysicalAddress: null,
            VendorEmail: null,
            VendorPhoneNum: null,
            TIN: null,
            ContactPerson: null,
            ContactEmail: null,
            ContactPhone: null,
            StatusID: null,
        };
        this.hideForm();
        this.operation = 'Add';
    }
}
