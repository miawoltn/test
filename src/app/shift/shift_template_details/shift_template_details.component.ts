
import { Component, OnInit, ViewChild} from '@angular/core';
import { HttpService } from 'src/app/services/http.service';
import { shiftUrl } from '../shift-url';
import swal from 'sweetalert2';
@Component({
  selector: 'app-shift_template_details',
  templateUrl: './shift_template_details.component.html',
  styleUrls: ['./shift_template_details.component.scss']
})
export class Shift_template_detailsComponent implements OnInit {
    
	displayedColumns: string[] = ['shift_day_name','shift_template','shift_status','time_from','time_to'];
	data = [];
    obj={ shift_day_id : null,shift_template_id : null,shift_status_id : null,time_from : null,time_to : null };
    displayForm = false;
    operation = "Add";
	title="Shift Template Details";
	parent="Shift";
	shift_days = []; shift_status = []; shift_templates = []; 
    constructor(protected http: HttpService) {
		this.loadItem = this.loadItem.bind(this);
	}
  
    ngOnInit() {
      this.http.get(shiftUrl.shift_template_details.list)
        .subscribe(res => {
		  this.data = res.data;
        }, err =>
        { console.log(err) });
		this.http.get(shiftUrl.shift_days.list)
        .subscribe(res=>{
          this.shift_days = res.data;
        }, error =>
        { console.log(error) });
		this.http.get(shiftUrl.shift_status.list)
        .subscribe(res=>{
          this.shift_status = res.data;
        }, error =>
        { console.log(error) });
		this.http.get(shiftUrl.shift_templates.list)
        .subscribe(res=>{
          this.shift_templates = res.data;
        }, error =>
        { console.log(error) });
		
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
      let url = shiftUrl.shift_template_details.add;
      if(this.operation=="Update")
        url = shiftUrl.shift_template_details.update;
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
      this.obj = this.data.find(item => item.id == id.row.data.id);
      this.operation ="Update";
      this.showForm();
    }
  
    resetForm()
    {
      this.obj = { shift_day_id : null,shift_template_id : null,shift_status_id : null,time_from : null,time_to : null };
      this.hideForm();
      this.operation="Add";
    }
  }
