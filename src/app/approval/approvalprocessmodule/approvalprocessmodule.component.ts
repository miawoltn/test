
import { Component, OnInit, ViewChild} from '@angular/core';
import { HttpService } from 'src/app/services/http.service';
import { approvalUrl } from '../approval-url';
import swal from 'sweetalert2';
@Component({
  selector: 'app-approvalprocessmodule',
  templateUrl: './approvalprocessmodule.component.html',
  styleUrls: ['./approvalprocessmodule.component.scss']
})
export class ApprovalprocessmoduleComponent implements OnInit {
    
	displayedColumns: string[] = ['ApprovalProcessModule','MaxApprovalCount'];
	data = [];
    obj={ ApprovalProcessModule : null,MaxApprovalCount : null };
    displayForm = false;
    operation = "Add";
	title="Approval Process Module";
	parent="Approval";
	
    constructor(protected http: HttpService) {
		this.loadItem = this.loadItem.bind(this);
	}
  
    ngOnInit() {
      this.http.get(approvalUrl.approvalprocessmodule.list)
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
      let url = approvalUrl.approvalprocessmodule.add;
      if(this.operation=="Update")
        url = approvalUrl.approvalprocessmodule.update;
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
      this.obj = { ApprovalProcessModule : null,MaxApprovalCount : null };
      this.hideForm();
      this.operation="Add";
    }
  }
