
import { Component, OnInit, ViewChild} from '@angular/core';
import { HttpService } from 'src/app/services/http.service';
import { shiftUrl } from '../shift-url';
import swal from 'sweetalert2';
@Component({
  selector: 'app-shift_types',
  templateUrl: './shift_types.component.html',
  styleUrls: ['./shift_types.component.scss']
})
export class Shift_typesComponent implements OnInit {
    
	displayedColumns: string[] = ['shift_type'];
	data = [];
    obj={ shift_type : null };
    displayForm = false;
    operation = "Add";
	title="Shift Types";
	parent="Shift";
	
    constructor(protected http: HttpService) {
		this.loadItem = this.loadItem.bind(this);
	}
  
    ngOnInit() {
      this.http.get(shiftUrl.shift_types.list)
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
      let url = shiftUrl.shift_types.add;
      if(this.operation=="Update")
        url = shiftUrl.shift_types.update;
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
      this.obj = { shift_type : null };
      this.hideForm();
      this.operation="Add";
    }
  }
