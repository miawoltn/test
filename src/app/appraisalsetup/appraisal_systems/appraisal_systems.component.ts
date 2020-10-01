import { Component, OnInit, ViewChild} from '@angular/core';
import { HttpService } from 'src/app/services/http.service';
import { appraisalsetupUrl } from '../appraisalsetup-url';
import { kpiUrl } from 'src/app/kpi/kpi-url';
import swal from 'sweetalert2';
@Component({
  selector: 'app-appraisal_systems',
  templateUrl: './appraisal_systems.component.html',
  styleUrls: ['./appraisal_systems.component.scss']
})
export class AppraisalSystemsComponent implements OnInit {
    
	data = [];
    obj={ systemname : null,measurements : null,activeID : null,kpitype_id : null };
    displayForm = false;
    operation = "Add";
	title="Appraisal systems";
	kpi_type = []; 
    constructor(protected http: HttpService) {
		this.loadItem = this.loadItem.bind(this);
	}
  
    ngOnInit() {
      this.http.get(appraisalsetupUrl.appraisal_systems.list)
        .subscribe(success=>{
		  this.data = success.data;
        }, error=>
        {console.log(error);});
		this.http.get(kpiUrl.kpi_type.list)
        .subscribe(success=>{
          this.kpi_type = success.data;
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
      let url = appraisalsetupUrl.appraisal_systems.add;
      if(this.operation=="Update"){
        url = appraisalsetupUrl.appraisal_systems.update;
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
      this.obj = { systemname : null,measurements : null,activeID : null,kpitype_id : null };
      this.hideForm();
      this.operation="Add";
    }
  }
