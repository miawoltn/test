import { Router } from "@angular/router";
import { Component, OnInit, ViewChild } from "@angular/core";
import { HttpService } from "src/app/services/http.service";
import { recruitmentUrl } from "../recruitment-url";
import swal from "sweetalert2";
// import { companyUrl } from 'src/app/company/company-url';
@Component({
  selector: "app-employee-onboarding",
  templateUrl: "./employee-onboarding.component.html",
  styleUrls: ["./employee-onboarding.component.scss"],
})
export class EmployeeOnboardingComponent implements OnInit {
  displayedColumns: string[] = [];
  data = [];
  obj = {
    ApplicantID: null,
    Applicant: null,
    AnnualSalary: null,
    MonthlySalary: null,
    OtherVariables: null,
    OfferDate: null,
    OfferResponseID: null,
    ResponseDate: null,
    DesignationID: null,
    JobApplicationID: null,
    DesignationName: null,
    Address: null,
    DateofApplication: null,
    BranchName: null,
    HousingAllowance: null,
    TransportAllowance: null,
    UtilityAllowance: null,
    MealSubsidy: null,
    FixedOverTime: null,
    Subtotal: null,
    GrandTotal: null,
  };
  displayForm = false;
  operation = "Add";
  title = "Job Offers";
  parent = "Recruitment";
  constructor(protected http: HttpService, protected router: Router) {
    this.loadItem = this.loadItem.bind(this);
  }

  ngOnInit() {
    this.http.get(recruitmentUrl.joboffer.list).subscribe(
      (res) => {
        this.data = res.data;
      },
      (err) => {
        console.log(err);
      }
    );
  }

  loadItem(id) {
    console.log(id.row.data.ApplicantID);
    const applicant = id.row.data.ApplicantID;
    this.router.navigate(['/employee/employee-onboarding', applicant]);
  }
}
