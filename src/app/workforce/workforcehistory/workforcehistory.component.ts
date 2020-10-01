
import { Component, OnInit, ViewChild} from '@angular/core';
import { HttpService } from 'src/app/services/http.service';
import { workforceUrl } from '../workforce-url';
import swal from 'sweetalert2';
@Component({
  selector: 'app-workforcehistory',
  templateUrl: './workforcehistory.component.html',
  styleUrls: ['./workforcehistory.component.scss']
})
export class WorkforcehistoryComponent implements OnInit {
    
	displayedColumns: string[] = ['EffectiveDate','Comments','EmployeeID','WorkforceOptionID','OldGradeLevelID','NewGradeLevelID'];
	data = [];
    obj={ EffectiveDate : null,Comments : null,EmployeeID : null,WorkforceOptionID : null,OldGradeLevelID : null,NewGradeLevelID : null };
    displayForm = false;
    operation = "Add";
	title="Work Force History";
	parent="Work Force";
	
    constructor(protected http: HttpService) {
		this.loadItem = this.loadItem.bind(this);
	}
  
    ngOnInit() {
      this.http.get(workforceUrl.workforcehistory.list)
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
      let url = workforceUrl.workforcehistory.add;
      if(this.operation=="Update")
        url = workforceUrl.workforcehistory.update;
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
      this.obj = { EffectiveDate : null,Comments : null,EmployeeID : null,WorkforceOptionID : null,OldGradeLevelID : null,NewGradeLevelID : null };
      this.hideForm();
      this.operation="Add";
    }
  }
