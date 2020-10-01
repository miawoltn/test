import { Component, OnInit, ViewChild } from '@angular/core';
import { HttpService } from 'src/app/services/http.service';
import { vendorUrl } from '../vendor-url';
import swal from 'sweetalert2';
@Component({
    selector: 'app-vendorcategory',
    templateUrl: './vendorcategory.component.html',
    styleUrls: ['./vendorcategory.component.scss'],
})
export class VendorcategoryComponent implements OnInit {
    displayedColumns: string[] = ['VendorCategory'];
    data = [];
    obj = { VendorCategory: null };
    displayForm = false;
    operation = 'Add';
    title = 'Vendor Category';
    parent = 'Vendor';

    constructor(protected http: HttpService) {
        this.loadItem = this.loadItem.bind(this);
    }

    ngOnInit() {
        this.http.get(vendorUrl.vendorcategory.list).subscribe(
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
        let url = vendorUrl.vendorcategory.add;
        if (this.operation == 'Update') url = vendorUrl.vendorcategory.update;
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
        this.obj = { VendorCategory: null };
        this.hideForm();
        this.operation = 'Add';
    }
}
