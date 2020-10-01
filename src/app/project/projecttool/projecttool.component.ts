import { Component, OnInit, ViewChild } from '@angular/core';
import { HttpService } from 'src/app/services/http.service';
import { projectUrl } from '../project-url';
import { settingsUrl } from 'src/app/settings/settings-url';
import swal from 'sweetalert2';
@Component({
    selector: 'app-projecttool',
    templateUrl: './projecttool.component.html',
    styleUrls: ['./projecttool.component.scss'],
})
export class ProjecttoolComponent implements OnInit {
    displayedColumns: string[] = ['CustomerID', 'Equipment'];
    data = [];
    obj = { ProjectID: null, ToolID: null, EquipmentID: null };
    displayForm = false;
    operation = 'Add';
    title = 'Project Tool';
    parent = 'Project';
    equipment = [];
    project = [];
    tool = [];
    constructor(protected http: HttpService) {
        this.loadItem = this.loadItem.bind(this);
    }

    ngOnInit() {
        this.http.get(projectUrl.projecttool.list).subscribe(
            (res) => {
                this.data = res.data;
            },
            (err) => {
                console.log(err);
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
        this.http.get(settingsUrl.equipment.list).subscribe(
            (res) => {
                this.equipment = res.data;
            },
            (error) => {
                console.log(error);
            }
        );
        // this.http.get(Url.tool.list)
        //   .subscribe(res => {
        //     this.tool = res.data;
        //   }, error => { console.log(error) });
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
        let url = projectUrl.projecttool.add;
        if (this.operation == 'Update') url = projectUrl.projecttool.update;
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
        this.obj = { ProjectID: null, ToolID: null, EquipmentID: null };
        this.hideForm();
        this.operation = 'Add';
    }
}
