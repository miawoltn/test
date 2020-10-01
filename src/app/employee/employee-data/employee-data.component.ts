import { Component, OnInit } from "@angular/core";
import { HttpService } from "src/app/services/http.service";
import { ActivatedRoute } from "@angular/router";
import { employeeUrl } from "../employee-url";
import { settingsUrl } from "src/app/settings/settings-url";
import { companyUrl } from "src/app/company/company-url";
import { educationUrl } from "src/app/education/education-url";
import swal from "sweetalert2";
import { UploadService } from 'src/app/services/upload.service';
import { API_URL } from 'src/app/services/app-config';

@Component({
  selector: "app-employee-data",
  templateUrl: "./employee-data.component.html",
  styleUrls: ["./employee-data.component.css"],
})
export class EmployeeDataComponent implements OnInit {
  API_URL2 = API_URL;
  isEditable = false;
  obj = {
    FirstName: null,
    SurName: null,
    FullName: null,
    DateOfBirth: null,
    GradeID: null,
    GradeLevelID: null,
    UnitID: null,
    CompanyID: null,
    BranchID: null,
    StateID: null,
    DepartmentID: null,
    DesignationID: null,
    StatusID: null,
    EmployeeTitleID: null,
    NationalityID: null,
    GenderID: null,
    MobileNum: null,
    HomeNum: null,
    Email: null,
    ResidentialAddress: null,
    ResidencyCheckFlag: null,
    Residency: null,
    StateofOriginID: null,
    LgaID: null,
    CityID: null,
    Tribe: null,
    Hobbies: null,
    EmployeeTypeID: null,
    NHFNo: null,
    PensionProviderID: null,
    BankID: null,
    BankAccountNo: null,
    EmployeeStatusID: null,
    MiddleName: null,
    EmployeeNumber: null,
    MaritalStatusID: null,
    ReligionID: null,
    BranchName: null,
    CompanyName: null,
    DepartmentName: null,
    DesignationName: null,
    EmployeeTitle: null,
    EmployeeType: null,
    Gender: null,
    GradeLevelName: null,
    GradeName: null,
    local_govt: null,
    MaritalStatus: null,
    Name: null,
    PensionProvider: null,
    Religion: null,
    state: null,
    StatusName: null,
    UnitName: null,
    BankName: null,
    PensionPIN: null,
    PersonalEmail: null,
    AnnualSalary: null,
    IdentificationPhoto: null,
    ContractLetter: null,
    ProfilePhoto: null,
  };
  operation = "Add";
  branches = [];
  company = [];
  country = [];
  departments = [];
  designations = [];
  employeetitle = [];
  employeetype = [];
  gender = [];
  gradelevels = [];
  grades = [];
  local_govt = [];
  maritalstatus = [];
  pensionprovider = [];
  religion = [];
  state = [];
  statuses = [];
  units = [];
  unitsAll = [];
  designationsAll = [];
  stateAll = [];
  lgaAll = [];
  gradelevelsAll = [];
  bank = [];
  id;
  constructor(protected http: HttpService, protected route: ActivatedRoute, private uploadService: UploadService) {}

  editEmployee() {
    this.isEditable = true;
  }

  viewEmployee() {
    this.isEditable = false;
  }

