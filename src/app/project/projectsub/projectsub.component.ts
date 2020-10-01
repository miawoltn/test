import { Router } from '@angular/router';
import { Component, OnInit, ViewChild } from '@angular/core';
import { HttpService } from 'src/app/services/http.service';
import { projectUrl } from '../project-url';
import swal from 'sweetalert2';
import { employeeUrl } from 'src/app/employee/employee-url';
@Component({
    selector: 'app-projectsub',
    templateUrl: './projectsub.component.html',
    styleUrls: ['./projectsub.component.scss'],
})
export class ProjectsubComponent implements OnInit {
    displayedColumns: string[] = [
        'ProjectSubTitle',
        'Duration',
        'StartDate',
        'ResidentEngineerID',
        'CustomerID',
        'ParentProjectSubID',
    ];
    data = [];
    obj2: {
        CustomerName: null;
        CustomerID: null;
        ProjectTypeID: null;
        ProjectSubTypeID: null;
        ProjectStatusID: null;
        ProjectDescription: null;
        ProjectLocation: null;
        ProjectApprovedBudget: null;
        ProjectDuration: null;
        ProjectAwardDate: null;
        ProjectStartDate: null;
        CustomerTypeID: null;
        ProjectStatus: null;
        ProjectType: null;
    };
    sub: [];
    obj = {
        ProjectSubTitle: null,
        Duration: null,
        StartDate: null,
        ResidentEngineerID: null,
        ProjectID: null,
        ParentProjectSubID: null,
    };
    displayForm = false;
    operation = 'Add';
    title = 'Projectsub';
    parent = 'project';
    project = [];
    addSub = false;
    showList = true;
    projectsub: any;
    employees: any;
    projectId: any;
    showList2: boolean;
    constructor(protected http: HttpService, private router: Router) {
        this.loadItem = this.loadItem.bind(this);
        this.loadSub = this.loadSub.bind(this);
    }

    ngOnInit() {
        this.http.get(projectUrl.project.list).subscribe(
            (res) => {
                this.data = res.data;
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
            .get(projectUrl.projectsub.subProjectsByProjectId + id)
            .subscribe(
                (res) => {
                    this.sub = res.data;                             
                    console.log(this.data);
                },
                (err) => {
                    console.log(err);
                }
            );
    }

    showForm() {
        this.displayForm = true;
        this.showList2 = true;
        this.addSub = false;
        window.scrollTo({ top: 0, left: 0, behavior: 'smooth' });
    }

    showAddSub() {
        this.addSub = true;
        this.displayForm = false;
        this.showList = false;
        this.showList2 = false;
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
        let url = projectUrl.projectsub.add;
        if (this.operation == 'Update') url = projectUrl.projectsub.update;
        this.save(url);
    }

    save(url) {
        this.http.post(url, this.obj).subscribe(
            (res) => {
                // this.data = res.data;
                swal.fire('Process Complete', res.message, 'success');
                this.resetForm();
                this.loadSubProjects(this.projectId);
            },
            (err) => {
                console.log(err);
                swal.fire('Process Unsuccessful', err.error.message, 'error');
            }
        );
    }

    loadItem(id) {
        this.showList2 = true;
        this.showList = false;
        this.showForm();
        console.log(id.row.data.id);
        this.obj.ProjectID = id.row.data.id;
        this.projectId = id.row.data.id;
        this.obj2 = this.data.find((item) => item.id == id.row.data.id);

        console.log(this.obj2);
        this.loadSubProjects(this.projectId);
    }

    loadSub(id) {
        this.router.navigate(['/project/projectsub-view', id.row.data.id]);
    }

    resetForm() {
        this.obj = {
            ProjectSubTitle: null,
            Duration: null,
            StartDate: null,
            ResidentEngineerID: null,
            ProjectID: null,
            ParentProjectSubID: null,
        };
        this.showForm();
        
    }
    backToList() {
        this.displayForm = false;
        this.showList = true;
    }
}
