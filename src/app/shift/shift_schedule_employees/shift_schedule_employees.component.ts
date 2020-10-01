import { employeeUrl } from './../../employee/employee-url';

import { Component, OnInit, ViewChild} from '@angular/core';
import { HttpService } from 'src/app/services/http.service';
import { shiftUrl } from '../shift-url';
import swal from 'sweetalert2';
@Component({
  selector: 'app-shift_schedule_employees',
  templateUrl: './shift_schedule_employees.component.html',
  styleUrls: ['./shift_schedule_employees.component.scss']
})
export class Shift_schedule_employeesComponent implements OnInit {
    
	displayedColumns: string[] = ['SurName','shift_schedule_id'];
	data = [];
    obj={ EmployeeID : null,shift_schedule_id : null };
    displayForm = false;
    operation = "Add";
	title="Shift Schedule Employees";
	parent="Shift";
	employee = []; 
    constructor(protected http: HttpService) {
		this.loadItem = this.loadItem.bind(this);
	}
  
    ngOnInit() {
      this.http.get(shiftUrl.shift_schedule_employees.list)
        .subscribe(res => {
		  this.data = res.data;
        }, err =>
        { console.log(err) });
		this.http.get(employeeUrl.employee.list)
        .subscribe(res=>{
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
      let url = shiftUrl.shift_schedule_employees.add;
      if(this.operation=="Update")
        url = shiftUrl.shift_schedule_employees.update;
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
          swal.fire("Process Unresful", err.error.message,'error');
        });

    }
  
    loadItem(id)
    {
      this.obj = this.data.find(item => item.id == id.row.data.id);
      this.operation ="Update";
      this.showForm();
    }
  
    resetForm()
    {
      this.obj = { EmployeeID : null,shift_schedule_id : null };
      this.hideForm();
      this.operation="Add";
    }
  }
