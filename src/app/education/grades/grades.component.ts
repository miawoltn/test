import { Component, OnInit, ViewChild } from "@angular/core";
import { HttpService } from "src/app/services/http.service";
import { educationUrl } from "../education-url";
import swal from "sweetalert2";
import { companyUrl } from 'src/app/company/company-url';
@Component({
  selector: "app-grades",
  templateUrl: "./grades.component.html",
  styleUrls: ["./grades.component.scss"],
})
export class GradesComponent implements OnInit {
  displayedColumns: string[] = ["GradeName", "GradeCode", "CompanyID"];
  data = [];
  obj = { GradeName: null, GradeCode: null, CompanyID: null };
  displayForm = false;
  operation = "Add";
  title = "Grades";
  parent = "Education";
  company: any;

  constructor(protected http: HttpService) {
    this.loadItem = this.loadItem.bind(this);
  }

  ngOnInit() {
    this.http.get(educationUrl.grades.list).subscribe(
      (res) => {
        this.data = res.data;
      },
      (err) => {
        console.log(err);
      }
    );

    this.http.get(companyUrl.company.list).subscribe(
      (res) => {
        this.company = res.data;
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
    this.displayForm = false;
  }

  addItem() {
    this.resetForm();
    this.showForm();
  }

  processForm() {
    let url = educationUrl.grades.add;
    if (this.operation == "Update") url = educationUrl.grades.update;
    this.save(url);
  }

  save(url) {
    this.http.post(url, this.obj).subscribe(
      (res) => {
        this.data = res.data;
        swal.fire("Process Complete", res.message, "success");
        this.resetForm();
      },
      (err) => {
        console.log(err);
        swal.fire("Process Unsuccessful", err.error.message, "error");
      }
    );
  }

  loadItem(id) {
    this.obj = this.data.find((item) => item.id === id.row.data.id);
    this.operation = "Update";
    this.showForm();
  }

  resetForm() {
    this.obj = { GradeName: null, GradeCode: null, CompanyID: null };
    this.hideForm();
    this.operation = "Add";
  }
}
