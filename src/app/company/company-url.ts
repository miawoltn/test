
import { API_URL } from '../services/app-config';

export let companyUrl = {
	branches: {
		add: API_URL + 'branches/add',
		update: API_URL + 'branches/update',
		list: API_URL + 'branches/list',
		get: API_URL + 'branches/get',
	},
	branchtypes: {
		add: API_URL + 'branchtypes/add',
		update: API_URL + 'branchtypes/update',
		list: API_URL + 'branchtypes/list',
		get: API_URL + 'branchtypes/get',
	},
	company: {
		add: API_URL + 'company/add',
		update: API_URL + 'company/update',
		list: API_URL + 'company/list',
		get: API_URL + 'company/get',
	},
	departmentgroup: {
		add: API_URL + 'departmentgroup/add',
		update: API_URL + 'departmentgroup/update',
		list: API_URL + 'departmentgroup/list',
		get: API_URL + 'departmentgroup/get',
	},
	departments: {
		add: API_URL + 'departments/add',
		update: API_URL + 'departments/update',
		list: API_URL + 'departments/list',
		get: API_URL + 'departments/get',
	},
	designationcategory: {
		add: API_URL + 'designationcategory/add',
		update: API_URL + 'designationcategory/update',
		list: API_URL + 'designationcategory/list',
		get: API_URL + 'designationcategory/get',
	},
	designations: {
		add: API_URL + 'designations/add',
		update: API_URL + 'designations/update',
		list: API_URL + 'designations/list',
		get: API_URL + 'designations/get',
	},
	divisions: {
		add: API_URL + 'divisions/add',
		update: API_URL + 'divisions/update',
		list: API_URL + 'divisions/list',
		get: API_URL + 'divisions/get',
	},
	gradelevels: {
		add: API_URL + 'gradelevels/add',
		update: API_URL + 'gradelevels/update',
		list: API_URL + 'gradelevels/list',
		get: API_URL + 'gradelevels/get',
	},
	grades: {
		add: API_URL + 'grades/add',
		update: API_URL + 'grades/update',
		list: API_URL + 'grades/list',
		get: API_URL + 'grades/get',
	},
	grade_cadre: {
		add: API_URL + 'grade_cadre/add',
		update: API_URL + 'grade_cadre/update',
		list: API_URL + 'grade_cadre/list',
		get: API_URL + 'grade_cadre/get',
	},
	supervisortypes: {
		add: API_URL + 'supervisortypes/add',
		update: API_URL + 'supervisortypes/update',
		list: API_URL + 'supervisortypes/list',
		get: API_URL + 'supervisortypes/get',
	},
	units: {
		add: API_URL + 'units/add',
		update: API_URL + 'units/update',
		list: API_URL + 'units/list',
		get: API_URL + 'units/get',
	},
	staffcategory: {
		add: API_URL + 'grade_cadre/add',
		update: API_URL + 'grade_cadre/update',
		list: API_URL + 'grade_cadre/list',
		get: API_URL + 'grade_cadre/get',
	},
}

