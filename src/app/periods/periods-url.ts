import { API_URL } from '../services/app-config';
export let periodsUrl = {
	period: { 
		add: API_URL + 'period/add',
		update: API_URL + 'period/update',
		list: API_URL + 'period/list',
		get: API_URL + 'period/get',
    },
	periodtype: { 
		add: API_URL + 'periodtype/add',
		update: API_URL + 'periodtype/update',
		list: API_URL + 'periodtype/list',
		get: API_URL + 'periodtype/get',
    },
	years: { 
		add: API_URL + 'years/add',
		update: API_URL + 'years/update',
		list: API_URL + 'years/list',
		get: API_URL + 'years/get',
    },
	

}
