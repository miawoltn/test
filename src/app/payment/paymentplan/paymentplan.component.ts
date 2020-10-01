
import { Component, OnInit, ViewChild} from '@angular/core';
import { HttpService } from 'src/app/services/http.service';
import { paymentUrl } from '../payment-url';
import { projectUrl } from 'src/app/project/project-url';
import swal from 'sweetalert2';
@Component({
  selector: 'app-paymentplan',
  templateUrl: './paymentplan.component.html',
  styleUrls: ['./paymentplan.component.scss']
})
export class PaymentplanComponent implements OnInit {
    
	displayedColumns: string[] = ['CustomerID','Tranche','PaymentAmount','PaymentMethod'];
	data = [];
    obj={ ProjectID : null,PaymentTrancheID : null,PaymentAmount : null,PaymentMethod : null };
    displayForm = false;
    operation = "Add";
	title="Payment Plan";
	parent="Payment";
	paymenttranche = []; project = []; 
    constructor(protected http: HttpService) {
		this.loadItem = this.loadItem.bind(this);
	}
  
    ngOnInit() {
      this.http.get(paymentUrl.paymentplan.list)
        .subscribe(res => {
		  this.data = res.data;
        }, err =>
        { console.log(err) });
		this.http.get(paymentUrl.paymenttranche.list)
        .subscribe(res => {
          this.paymenttranche = res.data;
        }, error =>
        { console.log(error) });
		this.http.get(projectUrl.project.list)
        .subscribe(res => {
          this.project = res.data;
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
      let url = paymentUrl.paymentplan.add;
      if(this.operation=="Update")
        url = paymentUrl.paymentplan.update;
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
      this.obj = { ProjectID : null,PaymentTrancheID : null,PaymentAmount : null,PaymentMethod : null };
      this.hideForm();
      this.operation="Add";
    }
  }
