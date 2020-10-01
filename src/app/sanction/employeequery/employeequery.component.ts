import { Component, OnInit, ViewChild} from '@angular/core';
import { HttpService } from 'src/app/services/http.service';
import swal from 'sweetalert2';

import { sanctionUrl } from '../sanction-url';
import { employeeUrl } from 'src/app/employee/employee-url';

@Component({
  selector: 'app-employeequery',
  templateUrl: './employeequery.component.html',
  styleUrls: ['./employeequery.component.css']
})
export class EmployeequeryComponent implements OnInit {

  isEditable = true;
  isLinear = true;  
	displayedColumns: string[] = ['FirstName','Offence','Date of Offence', 'Description'];
	data = [];
    // obj={ EmployeeID : null,OffenceID : null,SanctionID : null, Description : null };
  obj={ EmployeeID : [],OffenceID : null, OffenceDescription : null, OffenceDate : null, CopyListID: null };
  obj2={ Employee : null, Offence : null };
  displayForm = false;
  operation = "Add";
	title="Employeequery";
	parent="employee";
  employee = []; 
  offence = []; sanction = []; 
  offendingemployees: any;
  copylist: any;

  constructor(protected http: HttpService) {
		this.loadItem = this.loadItem.bind(this);
	}

  ngOnInit() {
    this.http.get(sanctionUrl.employeequery.list)
        .subscribe(res => {
		  this.data = res.data;
        }, err =>
        { console.log(err) });
		this.http.get(sanctionUrl.offence.list)
        .subscribe(res => {
          this.offence = res.data;
        }, error =>
        { console.log(error) });
		this.http.get(sanctionUrl.sanction.list)
        .subscribe(res => {
          this.sanction = res.data;
        }, error =>
        { console.log(error) });
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
  
    hideForm(){this.displayForm = false; console.log(this.data);}

    addItem() {
      this.resetForm();
      this.showForm();
    }
  
    processForm()
    {
      let url = sanctionUrl.employeequery.add;
      if(this.operation=="Update")
        url = sanctionUrl.employeequery.update;
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
  
    resetForm()
    {
      this.obj = { EmployeeID : [],OffenceID : null, OffenceDescription : null, OffenceDate : null, CopyListID: null };
      this.hideForm();
      this.operation="Add";
    }

    onConfirm() {
      // this.obj2.Employee = this.employee.find(i => i.id === this.obj.EmployeeID).FullName;
      this.obj2.Offence = this.offence.find(i => i.id === this.obj.OffenceID).Offence;

      this.offendingemployees ="";
      this.obj.EmployeeID.forEach(item=> {
        this.offendingemployees = this.offendingemployees + this.employee.find(i => i.id == item).FullName + " - ";
      })
      this.copylist="";
      this.obj.CopyListID.forEach(item=> {
        this.copylist = this.copylist + this.employee.find(i => i.id == item).FullName + " - ";
      })

    }

}
