import { Component, OnInit, ViewChild } from '@angular/core';
import { HttpService } from 'src/app/services/http.service';
import { projectUrl } from '../project-url';
import swal from 'sweetalert2';
@Component({
    selector: 'app-projectreview',
    templateUrl: './projectreview.component.html',
    styleUrls: ['./projectreview.component.scss'],
})
export class ProjectreviewComponent implements OnInit {
    displayedColumns: string[] = [
        'ReviewDate',
        'ReviewedBy',
        'ReviewComment',
        'NumberOfReviews',
    ];
    data = [];
    obj = {
        ReviewDate: null,
        ReviewedBy: null,
        ReviewComment: null,
        PaymentReviewPlanID: null,
    };
    displayForm = false;
    operation = 'Add';
    title = 'Project Review';
    parent = 'Project';
    projectreviewplan = [];
    constructor(protected http: HttpService) {
        this.loadItem = this.loadItem.bind(this);
    }

    ngOnInit() {
        this.http.get(projectUrl.projectreview.list).subscribe(
            (res) => {
                this.data = res.data;
            },
            (err) => {
                console.log(err);
            }
        );
        this.http.get(projectUrl.projectreviewplan.list).subscribe(
            (res) => {
                this.projectreviewplan = res.data;
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
        let url = projectUrl.projectreview.add;
        if (this.operation == 'Update') url = projectUrl.projectreview.update;
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
            ReviewDate: null,
            ReviewedBy: null,
            ReviewComment: null,
            PaymentReviewPlanID: null,
        };
        this.hideForm();
        this.operation = 'Add';
    }
}
