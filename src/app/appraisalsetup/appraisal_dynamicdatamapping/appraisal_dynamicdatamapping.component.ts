import { Component, OnInit, ViewChild} from '@angular/core';
import { HttpService } from 'src/app/services/http.service';
import { appraisalsetupUrl } from '../appraisalsetup-url';
import swal from 'sweetalert2';
@Component({
  selector: 'app-appraisal_dynamicdatamapping',
  templateUrl: './appraisal_dynamicdatamapping.component.html',
  styleUrls: ['./appraisal_dynamicdatamapping.component.scss']
})
export class AppraisalDynamicdatamappingComponent implements OnInit {
    
	data = [];
    obj={ DataId : null,SystemdetailsID : null,systemsID : null };
    displayForm = false;
    operation = "Add";
	title="Appraisal dynamicdatamapping";
	
    constructor(protected http: HttpService) {
		this.loadItem = this.loadItem.bind(this);
	}
  
    ngOnInit() {
      this.http.get(appraisalsetupUrl.appraisal_dynamicdatamapping.list)
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
      let url = appraisalsetupUrl.appraisal_dynamicdatamapping.add;
      if(this.operation=="Update"){
        url = appraisalsetupUrl.appraisal_dynamicdatamapping.update;
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
      this.obj = { DataId : null,SystemdetailsID : null,systemsID : null };
      this.hideForm();
      this.operation="Add";
    }
  }
