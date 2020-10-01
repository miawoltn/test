import { API_URL } from '../services/app-config';
export let kpiUrl = {
	kpi: {
		add: API_URL + 'kpi/add',
		update: API_URL + 'kpi/update',
		list: API_URL + 'kpi/list',
		get: API_URL + 'kpi/get',
	},
	kpiclass: {
		add: API_URL + 'kpiclass/add',
		update: API_URL + 'kpiclass/update',
		list: API_URL + 'kpiclass/list',
		get: API_URL + 'kpiclass/get',
		
	},
	kpiconfig: {
		add: API_URL + 'kpiconfig/add',
		update: API_URL + 'kpiconfig/update',
		list: API_URL + 'kpiconfig/list',
		get: API_URL + 'kpiconfig/get',
		detail: API_URL + 'kpiconfig/detail',
		detailEmp: API_URL + 'kpiconfig/detail-mine',
		getEmp: API_URL + 'kpiconfig/get-config',
	},
	kpiconfig_approval: {
		add: API_URL + 'kpiconfig_approval/add',
		update: API_URL + 'kpiconfig_approval/update',
		list: API_URL + 'kpiconfig_approval/list',
		mylist: API_URL + 'kpiconfig_approval/mylist',
		history: API_URL + 'kpiconfig_approval/history',
		get: API_URL + 'kpiconfig_approval/get',
	},
	kpi_classscoring: {
		add: API_URL + 'kpi_classscoring/add',
		update: API_URL + 'kpi_classscoring/update',
		list: API_URL + 'kpi_classscoring/list',
		get: API_URL + 'kpi_classscoring/get',
	},
	kpi_type: {
		add: API_URL + 'kpi_type/add',
		update: API_URL + 'kpi_type/update',
		list: API_URL + 'kpi_type/list',
		get: API_URL + 'kpi_type/get',
	},
	kpi_typescoring: {
		add: API_URL + 'kpi_typescoring/add',
		update: API_URL + 'kpi_typescoring/update',
		list: API_URL + 'kpi_typescoring/list',
		get: API_URL + 'kpi_typescoring/get',
	},
	employees:{
		supervisors: API_URL + 'employee/supervisors',
		update: API_URL + 'kpi_typescoring/update',
		list: API_URL + 'kpi_typescoring/list',
		get: API_URL + 'kpi_typescoring/get',
	}


}
