import { Component, OnInit, ViewChild } from '@angular/core';
import { HttpService } from 'src/app/services/http.service';
import { projectUrl } from '../project-url';
import swal from 'sweetalert2';
@Component({
    selector: 'app-projectsubcategory',
    templateUrl: './projectsubcategory.component.html',
    styleUrls: ['./projectsubcategory.component.scss'],
})
export class ProjectsubcategoryComponent implements OnInit {
    displayedColumns: string[] = ['ProjectSubCategory', 'ProjectCategory'];
    data = [];
    obj = { ProjectSubCategory: null, ProjectCategoryID: null };
    displayForm = false;
    operation = 'Add';
    title = 'Project Sub-Category';
    parent = 'Project';
    projectcategory = [];
    constructor(protected http: HttpService) {
        this.loadItem = this.loadItem.bind(this);
    }

    ngOnInit() {
        this.http.get(projectUrl.projectsubcategory.list).subscribe(
            (res) => {
                this.data = res.data;
            },
            (err) => {
                console.log(err);
            }
        );
        this.http.get(projectUrl.projectcategory.list).subscribe(
            (res) => {
                this.projectcategory = res.data;
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
        let url = projectUrl.projectsubcategory.add;
        if (this.operation == 'Update')
            url = projectUrl.projectsubcategory.update;
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
        this.obj = this.data.find((item) => item.id == id.row.data.id);
        this.operation = 'Update';
        this.showForm();
    }

    resetForm() {
        this.obj = { ProjectSubCategory: null, ProjectCategoryID: null };
        this.hideForm();
        this.operation = 'Add';
    }
}
