import { settingsUrl } from 'src/app/settings/settings-url';
import { Component, OnInit, ViewChild } from "@angular/core";
import { HttpService } from "src/app/services/http.service";
import { leaveUrl } from "../leave-url";
import swal from "sweetalert2";
@Component({
  selector: "app-holidays",
  templateUrl: "./holidays.component.html",
  styleUrls: ["./holidays.component.scss"],
})
export class HolidaysComponent implements OnInit {
  displayedColumns: string[] = [
    "Holiday",
    "HolidayDate",
    "YearID",
    "DatePeriod",
  ];
  data = [];
  obj = { Holiday: null, HolidayDate: null, YearID: null, DatePeriod: null };
  displayForm = false;
  operation = "Add";
  title = "Holidays";
  parent = "Leave";
  year: any;

  constructor(protected http: HttpService) {
    this.loadItem = this.loadItem.bind(this);
  }

  ngOnInit() {
    this.http.get(leaveUrl.holidays.list).subscribe(
      (res) => {
        this.data = res.data;
      },
      (err) => {
        console.log(err);
      }
    );

    this.http.get(settingsUrl.year.list).subscribe(
      (res) => {
        this.year = res.data;
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
    let url = leaveUrl.holidays.add;
    if (this.operation == "Update") url = leaveUrl.holidays.update;
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
    this.obj = {
      Holiday: null,
      HolidayDate: null,
      YearID: null,
      DatePeriod: null,
    };
    this.hideForm();
    this.operation = "Add";
  }
}
