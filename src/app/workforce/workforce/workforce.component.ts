
import { Component, OnInit, ViewChild} from '@angular/core';
import { HttpService } from 'src/app/services/http.service';
import { workforceUrl } from '../workforce-url';
import swal from 'sweetalert2';
@Component({
  selector: 'app-workforce',
  templateUrl: './workforce.component.html',
  styleUrls: ['./workforce.component.scss']
})
export class WorkforceComponent implements OnInit {
    
	displayedColumns: string[] = ['WorkforceName'];
	data = [];
    obj={ WorkforceName : null };
    displayForm = false;
    operation = "Add";
	title="Work Force";
	parent="Work Force";
	
    constructor(protected http: HttpService) {
		this.loadItem = this.loadItem.bind(this);
	}
  
    ngOnInit() {
      this.http.get(workforceUrl.workforce.list)
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
      let url = workforceUrl.workforce.add;
      if(this.operation=="Update")
        url = workforceUrl.workforce.update;
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
      this.obj = this.data.find(item => item.id === id.row.data.id);
      this.operation ="Update";
      this.showForm();
    }
  
    resetForm()
    {
      this.obj = { WorkforceName : null };
      this.hideForm();
      this.operation="Add";
    }
  }
