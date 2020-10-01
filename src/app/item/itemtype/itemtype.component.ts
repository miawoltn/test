
import { Component, OnInit, ViewChild} from '@angular/core';
import { HttpService } from 'src/app/services/http.service';
import { itemUrl } from '../item-url';
import swal from 'sweetalert2';
@Component({
  selector: 'app-itemtype',
  templateUrl: './itemtype.component.html',
  styleUrls: ['./itemtype.component.scss']
})
export class ItemtypeComponent implements OnInit {
    
	displayedColumns: string[] = ['ItemType'];
	data = [];
    obj={ ItemType : null };
    displayForm = false;
    operation = "Add";
	title="Item Type";
	parent="Item";
	
    constructor(protected http: HttpService) {
		this.loadItem = this.loadItem.bind(this);
	}
  
    ngOnInit() {
      this.http.get(itemUrl.itemtype.list)
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
      let url = itemUrl.itemtype.add;
      if(this.operation=="Update")
        url = itemUrl.itemtype.update;
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
      this.obj = { ItemType : null };
      this.hideForm();
      this.operation="Add";
    }
  }
