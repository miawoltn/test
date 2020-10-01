
import { Component, OnInit, ViewChild} from '@angular/core';
import { HttpService } from 'src/app/services/http.service';
import { projectUrl } from '../project-url';
import swal from 'sweetalert2';
@Component({
  selector: 'app-projectcategory',
  templateUrl: './projectcategory.component.html',
  styleUrls: ['./projectcategory.component.scss']
})
export class ProjectcategoryComponent implements OnInit { 
    
	displayedColumns: string[] = ['ProjectCategory','Attribute2'];
	data = [];
    obj={ ProjectCategory : null,Attribute2 : null };
    displayForm = false;
    operation = "Add";
	title="Project Category";
	parent="Project";
	
    constructor(protected http: HttpService) {
		this.loadItem = this.loadItem.bind(this);
	}
  
    ngOnInit() {
      this.http.get(projectUrl.projectcategory.list)
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
      let url = projectUrl.projectcategory.add;
      if(this.operation=="Update")
        url = projectUrl.projectcategory.update;
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
      this.obj = { ProjectCategory : null,Attribute2 : null };
      this.hideForm();
      this.operation="Add";
    }
  }
