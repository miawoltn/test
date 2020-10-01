
import { Component, OnInit, ViewChild} from '@angular/core';
import { HttpService } from 'src/app/services/http.service';
import { accountUrl } from '../account-url';
import swal from 'sweetalert2';
@Component({
  selector: 'app-account',
  templateUrl: './account.component.html',
  styleUrls: ['./account.component.scss']
})
export class AccountComponent implements OnInit {
    
	displayedColumns: string[] = ['AccountCode','AccountTitle','AccountGroup','AccountType','AccountsSubType','AccountOwnerID'];
	data = [];
    obj={ AccountCode : null,AccountTitle : null,AccountGroupID : null,AccountTypeID : null,AccountsSubTypeID : null,AccountOwnerID : null };
    displayForm = false;
    operation = "Add";
	title="Account";
	parent="Account";
	accountgroup = []; accountssubtype = []; accounttype = []; 
    constructor(protected http: HttpService) {
		this.loadItem = this.loadItem.bind(this);
	}
  
    ngOnInit() {
      this.http.get(accountUrl.account.list)
        .subscribe(res => {
		  this.data = res.data;
        }, err =>
        { console.log(err) });
		this.http.get(accountUrl.accountgroup.list)
        .subscribe(res => {
          this.accountgroup = res.data;
        }, error =>
        { console.log(error) });
		this.http.get(accountUrl.accountssubtype.list)
        .subscribe(res => {
          this.accountssubtype = res.data;
        }, error =>
        { console.log(error) });
		this.http.get(accountUrl.accounttype.list)
        .subscribe(res => {
          this.accounttype = res.data;
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
      let url = accountUrl.account.add;
      if(this.operation=="Update")
        url = accountUrl.account.update;
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
      this.obj = { AccountCode : null,AccountTitle : null,AccountGroupID : null,AccountTypeID : null,AccountsSubTypeID : null,AccountOwnerID : null };
      this.hideForm();
      this.operation="Add";
    }
  }
