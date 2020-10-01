
import { Component, OnInit, ViewChild} from '@angular/core';
import { HttpService } from 'src/app/services/http.service';
import { employeeUrl } from '../employee-url';
import swal from 'sweetalert2';
@Component({
  selector: 'app-employeereward',
  templateUrl: './employeereward.component.html',
  styleUrls: ['./employeereward.component.scss']
})
export class EmployeerewardComponent implements OnInit {
    
	displayedColumns: string[] = ['FirstName','Reward'];
	data = [];
    obj={ EmployeeID : null,RewardID : null };
    displayForm = false;
    operation = "Add";
	title="Employee Reward";
	parent="Employee";
	employee = []; reward = []; 
    constructor(protected http: HttpService) {
		this.loadItem = this.loadItem.bind(this);
	}
  
    ngOnInit() {
      this.http.get(employeeUrl.employeereward.list)
        .subscribe(res => {
		  this.data = res.data;
        }, err =>
        { console.log(err) });
		this.http.get(employeeUrl.reward.list)
        .subscribe(res => {
          this.reward = res.data;
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
  
    hideForm(){this.displayForm = false;}

    addItem() {
      this.resetForm();
      this.showForm();
    }
  
    processForm()
    {
      let url = employeeUrl.employeereward.add;
      if(this.operation=="Update")
        url = employeeUrl.employeereward.update;
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
      this.obj = { EmployeeID : null,RewardID : null };
      this.hideForm();
      this.operation="Add";
    }
  }
