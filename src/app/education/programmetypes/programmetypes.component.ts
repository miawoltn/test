import { Component, OnInit, ViewChild } from "@angular/core";
import { HttpService } from "src/app/services/http.service";
import { educationUrl } from "../education-url";
import swal from "sweetalert2";
@Component({
  selector: "app-programmetypes",
  templateUrl: "./programmetypes.component.html",
  styleUrls: ["./programmetypes.component.scss"],
})
export class ProgrammetypesComponent implements OnInit {
  displayedColumns: string[] = ["ProgrammeType", "SchoolTypeID"];
  data = [];
  obj = { ProgrammeType: null, SchoolTypeID: null };
  displayForm = false;
  operation = "Add";
  title = "Programme Types";
  parent = "Education";
  schooltypes: any;

  constructor(protected http: HttpService) {
    this.loadItem = this.loadItem.bind(this);
  }

  ngOnInit() {
    this.http.get(educationUrl.programmetypes.list).subscribe(
      (res) => {
        this.data = res.data;
      },
      (err) => {
        console.log(err);
      }
    );

    this.http.get(educationUrl.schooltypes.list).subscribe(
      (res) => {
        this.schooltypes = res.data;
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
    let url = educationUrl.programmetypes.add;
    if (this.operation == "Update") url = educationUrl.programmetypes.update;
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
    this.obj = { ProgrammeType: null, SchoolTypeID: null };
    this.hideForm();
    this.operation = "Add";
  }
}
