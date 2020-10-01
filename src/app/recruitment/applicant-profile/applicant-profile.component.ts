
import { Component, OnInit } from '@angular/core';
import { HttpService } from 'src/app/services/http.service';
// import { employeeUrl } from '../employee-url';
// import swal from 'sweetalert2';
import { ActivatedRoute } from '@angular/router';
import { recruitmentUrl } from '../recruitment-url';
import { API_URL } from 'src/app/services/app-config';
@Component({
  selector: 'app-applicant-profile',
  templateUrl: './applicant-profile.component.html',
  styleUrls: ['./applicant-profile.component.scss']
})
export class ApplicantProfileComponent implements OnInit {

  data = [];
  API_URL2 = API_URL;
  obj = {
    applicant: {
      ApplicantID: null,
      ApplicantCV: null,
      Applicant: null,
      FirsName: null,
      LastName: null,
      Othername: null,
      Email: null,
      Phone: null,
      Address: null,
      DOB: null,
      Age: null,
      About: null,
      Photo: null,
      ExperienceLevelID: null,
      Password: null,
      GenderID: null,
      NationalityID: null,
      createdBy: null,
      dateCreated: null,
      modifiedBy: null,
      dateModified: null,
      QualificationID: null,
      QualificationName: null,
      YearsofExperienceID: null,
      JobType: null,
      JobLevel: null,
      SalaryFrom: null,
      Profession: null,
      Name: null,
      EmploymentType: null,
      ExperienceLevel: null,
      YearsofExperience: null,
      ProfessionID: null,
    },
    appexp: [
      {
        ApplicantExperienceID: null,
        ExpTitle: null,
        CompanyName: null,
        DateFrom: null,
        DateTo: null,
        Description: null,
      },
    ],
    appedu: [
      {
        ApplicantEducactionID: null,
        EduTitle: null,
        SchoolName: null,
        DateFrom: null,
        DateTo: null,
        EduDescription: null,
      },
    ],
    appskills: [
      {
        ApplicantSkillD: null,
        Skill: null,
        Percent: null,
      },
    ],
    appawards: [
      {
        ApplicantAwardlD: null,
        Title: null,
        Year: null,
        Description: null,
      },
    ],
    appcv: {
      ApplicantCVID: null,
      CV: null
    }
  };

  displayForm = false;
  displayTable = true;
  operation = 'Add';
  title = 'Profile';
  parent = 'Employee';
  applicantId: any;

  constructor(
    protected http: HttpService,
    private route: ActivatedRoute
  ) {
    // get empId from url
    this.applicantId = this.route.snapshot.params.id;
    console.log(this.applicantId);
    // this.loadItem = this.loadItem.bind(this);
  }

  print(){
    window.print();
  }

  ngOnInit() {
    // get user info by id
    this.http.get(recruitmentUrl.applicants.get + this.applicantId).subscribe(
      (res) => {
        this.obj = res.data;
        console.log(this.obj);
        var t = this.obj.applicant.DOB.split(/[- :]/);
        let dob = new Date(Date.UTC(Number(t[0]), Number(t[1]) - 1, Number(t[2])));
        let ageDifMs = Date.now() - dob.getTime();
        let ageDate = new Date(ageDifMs);
        let ageDate2 = Math.abs(ageDate.getUTCFullYear() - 1970);
        this.obj.applicant.Age = ageDate2;

      //   function getAge(dateString) {
      //     var today = new Date();
      //     var birthDate = new Date(dateString);
      //     var age = today.getFullYear() - birthDate.getFullYear();
      //     var m = today.getMonth() - birthDate.getMonth();
      //     if (m < 0 || (m === 0 && today.getDate() < birthDate.getDate())) {
      //         age--;
      //     }
      //     return age;
      // }
      },
      (error) => {
        console.log(error);
      }
    );
  }

}
