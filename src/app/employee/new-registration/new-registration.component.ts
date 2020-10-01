import { projectUrl } from './../../project/project-url';
import { Component, OnInit, ViewChild } from '@angular/core';
import { HttpService } from 'src/app/services/http.service';
import swal from 'sweetalert2';
import { ActivatedRoute } from '@angular/router';
import { employeeUrl } from '../employee-url';
import { settingsUrl } from 'src/app/settings/settings-url';
import { companyUrl } from 'src/app/company/company-url';
import { educationUrl } from 'src/app/education/education-url';
import { MatStepper } from '@angular/material/stepper/stepper';
import { UploadService } from 'src/app/services/upload.service';
import { API_URL } from 'src/app/services/app-config';

@Component({
  selector: 'app-new-registration',
  templateUrl: './new-registration.component.html',
  styleUrls: ['./new-registration.component.css'],
})
export class NewRegistrationComponent implements OnInit {
  @ViewChild('stepper', { static: false }) private myStepper: MatStepper;

  public myModel = '';
  // public mask = ['(', /[1-9]/, /\d/, /\d/, ')', ' ', /\d/, /\d/, /\d/, '-', /\d/, /\d/, /\d/, /\d/];
  public mask = [ /[0-9]/, /\d/,  /\d/, /\d/, /\d/, /\d/, /\d/, /\d/, /\d/, /\d/, /\d/];
  // public mask = [/^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$/];

