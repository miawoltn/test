
import { API_URL } from '../services/app-config';

export let sanctionUrl = {
	offence: {
		add: API_URL + 'offence/add',
		update: API_URL + 'offence/update',
		list: API_URL + 'offence/list',
		get: API_URL + 'offence/get',
	},
	sanction: {
		add: API_URL + 'sanction/add',
		update: API_URL + 'sanction/update',
		list: API_URL + 'sanction/list',
		get: API_URL + 'sanction/get',
	},
	employeequery: {
		add: API_URL + 'employeequery/add',
		update: API_URL + 'employeequery/update',
		list: API_URL + 'employeequery/list',
		get: API_URL + 'employeequery/get',
	},

}
