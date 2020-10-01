
import { Component, OnInit, ViewChild} from '@angular/core';
import { HttpService } from 'src/app/services/http.service';
import { propertyUrl } from '../property-url';
import swal from 'sweetalert2';
@Component({
  selector: 'app-propertyfloor',
  templateUrl: './propertyfloor.component.html',
  styleUrls: ['./propertyfloor.component.scss']
})
export class PropertyfloorComponent implements OnInit {
    
	displayedColumns: string[] = ['PropertyFloor'];
	data = [];
    obj={ PropertyFloor : null };
    displayForm = false;
    operation = "Add";
	title="Property Floor";
	parent="Property";
	
    constructor(protected http: HttpService) {
		this.loadItem = this.loadItem.bind(this);
	}
  
    ngOnInit() {
      this.http.get(propertyUrl.propertyfloor.list)
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
      let url = propertyUrl.propertyfloor.add;
      if(this.operation=="Update")
        url = propertyUrl.propertyfloor.update;
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
      this.obj = { PropertyFloor : null };
      this.hideForm();
      this.operation="Add";
    }
  }
