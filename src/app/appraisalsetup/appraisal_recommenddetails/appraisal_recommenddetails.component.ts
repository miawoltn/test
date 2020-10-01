import { Component, OnInit, ViewChild} from '@angular/core';
import { HttpService } from 'src/app/services/http.service';
import { appraisalsetupUrl } from '../appraisalsetup-url';
import { appraisalUrl } from 'src/app/appraisal/appraisal-url';
import swal from 'sweetalert2';
@Component({
  selector: 'app-appraisal_recommenddetails',
  templateUrl: './appraisal_recommenddetails.component.html',
  styleUrls: ['./appraisal_recommenddetails.component.scss']
})
export class AppraisalRecommenddetailsComponent implements OnInit {
    
	data = [];
    obj={ appraisal_id : null,optionID : null,action_id : null };
    displayForm = false;
    operation = "Add";
	title="Appraisal recommenddetails";
	appraisalheader = []; 
    constructor(protected http: HttpService) {
		this.loadItem = this.loadItem.bind(this);
	}
  
    ngOnInit() {
      this.http.get(appraisalsetupUrl.appraisal_recommenddetails.list)
        .subscribe(success=>{
		  this.data = success.data;
        }, error=>
        {console.log(error);});
		this.http.get(appraisalUrl.appraisalheader.list)
        .subscribe(success=>{
          this.appraisalheader = success.data;
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
      let url = appraisalsetupUrl.appraisal_recommenddetails.add;
      if(this.operation=="Update"){
        url = appraisalsetupUrl.appraisal_recommenddetails.update;
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
      this.obj = { appraisal_id : null,optionID : null,action_id : null };
      this.hideForm();
      this.operation="Add";
    }
  }
