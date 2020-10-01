
import { Component, OnInit, ViewChild} from '@angular/core';
import { HttpService } from 'src/app/services/http.service';
import { propertyUrl } from '../property-url';
import swal from 'sweetalert2';
@Component({
  selector: 'app-propertygroup',
  templateUrl: './propertygroup.component.html',
  styleUrls: ['./propertygroup.component.scss']
})
export class PropertygroupComponent implements OnInit {
    
	displayedColumns: string[] = ['PropertyGroup','CountryID','StateID','LgaID','CityID','StatusID','PhysicalAddress'];
	data = [];
    obj={ PropertyGroup : null,CountryID : null,StateID : null,LgaID : null,CityID : null,StatusID : null,PhysicalAddress : null };
    displayForm = false;
    operation = "Add";
	title="Property Group";
	parent="Property";
	
    constructor(protected http: HttpService) {
		this.loadItem = this.loadItem.bind(this);
	}
  
    ngOnInit() {
      this.http.get(propertyUrl.propertygroup.list)
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
      let url = propertyUrl.propertygroup.add;
      if(this.operation=="Update")
        url = propertyUrl.propertygroup.update;
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
      this.obj = { PropertyGroup : null,CountryID : null,StateID : null,LgaID : null,CityID : null,StatusID : null,PhysicalAddress : null };
      this.hideForm();
      this.operation="Add";
    }
  }
