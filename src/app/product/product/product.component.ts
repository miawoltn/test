import { Component, OnInit, ViewChild } from '@angular/core';
import { HttpService } from 'src/app/services/http.service';
import { productUrl } from '../product-url';
import swal from 'sweetalert2';
@Component({
    selector: 'app-product',
    templateUrl: './product.component.html',
    styleUrls: ['./product.component.scss'],
})
export class ProductComponent implements OnInit {
    displayedColumns: string[] = [
        'ProductName',
        'ProductCategory',
        'ProductType',
        'ProductStatusID',
    ];
    data = [];
    obj = {
        ProductName: null,
        ProductCategoryID: null,
        ProductTypeID: null,
        ProductStatusID: null,
    };
    displayForm = false;
    operation = 'Add';
    title = 'Product';
    parent = 'product';
    productcategory = [];
    producttype = [];
    constructor(protected http: HttpService) {
        this.loadItem = this.loadItem.bind(this);
    }

    ngOnInit() {
        this.http.get(productUrl.product.list).subscribe(
            (res) => {
                this.data = res.data;
            },
            (err) => {
                console.log(err);
            }
        );
        this.http.get(productUrl.productcategory.list).subscribe(
            (res) => {
                this.productcategory = res.data;
            },
            (error) => {
                console.log(error);
            }
        );
        this.http.get(productUrl.producttype.list).subscribe(
            (res) => {
                this.producttype = res.data;
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
        let url = productUrl.product.add;
        if (this.operation == 'Update') url = productUrl.product.update;
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
            ProductName: null,
            ProductCategoryID: null,
            ProductTypeID: null,
            ProductStatusID: null,
        };
        this.hideForm();
        this.operation = 'Add';
    }
}
