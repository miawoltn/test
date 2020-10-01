import { Component, OnInit, ViewChild} from '@angular/core';
import { HttpService } from 'src/app/services/http.service';
import { chartsUrl } from '../charts-url';
import swal from 'sweetalert2';
@Component({
  selector: 'app-chart_types',
  templateUrl: './chart_types.component.html',
  styleUrls: ['./chart_types.component.scss']
})
export class ChartTypesComponent implements OnInit {
    
	data = [];
    obj={ chart_type : null,chart_category_id : null };
    displayForm = false;
    operation = "Add";
	title="Chart types";
	chart_category = []; 
    constructor(protected http: HttpService) {
		this.loadItem = this.loadItem.bind(this);
	}
  
    ngOnInit() {
      this.http.get(chartsUrl.chart_types.list)
        .subscribe(success=>{
		  this.data = success.data;
        }, error=>
        {console.log(error);});
		this.http.get(chartsUrl.chart_category.list)
        .subscribe(success=>{
          this.chart_category = success.data;
        }, error=>
        {console.log(error);});
		
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
      let url = chartsUrl.chart_types.add;
      if(this.operation=="Update"){
        url = chartsUrl.chart_types.update;
		this.save(url);
	  }
	  else
		this.add(url);
	  //e.preventDefault();
    }
  
    save(url)
    {
      this.http.post(url,this.obj)
        .subscribe(success=>{
          this.data= success.data;
          swal.fire("Process Complete", success.message,'success');
          this.resetForm();
        }, error=>
        {
          console.log(error);
          swal.fire("Process Unsuccessful", error.error.message,'error');
        });
    }
	add(url)
    {
      this.http.post(url,this.obj)
        .subscribe(success=>{
          this.data= success.data;
          swal.fire("Process Complete", success.message,'success');
          this.resetForm();
        }, error=>
        {
          console.log(error);
          swal.fire("Process Unsuccessful", error.error.message,'error');
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
      this.obj = { chart_type : null,chart_category_id : null };
      this.hideForm();
      this.operation="Add";
    }
  }
