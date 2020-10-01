import { Component, OnInit } from "@angular/core";
import { HttpService } from "src/app/services/http.service";
import swal from "sweetalert2";
import { employeequeryresponseUrl } from "../employeequeryresponse-url";
import { employeeUrl } from "src/app/employee/employee-url";
import { sanctionUrl } from "src/app/sanction/sanction-url";

@Component({
  selector: "app-queryevaluation",
  templateUrl: "./queryevaluation.component.html",
  styleUrls: ["./queryevaluation.component.css"],
})
export class QueryevaluationComponent implements OnInit {
  isEditable = true;
  isLinear = true;
  data = [];
  obj = {
    EmployeeID: null,
    OffenceID: null,
    OffenceDescription: null,
    Response: null,
    IsAccepted: null,
    SanctionID: null,
    FullName: null,
    Offence: null,
  };
  obj2 = { Sanction: null };
  displayForm = false;
  operation = "Add";
  title = "Employeesanctionreplies";
  parent = "Employeesanctionresponse";
  employee = [];
  sanction = [];

  constructor(protected http: HttpService) {
    this.loadItem = this.loadItem.bind(this);
    this.respond = this.respond.bind(this);
  }

  ngOnInit() {
    this.http
      .get(employeequeryresponseUrl.employeequeryevaluation.list)
      .subscribe(
        (res) => {
          this.data = res.data;
        },
        (err) => {
          console.log(err);
        }
      );
    this.http.get(employeeUrl.employee.list).subscribe(
      (res) => {
        this.employee = res.data;
      },
      (error) => {
        console.log(error);
      }
    );
    this.http.get(sanctionUrl.sanction.list).subscribe(
      (res) => {
        this.sanction = res.data;
      },
      (error) => {
        console.log(error);
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
    let url = employeequeryresponseUrl.employeequeryevaluation.add;
    if (this.operation == "Update")
      url = employeequeryresponseUrl.employeequeryevaluation.update;
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

  respond(id) {
    this.obj = this.data.find((item) => item.id === id.row.data.id);
    this.operation = "Add";
    this.showForm();
  }

  resetForm() {
    this.obj = {
      EmployeeID: null,
      OffenceID: null,
      OffenceDescription: null,
      Response: null,
      IsAccepted: null,
      SanctionID: null,
      FullName: null,
      Offence: null,
    };
    this.hideForm();
    this.operation = "Add";
  }

  onConfirm() {
    // this.obj2.Employee = this.employee.find(i => i.id === this.obj.EmployeeID).FullName;
    // this.obj2.Offence = this.offence.find(i => i.id === this.obj.OffenceID).Offence;
    this.obj2.Sanction = this.sanction.find(
      (i) => i.id === this.obj.SanctionID
    ).Sanction;
  }
}
