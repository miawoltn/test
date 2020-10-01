
import { Component, OnInit, ViewChild} from '@angular/core';
import { HttpService } from 'src/app/services/http.service';
import { salaryUrl } from '../salary-url';
import swal from 'sweetalert2';
@Component({
  selector: 'app-salarytaxstatus',
  templateUrl: './salarytaxstatus.component.html',
  styleUrls: ['./salarytaxstatus.component.scss']
})
export class SalarytaxstatusComponent implements OnInit {
    
	displayedColumns: string[] = ['TaxStatusID','TaxStatus','SalaryTypeID'];
  data = [];
  SalaryType = [];
    obj={ TaxStatusID : null,TaxStatus : null,SalaryTypeID : null };
    displayForm = false;
    operation = "Add";
	title="Salary Tax Status";
	parent="Salary";
	
    constructor(protected http: HttpService) {
		this.loadItem = this.loadItem.bind(this);
	}
  
    ngOnInit() {
      this.http.get(salaryUrl.salarytaxstatus.list)
        .subscribe(res => {
		  this.data = res.data;
        }, err =>
        { console.log(err) });

        this.http.get(salaryUrl.salarytype.list)
        .subscribe(res => {
          this.SalaryType = res.data;
        }, err => { console.log(err); });
		
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
      let url = salaryUrl.salarytaxstatus.add;
      if(this.operation=="Update")
        url = salaryUrl.salarytaxstatus.update;
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
      this.obj = { TaxStatusID : null,TaxStatus : null,SalaryTypeID : null };
      this.hideForm();
      this.operation="Add";
    }
  }
