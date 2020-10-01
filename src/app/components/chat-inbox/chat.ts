import { API_URL } from 'src/app/services/app-config';

export let employeeUrl = {
	employee: {
		add: API_URL + 'employee/add',
		update: API_URL + 'employee/update',
		list: API_URL + 'employee/list',
		get: API_URL + 'employee/get/',
		supervisors: API_URL + 'employee/supervisors',
		relievers: API_URL + 'employee/relievers',
		employeeProfile: API_URL + 'employee/employeeProfile',
		changePassword: API_URL + 'employee/changePassword',
		summary: API_URL + 'employee/summary',
	}

}
