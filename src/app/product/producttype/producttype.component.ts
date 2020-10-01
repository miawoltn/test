import { Component, OnInit, ViewChild } from '@angular/core';
import { HttpService } from 'src/app/services/http.service';
import { productUrl } from '../product-url';
import swal from 'sweetalert2';
@Component({
    selector: 'app-producttype',
    templateUrl: './producttype.component.html',
    styleUrls: ['./producttype.component.scss'],
})
export class ProducttypeComponent implements OnInit {
    displayedColumns: string[] = ['ProductType'];
    data = [];
    obj = { ProductType: null };
    displayForm = false;
    operation = 'Add';
    title = 'Product Type';
    parent = 'Product';

    constructor(protected http: HttpService) {
        this.loadItem = this.loadItem.bind(this);
    }

    ngOnInit() {
        this.http.get(productUrl.producttype.list).subscribe(
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
        let url = productUrl.producttype.add;
        if (this.operation == 'Update') url = productUrl.producttype.update;
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
        this.obj = { ProductType: null };
        this.hideForm();
        this.operation = 'Add';
    }
}
