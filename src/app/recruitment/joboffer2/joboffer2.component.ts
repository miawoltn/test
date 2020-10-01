import { Component, OnInit, ViewChild } from "@angular/core";
import { HttpService } from "src/app/services/http.service";
import { recruitmentUrl } from "../recruitment-url";
import swal from "sweetalert2";
// import { companyUrl } from 'src/app/company/company-url';
@Component({
  selector: "app-joboffer2",
  templateUrl: "./joboffer2.component.html",
  styleUrls: ["./joboffer2.component.scss"],
})
export class Joboffer2Component implements OnInit {
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
  constructor(protected http: HttpService) {
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

  showForm() {
    this.displayForm = true;
    window.scrollTo({ top: 0, left: 0, behavior: "smooth" });
  }

  hideForm() {
    this.displayForm = true;
  }

  addItem() {
    this.resetForm();
    this.showForm();
  }

  onPrint() {
    window.print();
  }

  sendOfferLetter() {
    swal.showLoading();
    const url = recruitmentUrl.joboffer.sendOfferLetter;
    this.http.post(url, this.obj).subscribe(
      (res) => {
        this.data = res.data;
        swal.close();
        swal.fire('Process Successful.', 'Provisional Job Offer Letter Sent!', 'success');
      },
      (err) => {
        console.log(err);
        swal.fire("Process Unsuccessful", err.error.message, "error");
      }
    );
  }

  // processForm() {
  //     let url = recruitmentUrl.joboffer.add;
  //     // if (this.operation == 'Update') url = recruitmentUrl.joboffer.update;
  //     this.save(url);
  // }

  // save(url) {
  //     this.http.post(url, this.obj).subscribe(
  //         (res) => {
  //             this.jobOfferBin();
  //             // this.data = res.data;
  //             swal.fire('Process Complete', res.message, 'success');
  //             this.resetForm();
  //         },
  //         (err) => {
  //             console.log(err);
  //             swal.fire('Process Unsuccessful', err.error.message, 'error');
  //         }
  //     );
  // }

  loadItem(id) {
    this.obj = this.data.find((item) => item.id == id.row.data.id);
    console.log(this.obj);
    this.operation = "Update";
    this.obj.MonthlySalary = (this.obj.AnnualSalary / 12).toFixed(0);
    this.obj.Subtotal = Number(
      Number(this.obj.MonthlySalary) +
        Number(this.obj.HousingAllowance) +
        Number(this.obj.TransportAllowance) +
        Number(this.obj.UtilityAllowance) +
        Number(this.obj.MealSubsidy)
    ).toFixed(0);
    this.obj.GrandTotal = Number(
      Number(this.obj.MonthlySalary) +
        Number(this.obj.HousingAllowance) +
        Number(this.obj.TransportAllowance) +
        Number(this.obj.UtilityAllowance) +
        Number(this.obj.MealSubsidy) +
        Number(this.obj.FixedOverTime)
    ).toFixed(0);
    this.showForm();
  }

  resetForm() {
    // this.obj = {
    //     ApplicantID: null,
    //     Applicant: null,
    //     AnnualSalary: null,
    //     OtherVariables: null,
    //     OfferDate: null,
    //     OfferResponseID: null,
    //     ResponseDate: null,
    //     DesignationID: null,
    //     JobApplicationID: null,
    //     DesignationName: null,
    // };
    this.hideForm();
    this.displayForm = false;
    console.log(this.displayForm);
    this.operation = "Add";
  }
}
