import { Component, OnInit } from '@angular/core';
import { HttpService } from 'src/app/services/http.service';
import swal from 'sweetalert2';

import { employeequeryresponseUrl } from '../employeequeryresponse-url';
import { employeeUrl } from 'src/app/employee/employee-url';



@Component({
  selector: 'app-queryresponse',
  templateUrl: './queryresponse.component.html',
  styleUrls: ['./queryresponse.component.css']
})
export class QueryresponseComponent implements OnInit {

  isEditable = true;
  isLinear = true; 
  data=[];
  obj = {EmployeeID: null, Status: null, Response: null, EmployeeQueryListID: null};
  displayForm = false;
  operation = "Add";
  title="Employeesanctionresponse";
  parent="Employeesanctionresponse";
  employee = []; 
  sanction = [];

  constructor(protected http: HttpService) { 
    // this.loadItem = this.loadItem.bind(this);
    this.respond = this.respond.bind(this);
  }

  ngOnInit() {
    this.http.get(employeequeryresponseUrl.employeequeryresponse.list)
        .subscribe(res => {
		  this.data = res.data;
        }, err =>
        { console.log(err) });
		this.http.get(employeeUrl.employee.list)
        .subscribe(res => {
          this.employee = res.data;
        }, error =>
        { console.log(error) });
  }

  showForm()
    {
      this.displayForm = true;
      window.scrollTo({ top: 0, left: 0, behavior: 'smooth' })
    }

    hideForm(){this.displayForm = false;}

    addItem() {
      this.resetForm();
      this.showForm();
    }
  
    processForm()
    {
      let url = employeequeryresponseUrl.employeequeryresponse.add;
      if(this.operation=="Update")
        url = employeequeryresponseUrl.employeequeryresponse.update;
      this.save(url);
    }
  
    save(url)
    {
      this.http.post(url,this.obj)
        .subscribe(res => {
          this.data= res.data;
          swal.fire("Process Complete", res.message,'success');
          this.resetForm();
        }, err =>
        {
          console.log(err);
          swal.fire("Process Unsuccessful", err.error.message,'error');
        });

    }
  
    loadItem(id)
    {
      this.obj = this.data.find(item => item.id === id.row.data.id);
      this.operation ="Update";
      this.showForm();
    }

    respond(id)
    {
      this.obj = this.data.find(item => item.id === id.row.data.id);
      console.log(this.obj);
      this.operation ="Add";
      this.showForm();
    }
  
    resetForm()
    {
      this.obj = { EmployeeID: null, Status: null, Response: null, EmployeeQueryListID: null};
      this.hideForm();
      this.operation="Add";
    }

    onConfirm() {
      // this.obj2.Employee = this.employee.find(i => i.id === this.obj.EmployeeID).FullName;
      // this.obj2.Offence = this.offence.find(i => i.id === this.obj.OffenceID).Offence;
    }


}
