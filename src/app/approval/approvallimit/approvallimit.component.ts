
import { Component, OnInit, ViewChild} from '@angular/core';
import { HttpService } from 'src/app/services/http.service';
import { approvalUrl } from '../approval-url';
import swal from 'sweetalert2';
import { companyUrl } from 'src/app/company/company-url';
@Component({
  selector: 'app-approvallimit',
  templateUrl: './approvallimit.component.html',
  styleUrls: ['./approvallimit.component.scss']
})
export class ApprovallimitComponent implements OnInit {
    
	displayedColumns: string[] = ['Amount','DesignationID'];
	data = [];
    obj={ Amount : null,DesignationID : null };
    displayForm = false;
    operation = "Add";
	title="Approval Limit";
  parent="Approval";
  Designation = [];
	
    constructor(protected http: HttpService) {
		this.loadItem = this.loadItem.bind(this);
	}
  
    ngOnInit() {
      this.http.get(approvalUrl.approvallimit.list)
        .subscribe(res => {
		  this.data = res.data;
        }, err =>
        { console.log(err) });

        this.http.get(companyUrl.designations.list)
        .subscribe(res => {
		  this.Designation = res.data;
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
      let url = approvalUrl.approvallimit.add;
      if(this.operation=="Update")
        url = approvalUrl.approvallimit.update;
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
      this.obj = { Amount : null,DesignationID : null };
      this.hideForm();
      this.operation="Add";
    }
  }
