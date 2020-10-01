import { Component, OnInit, ViewChild } from '@angular/core';
import { HttpService } from 'src/app/services/http.service';
import { shiftUrl } from '../shift-url';
import swal from 'sweetalert2';
import { companyUrl } from 'src/app/company/company-url';
import { MatStepper } from '@angular/material/stepper';
@Component({
    selector: 'app-shift_templates',
    templateUrl: './shift_templates.component.html',
    styleUrls: ['./shift_templates.component.scss'],
})
export class Shift_templatesComponent implements OnInit {
  @ViewChild('stepper', { static: false }) private myStepper: MatStepper;
  
    isEditable = true;
    isLinear = true;

    displayedColumns: string[] = [
        'shift_template',
        'shift_category',
        'shift_type',
        'time_in',
        'time_out',
        'shift_name',
    ];
    data = [];
    obj = {
        shift_template: null,
        shift_category_id: null,
        shift_type_id: null,
        time_in: null,
        time_out: null,
        shift_id: null,
        shift_category: null,
        shift_type: null,
        shift: null,
    };
    obj2 = {
        shift_template_id: null,
        date_from: null,
        date_to: null,
        DepartmentID: null,
        Department: null,
    };
    displayForm = false;
    operation = 'Add';
    title = 'Shift Templates';
    parent = 'Shift';
    shift_category = [];
    shift_types = [];
    shifts = [];
    shift_templates: any;
    departments: any;
    constructor(protected http: HttpService) {
        // this.loadItem = this.loadItem.bind(this);
    }

    ngOnInit() {
        this.http.get(shiftUrl.shift_templates.list).subscribe(
            (res) => {
                this.data = res.data;
            },
            (err) => {
                console.log(err);
            }
        );
        this.http.get(shiftUrl.shift_category.list).subscribe(
            (res) => {
                this.shift_category = res.data;
            },
            (error) => {
                console.log(error);
            }
        );
        this.http.get(shiftUrl.shift_types.list).subscribe(
            (res) => {
                this.shift_types = res.data;
            },
            (error) => {
                console.log(error);
            }
        );
        this.http.get(shiftUrl.shifts.list).subscribe(
            (res) => {
                this.shifts = res.data;
            },
            (error) => {
                console.log(error);
            }
        );

        this.http.get(shiftUrl.shift_templates.list).subscribe(
            (res) => {
                this.shift_templates = res.data;
            },
            (error) => {
                console.log(error);
            }
        );
        this.http.get(companyUrl.departments.list).subscribe(
            (res) => {
                this.departments = res.data;
            },
            (error) => {
                console.log(error);
            }
        );
    }

    onConfirm() {
        this.obj.shift_category = this.shift_category.find(
            (item) => this.obj.shift_category_id === item.id
        ).shift_category;
        this.obj.shift_type = this.shift_types.find(
            (item) => this.obj.shift_type_id === item.id
        ).shift_type;
        this.obj.shift = this.shifts.find(
            (item) => this.obj.shift_id === item.id
        ).shift_name;
        this.obj2.Department = this.departments.find(
            (item) => this.obj2.DepartmentID === item.id
        ).DepartmentName;
    }

    processForm() {
        let url = shiftUrl.shift_templates.add;
        // if (this.operation == 'Update') url = shiftUrl.shift_templates.update;
        this.save(url);
    }

    save(url) {
        let data = { shift_template: this.obj, shift_schedule: this.obj2 };
        this.http.post(url, data).subscribe(
            (res) => {
                // this.data = res.data;
                swal.fire('Process Complete', res.message, 'success');
                // this.resetForm();
            },
            (err) => {
                console.log(err);
                swal.fire('Process Unsuccessful', err.error.message, 'error');
                this.myStepper.previous();
            }
        );
    }

    resetForm() {
        this.obj = {
            shift_template: null,
            shift_category_id: null,
            shift_type_id: null,
            time_in: null,
            time_out: null,
            shift_id: null,
            shift_category: null,
            shift_type: null,
            shift: null,
        };
        this.obj2 = {
            shift_template_id: null,
            date_from: null,
            date_to: null,
            DepartmentID: null,
            Department: null,
        };
        // this.hideForm();
        this.operation = 'Add';
    }
}
