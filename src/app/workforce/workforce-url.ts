
import { API_URL } from '../services/app-config';

export let workforceUrl = {
	workforce: { 
		add: API_URL + 'workforce/add',
		update: API_URL + 'workforce/update',
		list: API_URL + 'workforce/list',
		get: API_URL + 'workforce/get',
    },
	workforcehistory: { 
		add: API_URL + 'workforcehistory/add',
		update: API_URL + 'workforcehistory/update',
		list: API_URL + 'workforcehistory/list',
		get: API_URL + 'workforcehistory/get',
    },
	workforceoptions: { 
		add: API_URL + 'workforceoptions/add',
		update: API_URL + 'workforceoptions/update',
		list: API_URL + 'workforceoptions/list',
		get: API_URL + 'workforceoptions/get',
    },
	

}
