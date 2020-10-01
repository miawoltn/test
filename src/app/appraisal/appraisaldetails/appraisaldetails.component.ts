import { Component, OnInit, ViewChild} from '@angular/core';
import { HttpService } from 'src/app/services/http.service';
import { appraisalUrl } from '../appraisal-url';
import { kpiUrl } from 'src/app/kpi/kpi-url';
import swal from 'sweetalert2';
@Component({
  selector: 'app-appraisaldetails',
  templateUrl: './appraisaldetails.component.html',
  styleUrls: ['./appraisaldetails.component.scss']
})
export class AppraisaldetailsComponent implements OnInit {
    
	data = [];
    obj={ appraisal_id : null,kpi_id : null,comments : null,kpitype_id : null,score : null,selfscore : null,appraiser_comments : null,last_modified_date : null,last_modified_by : null,is_systemgenerated : null };
    displayForm = false;
    operation = "Add";
	title="Appraisaldetails";
	appraisalheader = []; kpi = []; 
    constructor(protected http: HttpService) {
		this.loadItem = this.loadItem.bind(this);
	}
  
    ngOnInit() {
      this.http.get(appraisalUrl.appraisaldetails.list)
        .subscribe(success=>{
		  this.data = success.data;
        }, error=>
        {console.log(error);});
		this.http.get(appraisalUrl.appraisalheader.list)
        .subscribe(success=>{
          this.appraisalheader = success.data;
        }, error=>
        {console.log(error);});
		this.http.get(kpiUrl.kpi.list)
        .subscribe(success=>{
          this.kpi = success.data;
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
      let url = appraisalUrl.appraisaldetails.add;
      if(this.operation=="Update"){
        url = appraisalUrl.appraisaldetails.update;
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
      this.obj = { appraisal_id : null,kpi_id : null,comments : null,kpitype_id : null,score : null,selfscore : null,appraiser_comments : null,last_modified_date : null,last_modified_by : null,is_systemgenerated : null };
      this.hideForm();
      this.operation="Add";
    }
  }
