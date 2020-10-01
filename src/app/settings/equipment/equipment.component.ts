
import { Component, OnInit, ViewChild} from '@angular/core';
import { HttpService } from 'src/app/services/http.service';
import { settingsUrl } from '../settings-url';
import swal from 'sweetalert2';
@Component({
  selector: 'app-equipment',
  templateUrl: './equipment.component.html',
  styleUrls: ['./equipment.component.scss']
})
export class EquipmentComponent implements OnInit {
    
	displayedColumns: string[] = ['Equipment'];
	data = [];
    obj={ Equipment : null };
    displayForm = false;
    operation = "Add";
	title="Equipment";
	parent="settings";
	
    constructor(protected http: HttpService) {
		this.loadItem = this.loadItem.bind(this);
	}
  
    ngOnInit() {
      this.http.get(settingsUrl.equipment.list)
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
      let url = settingsUrl.equipment.add;
      if(this.operation=="Update")
        url = settingsUrl.equipment.update;
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
      this.obj = { Equipment : null };
      this.hideForm();
      this.operation="Add";
    }
  }
