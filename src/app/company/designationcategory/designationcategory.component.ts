
import { Component, OnInit, ViewChild} from '@angular/core';
import { HttpService } from 'src/app/services/http.service';
import { companyUrl } from '../company-url';
import swal from 'sweetalert2';
import { approvalUrl } from 'src/app/approval/approval-url';
@Component({
  selector: 'app-designationcategory',
  templateUrl: './designationcategory.component.html',
  styleUrls: ['./designationcategory.component.scss']
})
export class DesignationcategoryComponent implements OnInit {
    
	displayedColumns: string[] = ['DesignationCategory','ApprovalStageID'];
	data = [];
    obj={ DesignationCategory : null,ApprovalStageID : null };
    displayForm = false;
    operation = "Add";
	title="Designation Category";
  parent="Company";
  ApprovalStage = [];
	
    constructor(protected http: HttpService) {
		this.loadItem = this.loadItem.bind(this);
	}
  
    ngOnInit() {
      this.http.get(companyUrl.designationcategory.list)
        .subscribe(res => {
		  this.data = res.data;
        }, err =>
        { console.log(err) });

        this.http.get(approvalUrl.approvalstages.list)
      .subscribe(res => {
        this.ApprovalStage = res.data;
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
      let url = companyUrl.designationcategory.add;
      if(this.operation=="Update")
        url = companyUrl.designationcategory.update;
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
      this.obj = { DesignationCategory : null,ApprovalStageID : null };
      this.hideForm();
      this.operation="Add";
    }
  }
