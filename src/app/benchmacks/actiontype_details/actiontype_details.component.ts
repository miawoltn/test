import { Component, OnInit, ViewChild} from '@angular/core';
import { HttpService } from 'src/app/services/http.service';
import { benchmacksUrl } from '../benchmacks-url';
import swal from 'sweetalert2';
@Component({
  selector: 'app-actiontype_details',
  templateUrl: './actiontype_details.component.html',
  styleUrls: ['./actiontype_details.component.scss']
})
export class ActiontypeDetailsComponent implements OnInit {
    
	data = [];
    obj={ actiontype_id : null,employee_type_id : null,confirmtypeID : null };
    displayForm = false;
    operation = "Add";
	title="Actiontype details";
	actiontypes = []; 
    constructor(protected http: HttpService) {
		this.loadItem = this.loadItem.bind(this);
	}
  
    ngOnInit() {
      this.http.get(benchmacksUrl.actiontype_details.list)
        .subscribe(success=>{
		  this.data = success.data;
        }, error=>
        {console.log(error);});
		this.http.get(benchmacksUrl.actiontypes.list)
        .subscribe(success=>{
          this.actiontypes = success.data;
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
      let url = benchmacksUrl.actiontype_details.add;
      if(this.operation=="Update"){
        url = benchmacksUrl.actiontype_details.update;
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
      this.obj = { actiontype_id : null,employee_type_id : null,confirmtypeID : null };
      this.hideForm();
      this.operation="Add";
    }
  }
