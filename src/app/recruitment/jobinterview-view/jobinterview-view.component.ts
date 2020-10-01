import { Component, OnInit, ViewChild } from '@angular/core';
import { HttpService } from 'src/app/services/http.service';
import { recruitmentUrl } from '../recruitment-url';
import swal from 'sweetalert2';
@Component({
    selector: 'app-jobinterview-view',
    templateUrl: './jobinterview-view.component.html',
    styleUrls: ['./jobinterview-view.component.scss'],
})
export class JobInterviewViewComponent implements OnInit {
    displayedColumns: string[] = [];
    data = [];
    // obj = {
    //     ApplicantID: null,
    //     VacancyID: null,
    //     DateofApplication: null,
    //     RecruitmentStageID: null,
    //     RecruitmentStatusID: null,
    //     ApplicantCVID: null,
    // };
    displayForm = false;
    operation = 'Add';
    title = 'Job Application';
    parent = 'Recruitment';
    applicantcv = [];
    applicants = [];
    recruitmentstage: any;
    recruitmentstatus: any;
    Vacancy: any;
    constructor(protected http: HttpService) {
        this.loadItem = this.loadItem.bind(this);
    }

    ngOnInit() {
        this.http.get(recruitmentUrl.jobinterview.list).subscribe(
            (res) => {
                this.data = res.data;
            },
            (err) => {
                console.log(err);
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
        if (this.operation === 'Update') {
            url = recruitmentUrl.jobapplication.update;
        }
        this.save(url);
    }

    save(url) {
        // this.http.post(url, this.obj).subscribe(
        //     (res) => {
        //         this.data = res.data;
        //         swal.fire('Process Complete', res.message, 'success');
        //         this.resetForm();
        //     },
        //     (err) => {
        //         console.log(err);
        //         swal.fire('Process Unsuccessful', err.error.message, 'error');
        //     }
        // );
    }

    loadItem(id) {
        // this.obj = this.data.find((item) => item.id == id.row.data.id);
        // this.operation = 'Update';
        // this.showForm();
    }

    resetForm() {
        // this.obj = {
        //     ApplicantID: null,
        //     VacancyID: null,
        //     DateofApplication: null,
        //     RecruitmentStageID: null,
        //     RecruitmentStatusID: null,
        //     ApplicantCVID: null,
        // };
        this.hideForm();
        this.operation = 'Add';
    }
}
