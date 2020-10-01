import { Component, OnInit, ViewChild } from "@angular/core";
import { HttpService } from "src/app/services/http.service";
import { educationUrl } from "../education-url";
import swal from "sweetalert2";
@Component({
  selector: "app-qualifications",
  templateUrl: "./qualifications.component.html",
  styleUrls: ["./qualifications.component.scss"],
})
export class QualificationsComponent implements OnInit {
  displayedColumns: string[] = ["QualificationName", "ProgrammeTypeID"];
  data = [];
  obj = { QualificationName: null, ProgrammeTypeID: null };
  displayForm = false;
  operation = "Add";
  title = "Qualifications";
  parent = "Education";
  programmetypes: any;

  constructor(protected http: HttpService) {
    this.loadItem = this.loadItem.bind(this);
  }

  ngOnInit() {
    this.http.get(educationUrl.qualifications.list).subscribe(
      (res) => {
        this.data = res.data;
      },
      (err) => {
        console.log(err);
      }
    );

    this.http.get(educationUrl.programmetypes.list).subscribe(
      (res) => {
        this.programmetypes = res.data;
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
    let url = educationUrl.qualifications.add;
    if (this.operation == "Update") url = educationUrl.qualifications.update;
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
    this.obj = { QualificationName: null, ProgrammeTypeID: null };
    this.hideForm();
    this.operation = "Add";
  }
}