  ngOnInit() {
    this.http.get(settingsUrl.bank.list).subscribe(
      (success) => {
        this.bank = success.data;
      },
      (error) => {
        console.log(error);
      }
    );

    this.http.get(companyUrl.branches.list).subscribe(
      (success) => {
        this.branches = success.data;
      },
      (error) => {
        console.log(error);
      }
    );

    this.http.get(companyUrl.company.list).subscribe(
      (success) => {
        this.company = success.data;
      },
      (error) => {
        console.log(error);
      }
    );

    this.http.get(settingsUrl.country.list).subscribe(
      (success) => {
        this.country = success.data;
      },
      (error) => {
        console.log(error);
      }
    );

    this.http.get(companyUrl.departments.list).subscribe(
      (success) => {
        this.departments = success.data;
      },
      (error) => {
        console.log(error);
      }
    );

    this.http.get(companyUrl.designations.list).subscribe(
      (success) => {
        this.designationsAll = success.data;
      },
      (error) => {
        console.log(error);
      }
    );

    this.http.get(employeeUrl.employeetitle.list).subscribe(
      (success) => {
        this.employeetitle = success.data;
      },
      (error) => {
        console.log(error);
      }
    );

    this.http.get(employeeUrl.employeetype.list).subscribe(
      (success) => {
        this.employeetype = success.data;
      },
      (error) => {
        console.log(error);
      }
    );

    this.http.get(settingsUrl.gender.list).subscribe(
      (success) => {
        this.gender = success.data;
      },
      (error) => {
        console.log(error);
      }
    );

    this.http.get(educationUrl.gradelevels.list).subscribe(
      (success) => {
        this.gradelevelsAll = success.data;
      },
      (error) => {
        console.log(error);
      }
    );

    this.http.get(educationUrl.grades.list).subscribe(
      (success) => {
        this.grades = success.data;
      },
      (error) => {
        console.log(error);
      }
    );

    this.http.get(settingsUrl.local_govt.list).subscribe(
      (success) => {
        this.lgaAll = success.data;
      },
      (error) => {
        console.log(error);
      }
    );

    this.http.get(settingsUrl.maritalstatus.list).subscribe(
      (success) => {
        this.maritalstatus = success.data;
      },
      (error) => {
        console.log(error);
      }
    );

    this.http.get(settingsUrl.pensionprovider.list).subscribe(
      (success) => {
        this.pensionprovider = success.data;
      },
      (error) => {
        console.log(error);
      }
    );

    this.http.get(settingsUrl.religion.list).subscribe(
      (success) => {
        this.religion = success.data;
      },
      (error) => {
        console.log(error);
      }
    );

    this.http.get(settingsUrl.state.list).subscribe(
      (success) => {
        this.stateAll = success.data;
      },
      (error) => {
        console.log(error);
      }
    );

    this.http.get(settingsUrl.statuses.list).subscribe(
      (success) => {
        this.statuses = success.data;
      },
      (error) => {
        console.log(error);
      }
    );

    this.http.get(companyUrl.units.list).subscribe(
      (success) => {
        this.unitsAll = success.data;
      },
      (error) => {
        console.log(error);
      }
    );

    this.route.params.subscribe((params) => {
      console.log(params);
      if (params.id) {
        this.loadItem(params.id);
        this.id = params.id;
      }
    });
  }

  handleFileInputIdentificationPhoto(e) {
    console.log(e);
    let file = e.target.files[0];
    console.log(file);

    const formData: FormData = new FormData();
    formData.append("file", file, file.name);

    this.uploadService
      .upload(formData, `${this.API_URL2}photo`)
      .subscribe(
        (res) => {
          console.log(res.data);
          this.obj.IdentificationPhoto = res.data;
          // this.insertRecord(res.data)
        },
        (error) => console.log(error)
      );
  }

  handleFileInputContractLetter(e) {
    console.log(e);
    let file = e.target.files[0];
    console.log(file);

    const formData: FormData = new FormData();
    formData.append("file", file, file.name);

    this.uploadService
      .upload(formData, `${this.API_URL2}photo`)
      .subscribe(
        (res) => {
          console.log(res.data);
          this.obj.ContractLetter = res.data;
          // this.insertRecord(res.data)
        },
        (error) => console.log(error)
      );
  }

  handleFileInputProfilePhoto(e) {
    console.log(e);
    let file = e.target.files[0];
    console.log(file);

    const formData: FormData = new FormData();
    formData.append("file", file, file.name);

    this.uploadService
      .upload(formData, `${this.API_URL2}photo`)
      .subscribe(
        (res) => {
          console.log(res.data);
          this.obj.ProfilePhoto = res.data;
          // this.insertRecord(res.data)
        },
        (error) => console.log(error)
      );
  }

  // addItem() {
  //   this.obj.detail.push({});
  // }

  // removeItem(i) {
  //   this.obj.detail.splice(i, 1);
  // }

