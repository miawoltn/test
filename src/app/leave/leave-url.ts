
import { API_URL } from '../services/app-config';

export let leaveUrl = {
	holidays: {
		add: API_URL + 'holidays/add',
		update: API_URL + 'holidays/update',
		list: API_URL + 'holidays/list',
		get: API_URL + 'holidays/get',
	},
	leaveapplication: {
		add: API_URL + 'leaveapplication/add',
		update: API_URL + 'leaveapplication/update',
		list: API_URL + 'leaveapplication/list',
		get: API_URL + 'leaveapplication/get/',
		employee_request: API_URL + 'leaveapplication/employee-request',
		chart: API_URL + 'leaveapplication/charts',
		report: API_URL + 'leaveapplication/leavereport',
		dashboard: API_URL + 'leaveapplication/dashboard',
	},
	leaveapplicationsetup: {
		add: API_URL + 'leaveapplicationsetup/add',
		update: API_URL + 'leaveapplicationsetup/update',
		list: API_URL + 'leaveapplicationsetup/list',
		get: API_URL + 'leaveapplicationsetup/get',
	},
	leaveapproval: {
		add: API_URL + 'leaveapproval/add',
		update: API_URL + 'leaveapproval/update',
		list: API_URL + 'leaveapproval/list',
		get: API_URL + 'leaveapproval/get',
		mylist: API_URL + 'leaveapproval/pending-approvals',
		hrlist: API_URL + 'leaveapproval/hr-approvals',
		history: API_URL + 'leaveapproval/get-history',

	},
	leaveresumptionapproval: {
		add: API_URL + 'leaveresumptionapproval/add',
		update: API_URL + 'leaveresumptionapproval/update',
		list: API_URL + 'leaveresumptionapproval/list',
		get: API_URL + 'leaveresumptionapproval/get',
		mylist: API_URL + 'leaveresumptionapproval/pending-approvals',
		hrlist: API_URL + 'leaveresumptionapproval/hr-approvals',
		history: API_URL + 'leaveresumptionapproval/get-history',
		
	},
	leaveemployeeapplication: {
		add: API_URL + 'leaveemployeeapplication/add',
		update: API_URL + 'leaveemployeeapplication/update',
		list: API_URL + 'leaveemployeeapplication/list',
		get: API_URL + 'leaveemployeeapplication/get',
		balances: API_URL + 'leaveemployeeapplication/balances',
	},
	leaveplanner: {
		add: API_URL + 'leaveplanner/add',
		update: API_URL + 'leaveplanner/update',
		list: API_URL + 'leaveplanner/list',
		get: API_URL + 'leaveplanner/get',
		calendar: API_URL + 'leaveplanner/calendar',
		calendar2: API_URL + 'leaveplanner/calendar2',
		calendar3: API_URL + 'leaveplanner/calendar3',
	},
	leaveresumption: {
		add: API_URL + 'leaveresumption/add',
		update: API_URL + 'leaveresumption/update',
		list: API_URL + 'leaveresumption/list',
		get: API_URL + 'leaveresumption/get',
		pending: API_URL + 'leaveresumption/pending-resumption',
	},
	leavetype: {
		add: API_URL + 'leavetype/add',
		update: API_URL + 'leavetype/update',
		list: API_URL + 'leavetype/list',
		get: API_URL + 'leavetype/get',
	},


}
