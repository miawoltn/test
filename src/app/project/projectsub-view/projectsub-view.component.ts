import { Component, OnInit, ViewChild } from '@angular/core';
import { HttpService } from 'src/app/services/http.service';
import { projectUrl } from '../project-url';
import swal from 'sweetalert2';
import { employeeUrl } from 'src/app/employee/employee-url';
import { ActivatedRoute, Router } from '@angular/router';
@Component({
    selector: 'app-projectsub-view',
    templateUrl: './projectsub-view.component.html',
    styleUrls: ['./projectsub-view.component.scss'],
})
export class ProjectsubViewComponent implements OnInit {
    displayedColumns: string[] = [
        'ProjectSubTitle',
        'Duration',
        'StartDate',
        'ResidentEngineerID',
        'CustomerID',
        'ParentProjectSubID',
    ];
    data = [];
    obj = {
        Duration: null,
        FullName: null,
        ParentProjectSubID: null,
        ProjectDescription: null,
        ProjectID: null,
        ProjectSubID: null,
        ProjectSubTitle: null,
        ResidentEngineerID: null,
        StartDate: null,
        id: null,
    };

    obj2 = {
        ProjectSubTitle: null,
        Duration: null,
        StartDate: null,
        ResidentEngineerID: null,
        ProjectID: null,
        ParentProjectSubID: null,
    };

    // projectId = 1;
    sub: [];
    displayForm = true;
    operation = 'Add';
    title = 'Projectsub';
    parent = 'project';
    project = [];
    addSub = false;
    showList = true;
    projectsub: any;
    employees: any;
    id: any;
    priorities: { id: number; value: string }[];
    constructor(protected http: HttpService, private route: ActivatedRoute) {
        this.id = this.route.snapshot.params.id;
        this.loadItem = this.loadItem.bind(this);
    }

    ngOnInit() {
        console.log(this.id);
        this.loadSubProjects(this.id);
        this.http.get(projectUrl.projectsub.get + this.id).subscribe(
            (res) => {
                console.log(res.data);
                this.obj = res.data;
            },
            (err) => {
                console.log(err);
            }
        );

        this.http.get(employeeUrl.employee.list).subscribe(
            (res) => {
                this.employees = res.data;
            },
            (err) => {
                console.log(err);
            }
        );
    }

    loadSubProjects(id) {
        this.http
            .get(projectUrl.projectsub.subProjectsBySubProjectId + id)
            .subscribe(
                (res) => {
                    this.data = res.data;
                    console.log(this.data);
                },
                (err) => {
                    console.log(err);
                }
            );
    }

    showForm() {
        this.displayForm = true;
        this.showList = true;
        this.addSub = false;
        window.scrollTo({ top: 0, left: 0, behavior: 'smooth' });
    }

    showAddSub() {
        this.addSub = true;
        this.showList = false;
        this.displayForm = false;
        window.scrollTo(0, 1200);
        // this.sub = this.sub;
    }

    hideForm() {
        this.displayForm = false;
    }
    hideSub() {
        this.addSub = false;
        this.showList = true;
    }

    addItem() {
        this.resetForm();
        this.showForm();
    }

    processForm() {
        this.obj2.ParentProjectSubID = this.obj.ProjectSubID
        this.obj2.ProjectID = this.obj.ProjectID;
        let url = projectUrl.projectsub.add;
        if (this.operation == 'Update') url = projectUrl.projectsub.update;
        this.save(url);
    }

    save(url) {
        this.http.post(url, this.obj2).subscribe(
            (res) => {
                // this.data = res.data;
                swal.fire('Process Complete', res.message, 'success');
                this.resetForm();
                this.loadSubProjects(this.obj.ProjectSubID);
            },
            (err) => {
                console.log(err);
                swal.fire('Process Unsuccessful', err.error.message, 'error');
            }
        );
    }

    loadSub() {
        
    }

    loadItem(id) {
        // this.showForm();
        // console.log(id.row.data);
        // this.obj.ProjectID = id.row.data.id;
        // this.obj = this.data.find((item) => item.id == id.row.data.id);
        // this.sub = this.projectsub.filter((i) => i.ProjectID == id.row.data.id);
        // console.log(this.sub);
        // console.log("ProjectsubComponent -> loadItem -> this.obj", this.obj)
        // this.operation = 'Update';
    }

    resetForm() {
        this.obj2 = {
            ProjectSubTitle: null,
            Duration: null,
            StartDate: null,
            ResidentEngineerID: null,
            ProjectID: null,
            ParentProjectSubID: null,
        };
        // this.hideForm();
        // this.hideSub();
        this.showForm()
        
        this.operation = 'Add';
    }
}
