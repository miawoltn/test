
import { Component, OnInit, ViewChild} from '@angular/core';
import { HttpService } from 'src/app/services/http.service';
import { customerUrl } from '../customer-url';
import swal from 'sweetalert2';
@Component({
  selector: 'app-customersubtype',
  templateUrl: './customersubtype.component.html',
  styleUrls: ['./customersubtype.component.scss']
})
export class CustomersubtypeComponent implements OnInit {
    
	displayedColumns: string[] = ['CustomerType','CustomerSubType'];
	data = [];
    obj={ CustomerTypeID : null,CustomerSubType : null };
    displayForm = false;
    operation = "Add";
	title="Customer Sub-Type";
	parent="Customer";
	customertype = []; 
    constructor(protected http: HttpService) {
		this.loadItem = this.loadItem.bind(this);
	}
  
    ngOnInit() {
      this.http.get(customerUrl.customersubtype.list)
        .subscribe(res => {
		  this.data = res.data;
        }, err =>
        { console.log(err) });
		this.http.get(customerUrl.customertype.list)
        .subscribe(res => {
          this.customertype = res.data;
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
      let url = customerUrl.customersubtype.add;
      if(this.operation=="Update")
        url = customerUrl.customersubtype.update;
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
      this.obj = { CustomerTypeID : null,CustomerSubType : null };
      this.hideForm();
      this.operation="Add";
    }
  }
