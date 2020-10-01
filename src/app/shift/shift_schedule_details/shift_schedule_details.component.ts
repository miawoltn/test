
import { Component, OnInit, ViewChild} from '@angular/core';
import { HttpService } from 'src/app/services/http.service';
import { shiftUrl } from '../shift-url';
import swal from 'sweetalert2';
@Component({
  selector: 'app-shift_schedule_details',
  templateUrl: './shift_schedule_details.component.html',
  styleUrls: ['./shift_schedule_details.component.scss']
})
export class Shift_schedule_detailsComponent implements OnInit {
    
	displayedColumns: string[] = ['EmployeeID','shift_date','shift_status','shift_name','shift_template_id','isAbsent','isLeave','isLate','isCloseEarly','isPunctual','shift_template','smsSent','smsresponse','smsSentdate','isTour'];
	data = [];
    obj={ EmployeeID : null,shift_date : null,shift_status_id : null,shift_id : null,shift_schedule_id : null,isAbsent : null,isLeave : null,isLate : null,isCloseEarly : null,isPunctual : null,shift_template_id : null,smsSent : null,smsresponse : null,smsSentdate : null,isTour : null };
    displayForm = false;
    operation = "Add";
	title="Shift Schedule Details";
	parent=" Shift";
	shift_schedules = []; shift_status = []; shift_templates = []; shifts = []; 
    constructor(protected http: HttpService) {
		this.loadItem = this.loadItem.bind(this);
	}
  
    ngOnInit() {
      this.http.get(shiftUrl.shift_schedule_details.list)
        .subscribe(res => {
		  this.data = res.data;
        }, err =>
        { console.log(err) });
		this.http.get(shiftUrl.shift_schedules.list)
        .subscribe(res=>{
          this.shift_schedules = res.data;
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
		this.http.get(shiftUrl.shifts.list)
        .subscribe(res=>{
          this.shifts = res.data;
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
      let url = shiftUrl.shift_schedule_details.add;
      if(this.operation=="Update")
        url = shiftUrl.shift_schedule_details.update;
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
          swal.fire("Process Unresful", err.error.message,'error');
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
      this.obj = { EmployeeID : null,shift_date : null,shift_status_id : null,shift_id : null,shift_schedule_id : null,isAbsent : null,isLeave : null,isLate : null,isCloseEarly : null,isPunctual : null,shift_template_id : null,smsSent : null,smsresponse : null,smsSentdate : null,isTour : null };
      this.hideForm();
      this.operation="Add";
    }
  }
