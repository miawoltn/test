
import { Component, OnInit, ViewChild} from '@angular/core';
import { HttpService } from 'src/app/services/http.service';
import { accountUrl } from '../account-url';
import swal from 'sweetalert2';
@Component({
  selector: 'app-accounttype',
  templateUrl: './accounttype.component.html',
  styleUrls: ['./accounttype.component.scss']
})
export class AccounttypeComponent implements OnInit {
    
	displayedColumns: string[] = ['AccountType','AccountGroup','GLCode'];
	data = [];
    obj={ AccountType : null,AccountGroupID : null,GLCode : null };
    displayForm = false;
    operation = "Add";
	title="Account Type";
	parent="Account";
	accountgroup = []; 
    constructor(protected http: HttpService) {
		this.loadItem = this.loadItem.bind(this);
	}
  
    ngOnInit() {
      this.http.get(accountUrl.accounttype.list)
        .subscribe(res => {
		  this.data = res.data;
        }, err =>
        { console.log(err) });
		this.http.get(accountUrl.accountgroup.list)
        .subscribe(res => {
          this.accountgroup = res.data;
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
      let url = accountUrl.accounttype.add;
      if(this.operation=="Update")
        url = accountUrl.accounttype.update;
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
      this.obj = { AccountType : null,AccountGroupID : null,GLCode : null };
      this.hideForm();
      this.operation="Add";
    }
  }
