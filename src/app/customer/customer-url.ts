
import { API_URL } from '../services/app-config';

export let customerUrl = {
	customer: { 
		add: API_URL + 'customer/add',
		update: API_URL + 'customer/update',
		list: API_URL + 'customer/list',
		get: API_URL + 'customer/get',
    },
	customersubtype: { 
		add: API_URL + 'customersubtype/add',
		update: API_URL + 'customersubtype/update',
		list: API_URL + 'customersubtype/list',
		get: API_URL + 'customersubtype/get',
    },
	customertype: { 
		add: API_URL + 'customertype/add',
		update: API_URL + 'customertype/update',
		list: API_URL + 'customertype/list',
		get: API_URL + 'customertype/get',
    },
	

}
