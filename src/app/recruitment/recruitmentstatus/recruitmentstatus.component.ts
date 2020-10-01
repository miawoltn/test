
import { Component, OnInit, ViewChild} from '@angular/core';
import { HttpService } from 'src/app/services/http.service';
import { recruitmentUrl } from '../recruitment-url';
import swal from 'sweetalert2';
@Component({
  selector: 'app-recruitmentstatus',
  templateUrl: './recruitmentstatus.component.html',
  styleUrls: ['./recruitmentstatus.component.scss']
})
export class RecruitmentstatusComponent implements OnInit {
    
	displayedColumns: string[] = ['RecruitmentStatus'];
	data = [];
    obj={ RecruitmentStatus : null };
    displayForm = false;
    operation = "Add";
	title="Recruitment Status";
	parent="Recruitment";
	
    constructor(protected http: HttpService) {
		this.loadItem = this.loadItem.bind(this);
	}
  
    ngOnInit() {
      this.http.get(recruitmentUrl.recruitmentstatus.list)
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
      let url = recruitmentUrl.recruitmentstatus.add;
      if(this.operation=="Update")
        url = recruitmentUrl.recruitmentstatus.update;
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
      this.obj = { RecruitmentStatus : null };
      this.hideForm();
      this.operation="Add";
    }
  }
