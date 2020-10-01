import { Component, OnInit, ViewChild} from '@angular/core';
import { HttpService } from 'src/app/services/http.service';
import { appraisalsetupUrl } from '../appraisalsetup-url';
import swal from 'sweetalert2';
@Component({
  selector: 'app-appraisal_systemdetails',
  templateUrl: './appraisal_systemdetails.component.html',
  styleUrls: ['./appraisal_systemdetails.component.scss']
})
export class AppraisalSystemdetailsComponent implements OnInit {
    
	data = [];
    obj={ maxweight : null,work_id : null,IDColumn : null,systemcategoryID : null,system_typeID : null,systemsID : null };
    displayForm = false;
    operation = "Add";
	title="Appraisal systemdetails";
	appraisal_systemcategory = []; appraisal_systems = []; appraisal_systemtypes = []; 
    constructor(protected http: HttpService) {
		this.loadItem = this.loadItem.bind(this);
	}
  
    ngOnInit() {
      this.http.get(appraisalsetupUrl.appraisal_systemdetails.list)
        .subscribe(success=>{
		  this.data = success.data;
        }, error=>
        {console.log(error);});
		this.http.get(appraisalsetupUrl.appraisal_systemcategory.list)
        .subscribe(success=>{
          this.appraisal_systemcategory = success.data;
        }, error=>
        {console.log(error);});
		this.http.get(appraisalsetupUrl.appraisal_systems.list)
        .subscribe(success=>{
          this.appraisal_systems = success.data;
        }, error=>
        {console.log(error);});
		this.http.get(appraisalsetupUrl.appraisal_systemtypes.list)
        .subscribe(success=>{
          this.appraisal_systemtypes = success.data;
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
      let url = appraisalsetupUrl.appraisal_systemdetails.add;
      if(this.operation=="Update"){
        url = appraisalsetupUrl.appraisal_systemdetails.update;
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
      this.obj = { maxweight : null,work_id : null,IDColumn : null,systemcategoryID : null,system_typeID : null,systemsID : null };
      this.hideForm();
      this.operation="Add";
    }
  }
