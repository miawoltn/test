import { Component, OnInit } from '@angular/core';
import * as GC from '@grapecity/spread-sheets';
import * as XLSX from 'xlsx';
import * as FileSaver from 'file-saver';
import swal from 'sweetalert2';
import { HttpService } from 'src/app/services/http.service';
import { uploadUrl } from '../upload';

@Component({
  selector: 'app-uploadxls',
  templateUrl: './uploadxls.component.html',
  styleUrls: ['./uploadxls.component.css']
})
export class UploadxlsComponent implements OnInit {

  private spread: GC.Spread.Sheets.Workbook;
  private excelIO;

  title = 'read-excel-in-angular8';
  storeData: any;
  jsonData: any;
  fileUploaded: File;
  worksheet: any;
  data: any;

  constructor(protected http: HttpService) {
    // this.excelIO = new Excel.IO();

  }

  ngOnInit() {
  }

    onFileChange(args) {
      console.log(args);
      // tslint:disable-next-line: one-variable-per-declaration
      const self = this, file = args.srcElement && args.srcElement.files && args.srcElement.files[0];
      if (self.spread && file) {
        self.excelIO.open(file, (json) => {
          self.spread.fromJSON(json, {});
          setTimeout(() => {
            alert('load successfully');
          }, 0);
        }, (error) => {
          alert('load fail');
        });
      }
    }

    uploadedFile(event) {
      this.fileUploaded = event.target.files[0];
      this.readExcel();
    }
    readExcel() {
      const readFile = new FileReader();
      readFile.onload = (e) => {
        this.storeData = readFile.result;
        const data = new Uint8Array(this.storeData);
        const arr = new Array();
        for (let i = 0; i != data.length; ++i) { arr[i] = String.fromCharCode(data[i]); }
        const bstr = arr.join('');
        const workbook = XLSX.read(bstr, { type: 'binary' });
        const first_sheet_name = workbook.SheetNames[0];
        this.worksheet = workbook.Sheets[first_sheet_name];
      };
      readFile.readAsArrayBuffer(this.fileUploaded);
    }
    readAsJson() {
      this.jsonData = XLSX.utils.sheet_to_json(this.worksheet, { raw: false });
      this.jsonData = JSON.stringify(this.jsonData);
      this.save(uploadUrl.uploadxls.add);
      // const data: Blob = new Blob([this.jsonData], { type: 'application/json' });
      // FileSaver.saveAs(data, 'JsonFile' + new Date().getTime() + '.json');
    }

    save(url) {
      swal.showLoading();
      this.http.post(url, this.jsonData)
        .subscribe(success => {
          this.data = success.data;
          this.storeData = [];
          this.jsonData = [];
          this.worksheet = [];
          swal.fire(success.no_rec + ' Records Queued for processing', success.message, 'success');
        }, error => {
          console.log(error);
          swal.fire('Process Unsuccessful', error.error.message, 'error');
        });

    }

/*     readAsCSV() {
      this.csvData = XLSX.utils.sheet_to_csv(this.worksheet);
      const data: Blob = new Blob([this.csvData], { type: 'text/csv;charset=utf-8;' });
      FileSaver.saveAs(data, 'CSVFile' + new Date().getTime() + '.csv');
    }
    readAsHTML() {
      this.htmlData = XLSX.utils.sheet_to_html(this.worksheet);
      const data: Blob = new Blob([this.htmlData], { type: 'text/html;charset=utf-8;' });
      FileSaver.saveAs(data, 'HtmlFile' + new Date().getTime() + '.html');
    }
    readAsText() {
      this.textData = XLSX.utils.sheet_to_txt(this.worksheet);
      const data: Blob = new Blob([this.textData], { type: 'text/plain;charset=utf-8;' });
      FileSaver.saveAs(data, 'TextFile' + new Date().getTime() + '.txt');
    } */

}
