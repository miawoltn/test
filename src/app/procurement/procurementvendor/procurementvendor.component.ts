import { Component, OnInit, ViewChild } from '@angular/core';
import { HttpService } from 'src/app/services/http.service';
import { procurementUrl } from '../procurement-url';
import { vendorUrl } from 'src/app/vendor/vendor-url';
import swal from 'sweetalert2';
@Component({
    selector: 'app-procurementvendor',
    templateUrl: './procurementvendor.component.html',
    styleUrls: ['./procurementvendor.component.scss'],
})
export class ProcurementvendorComponent implements OnInit {
    displayedColumns: string[] = ['ProcurementDate', 'VendorCategoryID'];
    data = [];
    obj = { ProcurementID: null, VendorID: null };
    displayForm = false;
    operation = 'Add';
    title = 'Procurementvendor';
    parent = 'procurement';
    procurement = [];
    vendors = [];
    constructor(protected http: HttpService) {
        this.loadItem = this.loadItem.bind(this);
    }

    ngOnInit() {
        this.http.get(procurementUrl.procurementvendor.list).subscribe(
            (res) => {
                this.data = res.data;
            },
            (err) => {
                console.log(err);
            }
        );
        this.http.get(procurementUrl.procurement.list).subscribe(
            (res) => {
                this.procurement = res.data;
            },
            (error) => {
                console.log(error);
            }
        );
        this.http.get(vendorUrl.vendors.list).subscribe(
            (res) => {
                this.vendors = res.data;
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
        let url = procurementUrl.procurementvendor.add;
        if (this.operation == 'Update')
            url = procurementUrl.procurementvendor.update;
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
        this.obj = { ProcurementID: null, VendorID: null };
        this.hideForm();
        this.operation = 'Add';
    }
}
