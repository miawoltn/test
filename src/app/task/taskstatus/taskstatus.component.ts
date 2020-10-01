
import { Component, OnInit, ViewChild} from '@angular/core';
import { HttpService } from 'src/app/services/http.service';
import { taskUrl } from '../task-url';
import swal from 'sweetalert2';
@Component({
  selector: 'app-taskstatus',
  templateUrl: './taskstatus.component.html',
  styleUrls: ['./taskstatus.component.scss']
})
export class TaskstatusComponent implements OnInit {
    
	displayedColumns: string[] = ['TaskStatus'];
	data = [];
    obj={ TaskStatus : null };
    displayForm = false;
    operation = "Add";
	title="Task Status";
	parent="Task";
	
    constructor(protected http: HttpService) {
		this.loadItem = this.loadItem.bind(this);
	}
  
    ngOnInit() {
      this.http.get(taskUrl.taskstatus.list)
        .subscribe(res => {
		  this.data = res.data;
        }, err =>
        { console.log(err) });
		
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
      let url = taskUrl.taskstatus.add;
      if(this.operation=="Update")
        url = taskUrl.taskstatus.update;
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
      this.obj = { TaskStatus : null };
      this.hideForm();
      this.operation="Add";
    }
  }
