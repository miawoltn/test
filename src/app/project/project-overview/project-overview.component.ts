import { Component, OnInit, ViewChild } from '@angular/core';
import { HttpService } from 'src/app/services/http.service';
import { projectUrl } from '../project-url';
import { customerUrl } from 'src/app/customer/customer-url';
import swal from 'sweetalert2';
import { ActivatedRoute } from '@angular/router';
import { employeeUrl } from 'src/app/employee/employee-url';
import { settingsUrl } from 'src/app/settings/settings-url';
@Component({
  selector: 'app-project-overview',
  templateUrl: './project-overview.component.html',
  styleUrls: ['./project-overview.component.scss'],
})
export class ProjectOverviewComponent implements OnInit {
  displayedColumns: string[] = [
    'CustomerTypeID',
    'ProjectType',
    'ProjectTypeID',
    'ProjectStatus',
    'ProjectDescription',
    'ProjectLocation',
    'ProjectApprovedBudget',
    'ProjectDuration',
    'ProjectAwardDate',
    'ProjectStartDate',
  ];
  data = [];
  obj = {
    CustomerID: null,
    ProjectTypeID: null,
    ProjectSubTypeID: null,
    ProjectStatusID: null,
    ProjectDescription: null,
    ProjectLocation: null,
    ProjectApprovedBudget: null,
    ProjectDuration: null,
    ProjectAwardDate: null,
    ProjectStartDate: null,
  };
  projectRisk = { RiskID: null, RiskMitigantID: null };
  displayForm = false;
  operation = 'Add';
  title = 'Project Overview';
  parent = 'Project';
  customer = [];
  projectstatus = [];
  projectsubtype = [];
  projecttype = [];

  isEditableEmployee: boolean = false;
  isEditableRisk: boolean = false;
  isEditableTask: boolean = false;
  isEditableTool: boolean = false;
  isEditableTeam: boolean = false;
  isEditableProjectMilestone: boolean = false;

  projectId: any;
  project: any;

  projectRisks = [];
  projectTasks = [];
  projectTools = [];
  projectTeam = [];
  projectMilestones = [];
  RiskMitigants: any = [];
  Risks: any = [];
  projects = [{ RiskID: null, RiskMitigantID: null }];
  projectTasksList = [
    {
      ProjectMilestoneID: null,
      Task: null,
      StartDate: null,
      EndDate: null,
    },
  ];
  projectMilestoneList = [
    { Milestone: null, StartDate: null, EndDate: null },
  ];

  projectTeamList = [{ EmployeeID: null, Description: null }]
  projectToolList = [{ ToolID: null, EquipmentID: null }]
  Employees = [];
  Equipments = [];

  constructor(protected http: HttpService, private route: ActivatedRoute) {
    // get empId from url
    this.projectId = this.route.snapshot.params.id;
    // this.loadItem = this.loadItem.bind(this);
  }

  ngOnInit() {
    // get project by :id
    this.http.get(projectUrl.project.get + this.projectId).subscribe(
      (res) => {
        console.log(res.data);
        this.project = res.data;
      },
      (error) => {
        console.log(error);
      }
    );

    this.http.get(projectUrl.project.list).subscribe(
      (res) => {
        this.data = res.data;
      },
      (err) => {
        console.log(err);
      }
    );

    this.http.get(customerUrl.customer.list).subscribe(
      (res) => {
        this.customer = res.data;
      },
      (error) => {
        console.log(error);
      }
    );

    this.http.get(projectUrl.projectstatus.list).subscribe(
      (res) => {
        this.projectstatus = res.data;
      },
      (error) => {
        console.log(error);
      }
    );

    this.http.get(projectUrl.projectsubtype.list).subscribe(
      (res) => {
        this.projectsubtype = res.data;
      },
      (error) => {
        console.log(error);
      }
    );

    this.http.get(projectUrl.projecttype.list).subscribe(
      (res) => {
        this.projecttype = res.data;
      },
      (error) => {
        console.log(error);
      }
    );

    this.http.get(projectUrl.risk.list).subscribe(
      (res) => {
        this.Risks = res.data;
      },
      (error) => {
        console.log(error);
      }
    );

    this.http.get(projectUrl.riskmitigant.list).subscribe(
      (res) => {
        this.RiskMitigants = res.data;
      },
      (error) => {
        console.log(error);
      }
    );

    this.http.get(projectUrl.projectrisk.projectRisksByID + this.projectId)
      .subscribe(
        (res) => {
          console.log(res.data);
          this.projectRisks = res.data;
        },
        (error) => {
          console.log(error);
        }
      );

    this.http
      .get(projectUrl.projectmilestone.projectMilestonesByProjectId + this.projectId)
      .subscribe(
        (res) => {
          console.log(res.data);
          this.projectMilestones = res.data;
        },
        (error) => {
          console.log(error);
        }
      );

    this.http
      .get(projectUrl.projecttask.projectTasksByProjectID + this.projectId)
      .subscribe(
        (res) => {
          console.log(res.data);
          this.projectTasks = res.data;
        },
        (error) => {
          console.log(error);
        }
      );

    this.http
      .get(projectUrl.projectteam.projectTeamByProjectID + this.projectId)
      .subscribe(
        (res) => {
          console.log(res.data);
          this.projectTeam = res.data;
        },
        (error) => {
          console.log(error);
        }
      );

    this.http
      .get(projectUrl.projecttool.projectToolsByProjectID + this.projectId)
      .subscribe(
        (res) => {
          console.log(res.data);
          this.projectTools = res.data;
        },
        (error) => {
          console.log(error);
        }
      );

    this.http.get(employeeUrl.employee.list)
      .subscribe(
        (res) => {
          console.log(res.data);
          this.Employees = res.data;
        },
        (error) => {
          console.log(error);
        }
      );

    this.http.get(settingsUrl.equipment.list)
      .subscribe(
        (res) => {
          console.log(res.data);
          this.Equipments = res.data;
        },
        (error) => {
          console.log(error);
        }
      );
  }

