import { Component, OnInit, ViewChild } from '@angular/core';
import { HttpService } from 'src/app/services/http.service';
import { vendorUrl } from '../vendor-url';
import swal from 'sweetalert2';
@Component({
    selector: 'app-vendortype',
    templateUrl: './vendortype.component.html',
    styleUrls: ['./vendortype.component.scss'],
})
export class VendortypeComponent implements OnInit {
    displayedColumns: string[] = ['VendorType'];
    data = [];
    obj = { VendorType: null };
    displayForm = false;
    operation = 'Add';
    title = 'Vendor Type';
    parent = 'Vendor';

    constructor(protected http: HttpService) {
        this.loadItem = this.loadItem.bind(this);
    }

    ngOnInit() {
        this.http.get(vendorUrl.vendortype.list).subscribe(
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
        let url = vendorUrl.vendortype.add;
        if (this.operation == 'Update') url = vendorUrl.vendortype.update;
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
        this.obj = { VendorType: null };
        this.hideForm();
        this.operation = 'Add';
    }
}
