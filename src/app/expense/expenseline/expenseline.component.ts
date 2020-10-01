import { Component, OnInit, ViewChild } from '@angular/core';
import { HttpService } from 'src/app/services/http.service';
import { expenseUrl } from '../expense-url';
import swal from 'sweetalert2';
@Component({
    selector: 'app-expenseline',
    templateUrl: './expenseline.component.html',
    styleUrls: ['./expenseline.component.scss'],
})
export class ExpenselineComponent implements OnInit {
    displayedColumns: string[] = ['Expense', 'ExpenseLine'];
    data = [];
    obj = { ExpenseCategoryID: null, ExpenseLine: null };
    displayForm = false;
    operation = 'Add';
    title = 'Expenseline';
    parent = 'expense';
    expensecategory = [];
    constructor(protected http: HttpService) {
        this.loadItem = this.loadItem.bind(this);
    }

    ngOnInit() {
        this.http.get(expenseUrl.expenseline.list).subscribe(
            (res) => {
                this.data = res.data;
            },
            (err) => {
                console.log(err);
            }
        );
        this.http.get(expenseUrl.expensecategory.list).subscribe(
            (res) => {
                this.expensecategory = res.data;
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
        let url = expenseUrl.expenseline.add;
        if (this.operation == 'Update') url = expenseUrl.expenseline.update;
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
        this.obj = { ExpenseCategoryID: null, ExpenseLine: null };
        this.hideForm();
        this.operation = 'Add';
    }
}
