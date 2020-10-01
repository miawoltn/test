import { Component, OnInit, ViewChild} from '@angular/core';
import { HttpService } from 'src/app/services/http.service';
import { kpiUrl } from '../kpi-url';
import swal from 'sweetalert2';
@Component({
  selector: 'app-kpi',
  templateUrl: './kpi.component.html',
  styleUrls: ['./kpi.component.scss']
})
export class KpiComponent implements OnInit {
    
	data = [];
    obj={ kpitype_id : null,kpiclass_id : null,kpi_name : null,Kpi_desc : null,maxWeight : null,config_id : null,transID : null,kpi_general_id : null,kpi_criteria : null,systemsID : null,systemDetailsID : null,storycategory_id : null,targetvalue : null,EdStoryCategory_groupID : null };
    displayForm = false;
    operation = "Add";
	title="Kpi";
	kpi_type = []; kpiclass = []; kpiconfig = []; 
    constructor(protected http: HttpService) {
		this.loadItem = this.loadItem.bind(this);
	}
  
    ngOnInit() {
      this.http.get(kpiUrl.kpi.list)
        .subscribe(success=>{
		  this.data = success.data;
        }, error=>
        {console.log(error);});
		this.http.get(kpiUrl.kpi_type.list)
        .subscribe(success=>{
          this.kpi_type = success.data;
        }, error=>
        {console.log(error);});
		this.http.get(kpiUrl.kpiclass.list)
        .subscribe(success=>{
          this.kpiclass = success.data;
        }, error=>
        {console.log(error);});
		this.http.get(kpiUrl.kpiconfig.list)
        .subscribe(success=>{
          this.kpiconfig = success.data;
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
      let url = kpiUrl.kpi.add;
      if(this.operation=="Update"){
        url = kpiUrl.kpi.update;
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
      this.obj = { kpitype_id : null,kpiclass_id : null,kpi_name : null,Kpi_desc : null,maxWeight : null,config_id : null,transID : null,kpi_general_id : null,kpi_criteria : null,systemsID : null,systemDetailsID : null,storycategory_id : null,targetvalue : null,EdStoryCategory_groupID : null };
      this.hideForm();
      this.operation="Add";
    }
  }
