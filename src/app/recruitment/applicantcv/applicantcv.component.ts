
import { Component, OnInit, ViewChild} from '@angular/core';
import { HttpService } from 'src/app/services/http.service';
import { recruitmentUrl } from '../recruitment-url';
import swal from 'sweetalert2';
@Component({
  selector: 'app-applicantcv',
  templateUrl: './applicantcv.component.html',
  styleUrls: ['./applicantcv.component.scss']
})
export class ApplicantcvComponent implements OnInit {
    
	displayedColumns: string[] = ['CV','FirsName'];
	data = [];
    obj={ CV : null,ApplicantID : null };
    displayForm = false;
    operation = "Add";
	title="Applicant CV";
	parent="Recruitment";
	applicants = []; 
    constructor(protected http: HttpService) {
		this.loadItem = this.loadItem.bind(this);
	}
  
    ngOnInit() {
      this.http.get(recruitmentUrl.applicantcv.list)
        .subscribe(res => {
		  this.data = res.data;
        }, err =>
        { console.log(err) });
		this.http.get(recruitmentUrl.applicants.list)
        .subscribe(res=>{
          this.applicants = res.data;
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
      let url = recruitmentUrl.applicantcv.add;
      if(this.operation=="Update")
        url = recruitmentUrl.applicantcv.update;
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
      this.obj = { CV : null,ApplicantID : null };
      this.hideForm();
      this.operation="Add";
    }
  }
