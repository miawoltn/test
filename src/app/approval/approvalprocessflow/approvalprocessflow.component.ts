
import { Component, OnInit, ViewChild} from '@angular/core';
import { HttpService } from 'src/app/services/http.service';
import { approvalUrl } from '../approval-url';
import swal from 'sweetalert2';
import { GenericService } from 'src/app/services/generic.service';
@Component({
  selector: 'app-approvalprocessflow',
  templateUrl: './approvalprocessflow.component.html',
  styleUrls: ['./approvalprocessflow.component.scss']
})
export class ApprovalprocessflowComponent implements OnInit {
    
	displayedColumns: string[] = ['SequenceNo','ApprovalProcessModuleID','ApprovalStagesID','StatusID'];
	data = [];
    obj={ SequenceNo : null,ApprovalProcessModuleID : null,ApprovalStagesID : null,StatusID : null };
    displayForm = false;
    operation = "Add";
	title="Approval Process Flow";
	parent="Approval";
  Status = [];
  ApprovalProcessModule = [];
  ApprovalStages = [];
	
  constructor(protected http: HttpService, protected generics: GenericService) {
		this.loadItem = this.loadItem.bind(this);
	}
  
    ngOnInit() {
      this.generics.getStatus()
        .subscribe(res => {
		  this.Status = res;
        }, err =>
        { console.log(err) });
        
      this.http.get(approvalUrl.approvalprocessflow.list)
        .subscribe(res => {
		  this.data = res.data;
        }, err =>
        { console.log(err) });

        this.http.get(approvalUrl.approvalprocessmodule.list)
        .subscribe(res => {
		  this.ApprovalProcessModule = res.data;
        }, err =>
        { console.log(err) });

        this.http.get(approvalUrl.approvalstages.list)
        .subscribe(res => {
		  this.ApprovalStages = res.data;
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
      let url = approvalUrl.approvalprocessflow.add;
      if(this.operation=="Update")
        url = approvalUrl.approvalprocessflow.update;
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
      this.obj = { SequenceNo : null,ApprovalProcessModuleID : null,ApprovalStagesID : null,StatusID : null };
      this.hideForm();
      this.operation="Add";
    }
  }
