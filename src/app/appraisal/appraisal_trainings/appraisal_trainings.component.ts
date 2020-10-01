import { Component, OnInit, ViewChild} from '@angular/core';
import { HttpService } from 'src/app/services/http.service';
import { appraisalUrl } from '../appraisal-url';
import swal from 'sweetalert2';
@Component({
  selector: 'app-appraisal_trainings',
  templateUrl: './appraisal_trainings.component.html',
  styleUrls: ['./appraisal_trainings.component.scss']
})
export class AppraisalTrainingsComponent implements OnInit {
    
	data = [];
    obj={ title : null,goal : null,measureOfSuccess : null,hod_comment : null,appraisal_id : null };
    displayForm = false;
    operation = "Add";
	title="Appraisal Trainings";
	appraisalheader = []; 
    constructor(protected http: HttpService) {
		this.loadItem = this.loadItem.bind(this);
	}
  
    ngOnInit() {
      this.http.get(appraisalUrl.appraisal_trainings.list)
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
      let url = appraisalUrl.appraisal_trainings.add;
      if(this.operation=="Update"){
        url = appraisalUrl.appraisal_trainings.update;
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
      this.obj = { title : null,goal : null,measureOfSuccess : null,hod_comment : null,appraisal_id : null };
      this.hideForm();
      this.operation="Add";
    }
  }
