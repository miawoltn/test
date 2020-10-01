
import { Component, OnInit, ViewChild} from '@angular/core';
import { HttpService } from 'src/app/services/http.service';
import { salaryUrl } from '../salary-url';
import swal from 'sweetalert2';
import { educationUrl } from 'src/app/education/education-url';
import { payrollUrl } from 'src/app/payroll/payroll-url';
import { GenericService } from 'src/app/services/generic.service';
@Component({
  selector: 'app-salaryformulae',
  templateUrl: './salaryformulae.component.html',
  styleUrls: ['./salaryformulae.component.scss']
})
export class SalaryformulaeComponent implements OnInit {
    
	displayedColumns: string[] = ['GradeLevelID','PayrollCategoryID','SalaryComponentID','Percentage','TaxStatusID','StatusID','SalaryTaxStatusID'];
	data = [];
    obj={ GradeLevelID : null,PayrollCategoryID : null,SalaryComponentID : null,Percentage : null,TaxStatusID : null,StatusID : null,SalaryTaxStatusID : null };
    displayForm = false;
    operation = "Add";
	title="Salary Formulae";
  parent="Salary";
  GradeLevel = "";
  PayrollCategory = "";
  SalaryComponent = "";
  TaxStatus= "";
  Status = [];
	
    constructor(protected http: HttpService, protected generics: GenericService) {
		this.loadItem = this.loadItem.bind(this);
	}
  
    ngOnInit() {
      this.generics.getStatus()
        .subscribe(res => {
		  this.Status = res;
        }, err =>
        { console.log(err) });

      this.http.get(salaryUrl.salaryformulae.list)
        .subscribe(res => {
		  this.data = res.data;
        }, err =>
        { console.log(err) });

        this.http.get(educationUrl.gradelevels.list)
        .subscribe(res => {
          this.GradeLevel = res.data;
        }, err => { console.log(err); });

        this.http.get(payrollUrl.payrollcategory.list)
        .subscribe(res => {
          this.PayrollCategory = res.data;
        }, err => { console.log(err); });

        this.http.get(salaryUrl.salarycomponents.list)
        .subscribe(res => {
          this.SalaryComponent = res.data;
        }, err => { console.log(err); });

        this.http.get(salaryUrl.salarytaxstatus.list)
        .subscribe(res => {
          this.TaxStatus = res.data;
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
      let url = salaryUrl.salaryformulae.add;
      if(this.operation=="Update")
        url = salaryUrl.salaryformulae.update;
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
      this.obj = { GradeLevelID : null,PayrollCategoryID : null,SalaryComponentID : null,Percentage : null,TaxStatusID : null,StatusID : null,SalaryTaxStatusID : null };
      this.hideForm();
      this.operation="Add";
    }
  }
