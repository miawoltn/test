import { settingsUrl } from 'src/app/settings/settings-url';
import { Component, OnInit, ViewChild } from '@angular/core';
import { HttpService } from 'src/app/services/http.service';
import { recruitmentUrl } from '../recruitment-url';
import swal from 'sweetalert2';
import { companyUrl } from 'src/app/company/company-url';
import { educationUrl } from 'src/app/education/education-url';
import { Router } from '@angular/router';
@Component({
    selector: 'app-jobapplication',
    templateUrl: './jobapplication.component.html',
    styleUrls: ['./jobapplication.component.scss'],
})
export class JobapplicationComponent implements OnInit {
    displayedColumns: string[] = [
        'FirsName',
        'VacancyID',
        'DateofApplication',
        'RecruitmentStageID',
        'RecruitmentStatusID',
        'CV',
        'CV',
    ];
    data = [];
    obj = {
        ApplicantID: null,
        VacancyID: null,
        DateofApplication: null,
        RecruitmentStageID: null,
        RecruitmentStatusID: null,
        ApplicantCVID: null,
    };
    displayForm = false;
    operation = 'Add';
    title = 'Jobapplication';
    parent = 'recruitment';
    applicantcv = [];
    applicants = [];
    recruitmentstage: any;
    recruitmentstatus: any;
    Vacancy = [];
    yearsofexperience = [];
    gender = [];
    branches = [];
    qualifications = [];
    professionlist = [];
    constructor(protected http: HttpService, protected router: Router) {
        this.loadItem = this.loadItem.bind(this);
    }

    ngOnInit() {
        this.http.get(recruitmentUrl.yearsofexperience.list).subscribe(
            (res) => {
                this.yearsofexperience = res.data;
            },
            (error) => {
                console.log(error);
            }
        );

        this.http.get(recruitmentUrl.jobapplication.jobApplications).subscribe(
            (res) => {
                this.data = res.data;
                console.log(this.data);
            },
            (err) => {
                console.log(err);
            }
        );

        this.http.get(recruitmentUrl.applicantcv.list).subscribe(
            (res) => {
                this.applicantcv = res.data;
            },
            (error) => {
                console.log(error);
            }
        );

        this.http.get(recruitmentUrl.applicants.list).subscribe(
            (res) => {
                this.applicants = res.data;
            },
            (error) => {
                console.log(error);
            }
        );

        this.http.get(recruitmentUrl.recruitmentstage.list).subscribe(
            (res) => {
                this.recruitmentstage = res.data;
            },
            (error) => {
                console.log(error);
            }
        );

        this.http.get(recruitmentUrl.recruitmentstatus.list).subscribe(
            (res) => {
                this.recruitmentstatus = res.data;
            },
            (error) => {
                console.log(error);
            }
        );

        this.http.get(recruitmentUrl.vacancy.list).subscribe(
            (res) => {
                this.Vacancy = res.data;
                console.log(res.data);
            },
            (error) => {
                console.log(error);
            }
        );

        this.http.get(recruitmentUrl.professions.list).subscribe(
            (res) => {
                this.professionlist = res.data;
                console.log(res.data);
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

        this.http.get(companyUrl.branches.list).subscribe(
            (res) => {
                this.branches = res.data;
            },
            (error) => {
                console.log(error);
            }
        );

        this.http.get(educationUrl.qualifications.list).subscribe(
            (res) => {
                this.qualifications = res.data;
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
        let url = recruitmentUrl.jobapplication.add;
        if (this.operation == 'Update')
            url = recruitmentUrl.jobapplication.update;
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
        // console.log(id);
        // const applicantId = id.row.data.ApplicantID;
        // console.log(applicantId);
        // this.router.navigate(['applicant-profile/', applicantId]);

        let appId = id.row.data.ApplicantID;
        this.router.navigate(['recruitment/applicant-profile', appId]);
        // this.obj = this.data.find((item) => item.id == id.row.data.id);
        // this.operation = 'Update';
        // this.showForm();
    }

    resetForm() {
        this.obj = {
            ApplicantID: null,
            VacancyID: null,
            DateofApplication: null,
            RecruitmentStageID: null,
            RecruitmentStatusID: null,
            ApplicantCVID: null,
        };
        this.hideForm();
        this.operation = 'Add';
    }
}
