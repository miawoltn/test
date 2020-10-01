import { settingsUrl } from 'src/app/settings/settings-url';

import { Component, OnInit, ViewChild } from '@angular/core';
import { HttpService } from 'src/app/services/http.service';
import { recruitmentUrl } from '../recruitment-url';
import swal from 'sweetalert2';
import { Router } from '@angular/router';
@Component({
    selector: 'app-applicants',
    templateUrl: './applicants.component.html',
    styleUrls: ['./applicants.component.scss'],
})
export class ApplicantsComponent implements OnInit {
    displayedColumns: string[] = [
        'FirsName',
        'LastName',
        'Othername',
        'Email',
        'Phone',
        'Address',
        'DOB',
        'About',
        'Password',
        'Photo',
        'ExperienceLevel',
        'Gender',
        'Name',
    ];
    data = [];
    obj = {
        FirsName: null,
        LastName: null,
        Othername: null,
        Email: null,
        Phone: null,
        Address: null,
        DOB: null,
        About: null,
        Password: null,
        Photo: null,
        ExperienceLevelID: null,
        GenderID: null,
        NationalityID: null,
    };
    displayForm = false;
    operation = 'Add';
    title = 'Applicants';
    parent = 'recruitment';
    country = [];
    experiencelevel = [];
    gender = [];
    constructor(protected http: HttpService, protected router: Router) {
        this.loadItem = this.loadItem.bind(this);
    }

    ngOnInit() {
        this.http.get(recruitmentUrl.applicants.list).subscribe(
            (res) => {
                this.data = res.data;
            },
            (err) => {
                console.log(err);
            }
        );
        this.http.get(recruitmentUrl.experiencelevel.list).subscribe(
            (res) => {
                this.experiencelevel = res.data;
            },
            (error) => {
                console.log(error);
            }
        );
        this.http.get(settingsUrl.country.list).subscribe(
            (res) => {
                this.country = res.data;
            },
            (error) => {
                console.log(error);
            }
        );
        this.http.get(settingsUrl.gender.list).subscribe(
            (res) => {
                this.gender = res.data;
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
        let url = recruitmentUrl.applicants.add;
        if (this.operation == 'Update') url = recruitmentUrl.applicants.update;
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
        let appId = id.row.data.id;
        this.router.navigate(['recruitment/applicant-profile', appId]);
        // this.obj = this.data.find((item) => item.id == id.row.data.id);
        // this.operation = 'Update';
        // this.showForm();
    }

    resetForm() {
        this.obj = {
            FirsName: null,
            LastName: null,
            Othername: null,
            Email: null,
            Phone: null,
            Address: null,
            DOB: null,
            About: null,
            Password: null,
            Photo: null,
            ExperienceLevelID: null,
            GenderID: null,
            NationalityID: null,
        };
        this.hideForm();
        this.operation = 'Add';
    }
}
