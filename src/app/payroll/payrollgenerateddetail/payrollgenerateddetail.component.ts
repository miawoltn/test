
import { Component, OnInit, ViewChild} from '@angular/core';
import { HttpService } from 'src/app/services/http.service';
import { payrollUrl } from '../payroll-url';
import swal from 'sweetalert2';
@Component({
  selector: 'app-payrollgenerateddetail',
  templateUrl: './payrollgenerateddetail.component.html',
  styleUrls: ['./payrollgenerateddetail.component.scss']
})
export class PayrollgenerateddetailComponent implements OnInit {
    
	displayedColumns: string[] = ['PayrollGeneratedID','SalaryComponent','Debit','Credit','Amount','SalaryComponentID'];
	data = [];
    obj={ PayrollGeneratedID : null,SalaryComponent : null,Debit : null,Credit : null,Amount : null,SalaryComponentID : null };
    displayForm = false;
    operation = "Add";
	title="Payroll Generated Details";
	parent="Payroll";
	
    constructor(protected http: HttpService) {
		this.loadItem = this.loadItem.bind(this);
	}
  
    ngOnInit() {
      this.http.get(payrollUrl.payrollgenerateddetail.list)
        .subscribe(res => {
		  this.data = res.data;
        }, err =>
        { console.log(err) });
		
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
      let url = payrollUrl.payrollgenerateddetail.add;
      if(this.operation=="Update")
        url = payrollUrl.payrollgenerateddetail.update;
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
      this.obj = { PayrollGeneratedID : null,SalaryComponent : null,Debit : null,Credit : null,Amount : null,SalaryComponentID : null };
      this.hideForm();
      this.operation="Add";
    }
  }
