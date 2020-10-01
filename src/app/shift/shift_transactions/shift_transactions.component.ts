import { employeeUrl } from './../../employee/employee-url';

import { Component, OnInit, ViewChild} from '@angular/core';
import { HttpService } from 'src/app/services/http.service';
import { shiftUrl } from '../shift-url';
import swal from 'sweetalert2';
@Component({
  selector: 'app-shift_transactions',
  templateUrl: './shift_transactions.component.html',
  styleUrls: ['./shift_transactions.component.scss']
})
export class Shift_transactionsComponent implements OnInit {
    
	displayedColumns: string[] = ['checktime','device','shift_status_category','SurName'];
	data = [];
    obj={ checktime : null,device : null,shift_status_category_id : null,EmployeeID : null };
    displayForm = false;
    operation = "Add";
	title="Shift Transactions";
	parent="Shift";
	employee = []; shift_status_category = []; 
    constructor(protected http: HttpService) {
		this.loadItem = this.loadItem.bind(this);
	}
  
    ngOnInit() {
      this.http.get(shiftUrl.shift_transactions.list)
        .subscribe(res => {
		  this.data = res.data;
        }, err =>
        { console.log(err) });
		this.http.get(shiftUrl.shift_status_category.list)
        .subscribe(res=>{
          this.shift_status_category = res.data;
        }, error =>
        { console.log(error) });
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
      let url = shiftUrl.shift_transactions.add;
      if(this.operation=="Update")
        url = shiftUrl.shift_transactions.update;
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
      this.obj = this.data.find(item => item.id == id.row.data.id);
      this.operation ="Update";
      this.showForm();
    }
  
    resetForm()
    {
      this.obj = { checktime : null,device : null,shift_status_category_id : null,EmployeeID : null };
      this.hideForm();
      this.operation="Add";
    }
  }