  editProject() {
    this.isEditableEmployee = true;
  }

  editProjectMileStone() {
    this.isEditableProjectMilestone = !this.isEditableProjectMilestone;
  }

  editProjectTool() {
    this.isEditableTool = !this.isEditableTool;
  }

  editRisk() {
    this.isEditableRisk = !this.isEditableRisk;
  }

  editTask() {
    this.isEditableTask = !this.isEditableTask;
  }

  editTool() {
    this.isEditableTool = !this.isEditableTool;
  }

  editTeam() {
    this.isEditableTeam = !this.isEditableTeam;
  }

  filterRiskMitigants(e) {
    console.log(e);
    console.log(this.RiskMitigants);
    this.RiskMitigants = this.RiskMitigants.filter(
      (i) => i.RiskID == e.RiskID
    );
    console.log(this.RiskMitigants);
  }

  showForm() {
    this.displayForm = true;
    window.scrollTo({ top: 0, left: 0, behavior: 'smooth' });
  }

  hideForm() {
    this.displayForm = false;
  }

  addItem() {
    this.resetForm();
    this.showForm();
  }

  processForm() {
    let url = projectUrl.project.add;
    if (this.operation == 'Update') url = projectUrl.project.update;
    this.save(url);
  }

  save(url) {
    this.http.post(url, this.obj).subscribe(
      (res) => {
        this.data = res.data;
        swal.fire('Process Complete', res.message, 'success');
        this.resetForm();
      },
      (err) => {
        console.log(err);
        swal.fire('Process Unsuccessful', err.error.message, 'error');
      }
    );
  }

  processProjectRisk() {
    let url = projectUrl.projectrisk.add;
    if (this.operation == 'Update') url = projectUrl.projectrisk.update;
    this.saveProjectRisk(url);
  }

  saveProjectRisk(url) {
    let data = { ProjectID: this.project.id, projectRisks: this.projects };
    console.log(data);
    this.http.post(url, data).subscribe(
      (res) => {
        this.projectRisks = res.data;
        swal.fire('Process Complete', res.message, 'success');
        this.resetProjectRisk();
      },
      (err) => {
        console.log(err);
        swal.fire('Process Unsuccessful', err.error.message, 'error');
      }
    );
  }

  processProjectMilestone() {
    let url = projectUrl.projectmilestone.add;
    if (this.operation == 'Update') {
      url = projectUrl.projectmilestone.update;
    }
    this.saveProjectMilestone(url);
  }

  saveProjectMilestone(url) {
    let data = {
      ProjectID: this.project.id,
      projectMilestones: this.projectMilestoneList,
    };
    console.log(data);
    this.http.post(url, data)
      .subscribe(res => {
        this.projectRisks = res.data;
        swal.fire("Process Complete", res.message, 'success');
        this.resetProjectMilestoneList();
      }, err => {
        console.log(err);
        swal.fire("Process Unsuccessful", err.error.message, 'error');
      });
  }

