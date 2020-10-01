import { Component, OnInit, ViewChild} from '@angular/core';
import { HttpService } from 'src/app/services/http.service';
import { appraisalsetupUrl } from '../appraisalsetup-url';
import swal from 'sweetalert2';
@Component({
  selector: 'app-appraisalchangeapprovalstage',
  templateUrl: './appraisalchangeapprovalstage.component.html',
  styleUrls: ['./appraisalchangeapprovalstage.component.scss']
})
export class AppraisalchangeapprovalstageComponent implements OnInit {
    
	data = [];
    obj={ appraisal_id : null,dateChange : null,oldSupervisor : null,newSupervisor : null,ApprovalstageId : null,posted_by : null,comment : null,movedToHR : null,AppraisalApproveId : null };
    displayForm = false;
    operation = "Add";
	title="Appraisalchangeapprovalstage";
	
    constructor(protected http: HttpService) {
		this.loadItem = this.loadItem.bind(this);
	}
  
    ngOnInit() {
      this.http.get(appraisalsetupUrl.appraisalchangeapprovalstage.list)
        .subscribe(success=>{
		  this.data = success.data;
        }, error=>
        {console.log(error);});
		
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
      let url = appraisalsetupUrl.appraisalchangeapprovalstage.add;
      if(this.operation=="Update"){
        url = appraisalsetupUrl.appraisalchangeapprovalstage.update;
		this.save(url);
	  }
	  else
		this.add(url);
	  //e.preventDefault();
    }
  
    save(url)
    {
      this.http.put(url,this.obj)
        .subscribe(success=>{
          this.data= success.data;
          swal.fire("Process Complete", success.message,'success');
          this.resetForm();
        }, error=>
        {
          console.log(error);
          swal.fire("Process Unsuccessful", error.error.message,'error');
        });
    }
	add(url)
    {
      this.http.post(url,this.obj)
        .subscribe(success=>{
          this.data= success.data;
          swal.fire("Process Complete", success.message,'success');
          this.resetForm();
        }, error=>
        {
          console.log(error);
          swal.fire("Process Unsuccessful", error.error.message,'error');
        });
    }
  
    loadItem(id)
    {
      this.obj = this.data.find(item => item.id == id.row.data.id);
      this.operation ="Update";
      this.showForm();
    }
  
    resetForm()
    {
      this.obj = { appraisal_id : null,dateChange : null,oldSupervisor : null,newSupervisor : null,ApprovalstageId : null,posted_by : null,comment : null,movedToHR : null,AppraisalApproveId : null };
      this.hideForm();
      this.operation="Add";
    }
  }