  onConfirm() {
    this.obj.BranchName = this.branches.find(
      (item) => this.obj.BranchID === item.id
    ).BranchName;
    this.obj.CompanyName = this.company.find(
      (item) => this.obj.CompanyID === item.id
    ).CompanyName;
    this.obj.DepartmentName = this.departments.find(
      (item) => this.obj.DepartmentID === item.id
    ).DepartmentName;
    this.obj.DesignationName = this.designations.find(
      (item) => this.obj.DesignationID === item.id
    ).DesignationName;
    this.obj.EmployeeTitle = this.employeetitle.find(
      (item) => this.obj.EmployeeTitleID === item.id
    ).EmployeeTitle;
    this.obj.EmployeeType = this.employeetype.find(
      (item) => this.obj.EmployeeTypeID === item.id
    ).EmployeeType;
    this.obj.Gender = this.gender.find(
      (item) => this.obj.GenderID === item.id
    ).Gender;
    this.obj.GradeLevelName = this.gradelevels.find(
      (item) => this.obj.GradeLevelID === item.id
    ).GradeLevelName;
    this.obj.GradeName = this.grades.find(
      (item) => this.obj.GradeID === item.id
    ).GradeName;
    this.obj.local_govt = this.local_govt.find(
      (item) => this.obj.LgaID === item.id
    ).local_govt;
    this.obj.MaritalStatus = this.maritalstatus.find(
      (item) => this.obj.MaritalStatusID === item.id
    ).MaritalStatus;
    this.obj.Name = this.country.find(
      (item) => this.obj.NationalityID === item.id
    ).Name;
    this.obj.PensionProvider = this.pensionprovider.find(
      (item) => this.obj.PensionProviderID === item.id
    ).PensionProvider;
    this.obj.Religion = this.religion.find(
      (item) => this.obj.ReligionID === item.id
    ).Religion;
    this.obj.state = this.state.find(
      (item) => this.obj.StateofOriginID === item.id
    ).state;
    this.obj.StatusName = this.statuses.find(
      (item) => this.obj.EmployeeStatusID === item.id
    ).StatusName;
    this.obj.UnitName = this.units.find(
      (item) => this.obj.UnitID === item.id
    ).UnitName;
    this.obj.BankName = this.bank.find(
      (item) => this.obj.BankID === item.id
    ).BankName;
  }

  processForm() {
    let url = employeeUrl.employee.update;
    // if (this.operation === "Update") {
    //   url = employeeUrl.employee.update;
    // }
    this.save(url);
  }

  save(url) {
    // console.log(this.obj);
    this.http.post(url, this.obj).subscribe(
      (success) => {
        swal.fire("Success", success.message, "success");
        this.isEditable = false;
      },
      (error) => {
        console.log(error);
        swal.fire("Error", error.message || "Some Error Occured", "error");
      }
    );
  }

  resetForm() {
    this.isEditable = false;
  }

  loadItem(id) {
    this.http.get(employeeUrl.employee.get + id).subscribe(
      (success) => {
        this.obj = success.data;
        console.log(success.data);
        this.operation = "Update";
        // this.onConfirm();
        this.loadStates();
        this.loadGradeLevels();
        this.loadLGA();
        this.loadUnits();
        // this.obj.UnitID = '' + success.data.UnitID;
        // this.obj.DesignationID = '' + success.data.DesignationID;
        // this.obj.StateofOriginID = '' + success.data.StateofOriginID;
        // this.obj.NationalityID = '' + success.data.NationalityID;
      },
      (error) => {
        console.log(error);
        swal.fire("Error", error.message || "Some Error Occured", "error");
      }
    );
  }

  loadUnits() {
    this.units = this.unitsAll.filter(
      (item) => item.DepartmentID === this.obj.DepartmentID
    );
    this.designations = this.designationsAll.filter(
      (item) => item.DepartmentID === this.obj.DepartmentID
    );
  }
  loadGradeLevels() {
    this.gradelevels = this.gradelevelsAll.filter(
      (item) => item.GradeID === this.obj.GradeID
    );
  }

  loadStates() {
    // console.log(this.stateAll);
    this.state = this.stateAll.filter(
      (item) => item.country_id === this.obj.NationalityID
    );
  }

  loadLGA() {
    this.local_govt = this.lgaAll.filter(
      (item) => item.state_id === this.obj.StateofOriginID
    );
    // console.log(this.obj.StateID);
  }
}