  API_URL2 = API_URL;
  title = 'Employee';
  isEditable = true;
  isLinear = true;
  subtotal = 0;
  checkResidency = false;

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
      ResidencyID: null,
      Residency: null,
      IdentificationID: null,
      Identification: null,
      IdentificationNumber: null,
      IdentificationStartDate: null,
      IdentificationExpiryDate: null,
      PermanentAddress: null,
      StaffCategoryID: null,
      StaffCategory: null,
      ProjectID: null,
      Project: null,
      EmploymentDate: null,
      ContractExpiryDate: null,
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
      LeaveType: null,
      IdentificationPhoto: null,
      ContractLetter: null,
      ProfilePhoto: null,
      AnnualSalary: null,
  };

  obj2 = [
    {
      FullName: null,
      RelationshipID: null,
      Email: null,
      PhoneNumber: null,
      Address: null,
      Occupation: null,
      RelationshipName: null,
    },
  ];

  obj3 = [
    {
      Description: null,
      SchoolName: null,
      StartDate: null,
      EndDate: null,
      SchoolTypeID: null,
      SchoolType: null,
      ProgrammeTypeID: null,
      ProgrammeType: null,
      QualificationID: null,
      Qualification: null,
      QualificationGradeID: null,
      QualificationGrade: null,
      EmployeeID: null,
    },
  ];

  obj4 = [
    {
      GuarantorName: null,
      Address: null,
      PhoneNumber: null,
      JobTitle: null,
      Email: null,
      EmployeeID: null,
    },
  ];

  obj5 = [
    {
      EmployeeID: null,
      EmployeeName: null,
      Address: null,
      PhoneNumber: null,
      EmailAddress: null,
      JobTitle: null,
      JobDescription: null,
      StartDate: null,
      EndDate: null,
      IsPresent: null,
    },
  ];

  obj6 = [
    {
      Surname: null,
      FirstName: null,
      DateofBirth: null,
      Address: null,
    },
  ];

  obj7 = [
    {
      HealthInsuranceProviderID: null,
      HealthInsuranceProvider: null,
      Hospital: null,
      Address: null,
      ContactNumber: null,
      StartDate: null,
      EndDate: null,
    },
  ];

  obj8 = [
    {
      FullName: null,
      Address: null,
      RelationshipID: null,
      RelationshipName: null,
      Email: null,
      ContactNumber: null,
      Note: null,
    },
  ];

  operation = 'Add';
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
  Relationship = [];
  programmetypes = [];
  qualificationgrade = [];
  qualifications = [];
  schooltypes = [];
  Identifications = [];
  StaffCategory = [];
  Projects = [];
  isContract = false;
  FilteredIdentification = [];
  Residency = [];
  healthinsuranceproviders = [];

  constructor(protected http: HttpService, protected route: ActivatedRoute, private uploadService: UploadService) {}

  ngOnInit() {
    this.route.params.subscribe((params) => {
      console.log(params);
      if (params.id) {
        this.loadItem(params.id);
      }
    });

    this.http.get(settingsUrl.identification.list).subscribe(
      (success) => {
        this.Identifications = success.data;
      },
      (error) => {
        console.log(error);
      }
    );

    this.http.get(settingsUrl.residency.list).subscribe(
      (success) => {
        this.Residency = success.data;
      },
      (error) => {
        console.log(error);
      }
    );

    this.http.get(projectUrl.project.list).subscribe(
      (success) => {
        this.Projects = success.data;
      },
      (error) => {
        console.log(error);
      }
    );

    this.http.get(settingsUrl.staffcategory.list).subscribe(
      (success) => {
        this.StaffCategory = success.data;
      },
      (error) => {
        console.log(error);
      }
    );

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

    this.http.get(employeeUrl.relationship.list).subscribe(
      (success) => {
        this.Relationship = success.data;
      },
      (error) => {
        console.log(error);
      }
    );

    this.http.get(educationUrl.programmetypes.list).subscribe(
      (success) => {
        this.programmetypes = success.data;
      },
      (error) => {
        console.log(error);
      }
    );
    this.http.get(educationUrl.qualificationgrade.list).subscribe(
      (success) => {
        this.qualificationgrade = success.data;
      },
      (error) => {
        console.log(error);
      }
    );
    this.http.get(educationUrl.qualifications.list).subscribe(
      (success) => {
        this.qualifications = success.data;
      },
      (error) => {
        console.log(error);
      }
    );

    this.http.get(educationUrl.schooltypes.list).subscribe(
      (success) => {
        this.schooltypes = success.data;
      },
      (error) => {
        console.log(error);
      }
    );

    this.http.get(settingsUrl.healthinsuranceprovider.list).subscribe(
      (success) => {
        this.healthinsuranceproviders = success.data;
      },
      (error) => {
        console.log(error);
      }
    );
  }

  employmenttype(e) {
    console.log(e);
    if (e.id == '7') {
      this.isContract = true;
    } else {
      this.isContract = false;
    }
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

  onChangeResidency(e) {
    this.FilteredIdentification = this.Identifications.filter(
      (i) => i.ResidencyID === e.ResidencyID
    );
    if (e.checkflag == '1') {
      this.checkResidency = true;

      // set country to Nigeria
      this.obj.NationalityID = "151";
      let country = { country_id: this.obj.NationalityID};
      this.loadStates(country);
    } else {
      this.checkResidency = false;

      // reset NationalityID
      this.obj.NationalityID = null;
    }
  }

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
      (item) => this.obj.NationalityID === item.country_id
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

    this.obj.Residency = this.Residency.find(
      (item) => this.obj.ResidencyID === item.id
    ).Residency;

    this.obj.Identification = this.Identifications.find(
      (item) => this.obj.IdentificationID === item.id
    ).Identification;

    this.obj.StaffCategory = this.StaffCategory.find(
      (item) => this.obj.StaffCategoryID === item.id
    ).StaffCategory;

    this.obj.Project = this.Projects.find(
      (item) => this.obj.ProjectID === item.id
    ).ProjectDescription;

    for (let i = 0; i < this.obj2.length; i++) {
      this.obj2[i].RelationshipName = this.Relationship.find(
        (item) => this.obj2[i].RelationshipID === item.RelationshipID
      ).RelationshipName;
    }

    for (let i = 0; i < this.obj3.length; i++) {
      this.obj3[i].SchoolType = this.schooltypes.find(
        (item) => this.obj3[i].SchoolTypeID === item.SchoolTypeID
      ).SchoolType;
      this.obj3[i].ProgrammeType = this.programmetypes.find(
        (item) => this.obj3[i].ProgrammeTypeID === item.ProgrammeTypeID
      ).ProgrammeType;
      this.obj3[i].Qualification = this.qualifications.find(
        (item) => this.obj3[i].QualificationID === item.QualificationID
      ).QualificationName;
      this.obj3[i].QualificationGrade = this.qualificationgrade.find(
        (item) =>
          this.obj3[i].QualificationGradeID === item.QualificationGradeID
      ).QualificationGradeName;

      for (let i = 0; i < this.obj8.length; i++) {
        this.obj8[i].RelationshipName = this.Relationship.find(
          (item) => this.obj2[i].RelationshipID === item.RelationshipID
        ).RelationshipName;
      }

      for (let i = 0; i < this.obj7.length; i++) {
        this.obj7[i].HealthInsuranceProvider = this.healthinsuranceproviders.find(
          (item) =>
            this.obj7[i].HealthInsuranceProviderID ===
            item.HealthInsuranceProviderID
        ).HealthInsuranceProvider;
      }

      // this.obj3[i].QualificationGrade = this.qualifications.find(
      //   (item) =>
      //     this.obj3[i].QualificationGradeID === item.QualificationGradeID
      // ).QualificationGradeName;
    }
    // this.obj2.RelationshipName = this.Relationship.find(item => console.log(item));
  }

  processForm() {
    let url = employeeUrl.employee.add;
    if (this.operation === 'Update') {
      url = employeeUrl.employee.update;
    }
    this.save(url);
  }

  save(url) {
    let data = {
      emp: this.obj,
      fam: this.obj2,
      edu: this.obj3,
      gua: this.obj4,
      work: this.obj5,
      dependent: this.obj6,
      health: this.obj7,
      ref: this.obj8,
    };
    this.http.post(url, data).subscribe(
      (success) => {
        swal.fire('Success', success.message, 'success');
        this.isEditable = false;
      },
      (error) => {
        console.log(error);
        swal.fire('Error', error.message || 'Some Error Occured', 'error');
        this.myStepper.previous();
      }
    );
  }

  addEmployeeGuarantor() {
    this.obj4.push({
      GuarantorName: null,
      Address: null,
      PhoneNumber: null,
      JobTitle: null,
      Email: null,
      EmployeeID: null,
    });
  }

  removeEmployeeGuarantor(i) {
    this.obj4.splice(i, 1);
  }

  addEmployeeEducation() {
    this.obj3.push({
      Description: null,
      SchoolName: null,
      StartDate: null,
      EndDate: null,
      SchoolTypeID: null,
      SchoolType: null,
      ProgrammeTypeID: null,
      ProgrammeType: null,
      QualificationID: null,
      Qualification: null,
      QualificationGradeID: null,
      QualificationGrade: null,
      EmployeeID: null,
    });
  }

  removeEmployeeEducation(i) {
    this.obj3.splice(i, 1);
  }

  addEmployeeFamily() {
    this.obj2.push({
      FullName: null,
      RelationshipID: null,
      Email: null,
      PhoneNumber: null,
      Address: null,
      Occupation: null,
      RelationshipName: null,
    });
  }

  removeEmployeeFamily(i) {
    this.obj2.splice(i, 1);
  }

  addEmployeeWork() {
    this.obj5.push({
      EmployeeID: null,
      EmployeeName: null,
      Address: null,
      PhoneNumber: null,
      EmailAddress: null,
      JobTitle: null,
      JobDescription: null,
      StartDate: null,
      EndDate: null,
      IsPresent: null,
    });
  }

  removeEmployeeWork(i) {
    this.obj5.splice(i, 1);
  }

  addReferee() {
    this.obj8.push({
      FullName: null,
      Address: null,
      RelationshipID: null,
      RelationshipName: null,
      Email: null,
      ContactNumber: null,
      Note: null,
    });
  }

  removeReferee(i) {
    this.obj8.splice(i, 1);
  }

  addDependent() {
    this.obj6.push({
      Surname: null,
      FirstName: null,
      DateofBirth: null,
      Address: null,
    });
  }

  removeDependent(i) {
    this.obj6.splice(i, 1);
  }

  addHealthRecord() {
    this.obj7.push({
      HealthInsuranceProviderID: null,
      HealthInsuranceProvider: null,
      Hospital: null,
      Address: null,
      ContactNumber: null,
      StartDate: null,
      EndDate: null,
    });
  }

  removeHealthRecord(i) {
    this.obj7.splice(i, 1);
  }

  resetForm() {
    this.obj = {
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
      ResidencyID: null,
      Residency: null,
      IdentificationID: null,
      Identification: null,
      IdentificationNumber: null,
      IdentificationStartDate: null,
      IdentificationExpiryDate: null,
      PermanentAddress: null,
      StaffCategoryID: null,
      StaffCategory: null,
      ProjectID: null,
      Project: null,
      EmploymentDate: null,
      ContractExpiryDate: null,
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
      LeaveType: null,
      IdentificationPhoto: null,
      ContractLetter: null,
      ProfilePhoto: null,
      AnnualSalary: null,
    };

    this.obj2 = [
      {
        FullName: null,
        RelationshipID: null,
        Email: null,
        PhoneNumber: null,
        Address: null,
        Occupation: null,
        RelationshipName: null,
      },
    ];

    this.obj3 = [
      {
        Description: null,
        SchoolName: null,
        StartDate: null,
        EndDate: null,
        SchoolTypeID: null,
        SchoolType: null,
        ProgrammeTypeID: null,
        ProgrammeType: null,
        QualificationID: null,
        Qualification: null,
        QualificationGradeID: null,
        QualificationGrade: null,
        EmployeeID: null,
      },
    ];

    this.operation = 'Add';
    this.isEditable = true;
  }

  loadItem(id) {
    this.http.get(employeeUrl.employee.get + '/' + id).subscribe(
      (success) => {
        this.obj = success.data;
        this.isEditable = true;
        this.operation = 'Update';
      },
      (error) => {
        console.log(error);
        swal.fire('Error', error.message || 'Some Error Occured', 'error');
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

  loadStates(e) {
    console.log(this.obj.NationalityID);
    console.log(e);
    this.state = this.stateAll.filter(
      (item) => item.country_id === e.country_id
    );
    console.log(this.state);
  }

  loadLGA() {
    this.local_govt = this.lgaAll.filter(
      (item) => item.state_id === this.obj.StateofOriginID
    );
  }
}
