
import { Component, OnInit, ViewChild} from '@angular/core';
import { HttpService } from 'src/app/services/http.service';
import { employeeUrl } from '../employee-url';
import swal from 'sweetalert2';
@Component({
  selector: 'app-employeesanction',
  templateUrl: './employeesanction.component.html',
  styleUrls: ['./employeesanction.component.scss']
})
export class EmployeesanctionComponent implements OnInit {
    
	displayedColumns: string[] = ['FirstName','Offence','Sanction'];
	data = [];
    obj={ EmployeeID : null,OffenceID : null,SanctionID : null };
    displayForm = false;
    operation = "Add";
	title="Employee Sanction";
	parent="Employee";
	employee = []; offence = []; sanction = []; 
    constructor(protected http: HttpService) {
		this.loadItem = this.loadItem.bind(this);
	}
  
    ngOnInit() {
      this.http.get(employeeUrl.employeesanction.list)
        .subscribe(res => {
		  this.data = res.data;
        }, err =>
        { console.log(err) });
		this.http.get(employeeUrl.offence.list)
        .subscribe(res => {
          this.offence = res.data;
        }, error =>
        { console.log(error) });
		this.http.get(employeeUrl.sanction.list)
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
  
    hideForm(){this.displayForm = false;}

    addItem() {
      this.resetForm();
      this.showForm();
    }
  
    processForm()
    {
      let url = employeeUrl.employeesanction.add;
      if(this.operation=="Update")
        url = employeeUrl.employeesanction.update;
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
      this.obj = { EmployeeID : null,OffenceID : null,SanctionID : null };
      this.hideForm();
      this.operation="Add";
    }
  }
