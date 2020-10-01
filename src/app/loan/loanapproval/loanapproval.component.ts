
import { Component, OnInit, ViewChild} from '@angular/core';
import { HttpService } from 'src/app/services/http.service';
import { loanUrl } from '../loan-url';
import swal from 'sweetalert2';
@Component({
  selector: 'app-loanapproval',
  templateUrl: './loanapproval.component.html',
  styleUrls: ['./loanapproval.component.scss']
})
export class LoanapprovalComponent implements OnInit {
    
	displayedColumns: string[] = ['LoanID','LoanApprovalID','ApprovedBy','Comment','NextApprovingOfficerID','ProcessModuleID','ApprovalInstancesID'];
	data = [];
    obj={ LoanID : null,LoanApprovalID : null,ApprovedBy : null,Comment : null,NextApprovingOfficerID : null,ProcessModuleID : null,ApprovalInstancesID : null };
    displayForm = false;
    operation = "Add";
	title="Loan Approval";
	parent="Loan";
	
    constructor(protected http: HttpService) {
		this.loadItem = this.loadItem.bind(this);
	}
  
    ngOnInit() {
      this.http.get(loanUrl.loanapproval.list)
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
      let url = loanUrl.loanapproval.add;
      if(this.operation=="Update")
        url = loanUrl.loanapproval.update;
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
      this.obj = { LoanID : null,LoanApprovalID : null,ApprovedBy : null,Comment : null,NextApprovingOfficerID : null,ProcessModuleID : null,ApprovalInstancesID : null };
      this.hideForm();
      this.operation="Add";
    }
  }
