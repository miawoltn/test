
import { Component, OnInit, ViewChild} from '@angular/core';
import { HttpService } from 'src/app/services/http.service';
import { paymentUrl } from '../payment-url';
import swal from 'sweetalert2';
@Component({
  selector: 'app-paymenttype',
  templateUrl: './paymenttype.component.html',
  styleUrls: ['./paymenttype.component.scss']
})
export class PaymenttypeComponent implements OnInit {
    
	displayedColumns: string[] = ['PaymentType'];
	data = [];
    obj={ PaymentType : null };
    displayForm = false;
    operation = "Add";
	title="Payment Type";
	parent="Payment";
	
    constructor(protected http: HttpService) {
		this.loadItem = this.loadItem.bind(this);
	}
  
    ngOnInit() {
      this.http.get(paymentUrl.paymenttype.list)
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
      let url = paymentUrl.paymenttype.add;
      if(this.operation=="Update")
        url = paymentUrl.paymenttype.update;
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
      this.obj = { PaymentType : null };
      this.hideForm();
      this.operation="Add";
    }
  }
