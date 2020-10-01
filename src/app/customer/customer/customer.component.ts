
import { Component, OnInit, ViewChild} from '@angular/core';
import { HttpService } from 'src/app/services/http.service';
import { customerUrl } from '../customer-url';
import swal from 'sweetalert2';
@Component({
  selector: 'app-customer',
  templateUrl: './customer.component.html',
  styleUrls: ['./customer.component.scss']
})
export class CustomerComponent implements OnInit {
    
	displayedColumns: string[] = ['CustomerType','CustomerName','CustomerRM','CustomerPhoneNo','CustomerEmail','CustomerAddress'];
	data = [];
    obj={ CustomerTypeID : null,CustomerName : null,CustomerRM : null,CustomerPhoneNo : null,CustomerEmail : null,CustomerAddress : null };
    displayForm = false;
    operation = "Add";
	title="Customer";
	parent="Customer";
	customertype = []; 
    constructor(protected http: HttpService) {
		this.loadItem = this.loadItem.bind(this);
	}
  
    ngOnInit() {
      this.http.get(customerUrl.customer.list)
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
      let url = customerUrl.customer.add;
      if(this.operation=="Update")
        url = customerUrl.customer.update;
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
      this.obj = { CustomerTypeID : null,CustomerName : null,CustomerRM : null,CustomerPhoneNo : null,CustomerEmail : null,CustomerAddress : null };
      this.hideForm();
      this.operation="Add";
    }
  }
