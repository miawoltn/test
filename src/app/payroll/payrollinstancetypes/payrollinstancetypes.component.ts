
import { Component, OnInit, ViewChild} from '@angular/core';
import { HttpService } from 'src/app/services/http.service';
import { payrollUrl } from '../payroll-url';
import swal from 'sweetalert2';
@Component({
  selector: 'app-payrollinstancetypes',
  templateUrl: './payrollinstancetypes.component.html',
  styleUrls: ['./payrollinstancetypes.component.scss']
})
export class PayrollinstancetypesComponent implements OnInit {
    
	displayedColumns: string[] = ['InstanceTypeID','InstanceType'];
	data = [];
    obj={ InstanceTypeID : null,InstanceType : null };
    displayForm = false;
    operation = "Add";
	title="Payroll Instance Types";
	parent="Payroll";
	
    constructor(protected http: HttpService) {
		this.loadItem = this.loadItem.bind(this);
	}
  
    ngOnInit() {
      this.http.get(payrollUrl.payrollinstancetypes.list)
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
      let url = payrollUrl.payrollinstancetypes.add;
      if(this.operation=="Update")
        url = payrollUrl.payrollinstancetypes.update;
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
      this.obj = { InstanceTypeID : null,InstanceType : null };
      this.hideForm();
      this.operation="Add";
    }
  }
