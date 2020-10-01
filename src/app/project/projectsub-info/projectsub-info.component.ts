import { Component, OnInit, ViewChild } from '@angular/core';
import { HttpService } from 'src/app/services/http.service';
import { projectUrl } from '../project-url';
import swal from 'sweetalert2';
import { employeeUrl } from 'src/app/employee/employee-url';
import { ActivatedRoute } from '@angular/router';
@Component({
    selector: 'app-projectsub-info',
    templateUrl: './projectsub-info.component.html',
    styleUrls: ['./projectsub-info.component.scss'],
})
export class ProjectsubInfoComponent implements OnInit {
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
    // projectId = 1;
    sub: [];
    displayForm = false;
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
        this.http.get(projectUrl.projectsub.get + this.id).subscribe(
            (res) => {
                console.log(res.data);
                this.obj = res.data;
            },
            (err) => {
                console.log(err);
            }
        );
        // this.http
        //     .get(projectUrl.projectsub.subProjectsByProjectId + this.id)
        //     .subscribe(
        //         (res) => {
        //             this.data = res.data;
        //             console.log(this.data);
        //         },
        //         (err) => {
        //             console.log(err);
        //         }
        //     );

        // this.loadSubProjects();
    }

    // loadSubProjects() {
    //     this.http.get(projectUrl.projectsub.list).subscribe(
    //         (res) => {
    //             this.projectsub = res.data;
    //             console.log(this.projectsub);
    //         },
    //         (err) => {
    //             console.log(err);
    //         }
    //     );
    // }

    showForm() {
        this.displayForm = true;
        window.scrollTo({ top: 0, left: 0, behavior: 'smooth' });
    }

    showAddSub() {
        this.addSub = true;
        this.showList = false;
        window.scrollTo(0, 1200);
        this.sub = this.sub;
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
        // this.http.post(url, this.obj).subscribe(
        //     (res) => {
        //         // this.data = res.data;
        //         swal.fire('Process Complete', res.message, 'success');
        //         this.resetForm();
        //         // this.loadSubProjects();
        //     },
        //     (err) => {
        //         console.log(err);
        //         swal.fire('Process Unsuccessful', err.error.message, 'error');
        //     }
        // );
    }

    loadItem(id) {
        // this.showForm();
        // console.log(id.row.data);
        // this.obj.ProjectID = id.row.data.id;
        // this.obj2 = this.data.find((item) => item.id == id.row.data.id);
        // this.sub = this.projectsub.filter((i) => i.ProjectID == id.row.data.id);
        // console.log(this.sub);
        // console.log("ProjectsubComponent -> loadItem -> this.obj", this.obj)
        // this.operation = 'Update';
    }

    resetForm() {
        // this.obj = {
        //     ProjectSubTitle: null,
        //     Duration: null,
        //     StartDate: null,
        //     ResidentEngineerID: null,
        //     ProjectID: null,
        //     ParentProjectSubID: null,
        // };
        // this.hideForm();
        // this.hideSub();
        // this.operation = 'Add';
    }
}