  processProjectTask() {
    let url = projectUrl.projecttask.add;
    if (this.operation == 'Update') url = projectUrl.projecttask.update;
    this.saveProjectTask(url);
  }

  saveProjectTask(url) {
    let data = {
      ProjectID: this.project.id,
      projectTasks: this.projectTasksList,
    };
    console.log(data);
    this.http.post(url, data)
      .subscribe(res => {
        this.projectRisks = res.data;
        swal.fire("Process Complete", res.message, 'success');
        this.resetProjectMilestoneList();
      }, err => {
        console.log(err);
        swal.fire("Process Unsuccessful", err.error.message, 'error');
      });
  }

  processProjectTeam() {
    let url = projectUrl.projectteam.add;
    if (this.operation == 'Update') url = projectUrl.projectteam.update;
    this.saveprojectTeam(url);
  }

  saveprojectTeam(url) {
    let data = {
      ProjectID: this.project.id,
      projectTeam: this.projectTeamList,
    };
    console.log("ProjectOverviewComponent -> saveprojectTeam -> data", data)
    this.http.post(url, data)
      .subscribe(res => {
        this.projectTeam = res.data;
        swal.fire("Process Complete", res.message, 'success');
        this.resetProjectTeamList();
      }, err => {
        console.log(err);
        swal.fire("Process Unsuccessful", err.error.message, 'error');
      });
  }

  processProjectTool() {
    let url = projectUrl.projecttool.add;
    if (this.operation == 'Update') url = projectUrl.projecttool.update;
    this.saveProjectTool(url);
  }

  saveProjectTool(url) {
    let data = {
      ProjectID: this.project.id,
      projectTools: this.projectToolList,
    };
    console.log("ProjectOverviewComponent -> saveProjectTool -> data", data)

    this.http.post(url, data)
      .subscribe(res => {
        this.projectTools = res.data;
        swal.fire("Process Complete", res.message, 'success');
        this.resetProjectTool();
      }, err => {
        console.log(err);
        swal.fire("Process Unsuccessful", err.error.message, 'error');
      });
  }

  loadItem(id) {
    this.obj = this.data.find((item) => item.id === id.row.data.id);
    this.operation = 'Update';
    this.showForm();
  }

  resetForm() {
    this.obj = {
      CustomerID: null,
      ProjectTypeID: null,
      ProjectSubTypeID: null,
      ProjectStatusID: null,
      ProjectDescription: null,
      ProjectLocation: null,
      ProjectApprovedBudget: null,
      ProjectDuration: null,
      ProjectAwardDate: null,
      ProjectStartDate: null,
    };
  }

  resetProjectRisk() {
    this.projects = [{ RiskID: null, RiskMitigantID: null }];
    this.editRisk();
  }

  addProjectRisk() {
    this.projects.push({ RiskID: null, RiskMitigantID: null });
  }

  removeProjectRisk(i) {
    this.projects.splice(i, 1);
  }

  addProjectMilestone() {
    this.projectMilestoneList.push({
      Milestone: null,
      StartDate: null,
      EndDate: null,
    });
  }

  removeProjectMilestone(i) {
    this.projectMilestoneList.splice(i, 1);
  }

  resetProjectMilestoneList() {
    this.projectMilestoneList = [
      { Milestone: null, StartDate: null, EndDate: null },
    ];
    this.editProjectMileStone();
  }

  addProjectTask() {
    this.projectTasksList.push({
      ProjectMilestoneID: null,
      Task: null,
      StartDate: null,
      EndDate: null,
    });
  }

  removeProjectTask(i) {
    this.projectTasksList.splice(i, 1);
  }

  resetProjectTaskList() {
    this.projectTasksList = [
      {
        ProjectMilestoneID: null,
        Task: null,
        StartDate: null,
        EndDate: null,
      },
    ];
    this.editTask();
  }

  addProjectTeam() {
    this.projectTeamList.push({
      EmployeeID: null,
      Description: null
    });
  }

  removeProjectTeam(i) {
    this.projectTeamList.splice(i, 1);
  }

  resetProjectTeamList() {
    this.projectTeamList = [
      { EmployeeID: null, Description: null }
    ];
    this.editTeam();
  }

  addProjectTool() {
    this.projectToolList.push({ ToolID: null, EquipmentID: null });
  }

  removeProjectTool(i) {
    this.projectToolList.splice(i, 1);
  }

  resetProjectTool() {
    this.projectToolList = [
      { ToolID: null, EquipmentID: null }
    ];
    this.editProjectTool();
  }
}
