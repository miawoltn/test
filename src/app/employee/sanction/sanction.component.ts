
import { Component, OnInit, ViewChild} from '@angular/core';
import { HttpService } from 'src/app/services/http.service';
import { employeeUrl } from '../employee-url';
import swal from 'sweetalert2';
@Component({
  selector: 'app-sanction',
  templateUrl: './sanction.component.html',
  styleUrls: ['./sanction.component.scss']
})
export class SanctionComponent implements OnInit {
    
	displayedColumns: string[] = ['Sanction','Offence','OffenceSanction'];
	data = [];
    obj={ Sanction : null,OffenceID : null,OffenceSanction : null };
    displayForm = false;
    operation = "Add";
	title="Sanction";
	parent="employee";
	offence = []; 
    constructor(protected http: HttpService) {
		this.loadItem = this.loadItem.bind(this);
	}
  
    ngOnInit() {
      this.http.get(employeeUrl.sanction.list)
        .subscribe(res => {
		  this.data = res.data;
        }, err =>
        { console.log(err) });
		this.http.get(employeeUrl.offence.list)
        .subscribe(res => {
          this.offence = res.data;
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
      let url = employeeUrl.sanction.add;
      if(this.operation=="Update")
        url = employeeUrl.sanction.update;
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
      this.obj = { Sanction : null,OffenceID : null,OffenceSanction : null };
      this.hideForm();
      this.operation="Add";
    }
  }
