import { Component, OnInit, ViewChild } from '@angular/core';
import { HttpService } from 'src/app/services/http.service';
import { projectUrl } from '../project-url';
import { expenseUrl } from 'src/app/expense/expense-url';
import swal from 'sweetalert2';
@Component({
    selector: 'app-projectexpense',
    templateUrl: './projectexpense.component.html',
    styleUrls: ['./projectexpense.component.scss'],
})
export class ProjectexpenseComponent implements OnInit {
    displayedColumns: string[] = [
        'CustomerID',
        'ExpenseCategoryID',
        'Expense',
        'ExpenseDescription',
        'Amount',
        'Date',
    ];
    data = [];
    obj = {
        ProjectID: null,
        ExpenseLineID: null,
        ExpenseCategoryID: null,
        ExpenseDescription: null,
        Amount: null,
        Date: null,
    };
    displayForm = false;
    operation = 'Add';
    title = 'Project Expense';
    parent = 'Project';
    expensecategory = [];
    expenseline = [];
    project = [];
    constructor(protected http: HttpService) {
        this.loadItem = this.loadItem.bind(this);
    }

    ngOnInit() {
        this.http.get(projectUrl.projectexpense.list).subscribe(
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
        this.http.get(expenseUrl.expenseline.list).subscribe(
            (res) => {
                this.expenseline = res.data;
            },
            (error) => {
                console.log(error);
            }
        );
        this.http.get(projectUrl.project.list).subscribe(
            (res) => {
                this.project = res.data;
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
        let url = projectUrl.projectexpense.add;
        if (this.operation == 'Update') url = projectUrl.projectexpense.update;
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
            ProjectID: null,
            ExpenseLineID: null,
            ExpenseCategoryID: null,
            ExpenseDescription: null,
            Amount: null,
            Date: null,
        };
        this.hideForm();
        this.operation = 'Add';
    }
}
