
import { API_URL } from '../services/app-config';

export let employeequeryresponseUrl = {
    employeequeryresponse: {
		add: API_URL + 'employeequeryresponse/add',
		update: API_URL + 'employeequeryresponse/update',
		list: API_URL + 'employeequeryresponse/list',
		get: API_URL + 'employeequeryresponse/get',
	},
	employeequeryevaluation: {
		add: API_URL + 'employeequeryevaluation/add',
		update: API_URL + 'employeequeryevaluation/update',
		list: API_URL + 'employeequeryevaluation/list',
		get: API_URL + 'employeequeryevaluation/get',
	},
}
