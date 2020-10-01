import { Component, OnInit, ViewChild } from "@angular/core";
import { HttpService } from "src/app/services/http.service";
import { recruitmentUrl } from "../recruitment-url";
import swal from "sweetalert2";
@Component({
  selector: "app-years-of-experience",
  templateUrl: "./years-of-experience.component.html",
  styleUrls: ["./years-of-experience.component.scss"],
})
export class YearsOfExperienceComponent implements OnInit {
  displayedColumns: string[] = ['YearsofExperience'];
  data = [];
  obj = { YearsofExperience: null };
  displayForm = false;
  operation = "Add";
  title = "Years of Experience";
  parent = "Recruitment";

  constructor(protected http: HttpService) {
    this.loadItem = this.loadItem.bind(this);
  }

  ngOnInit() {
    this.http.get(recruitmentUrl.yearsofexperience.list).subscribe(
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
    this.displayForm = false;
  }

  addItem() {
    this.resetForm();
    this.showForm();
  }

  processForm() {
    let url = recruitmentUrl.yearsofexperience.add;
    if (this.operation == "Update") url = recruitmentUrl.yearsofexperience.update;
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
    this.obj = { YearsofExperience: null };
    this.hideForm();
    this.operation = "Add";
  }
}
