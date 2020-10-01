
import { API_URL } from '../services/app-config';

export let storeUrl = {
	storeitems: { 
		add: API_URL + 'storeitems/add',
		update: API_URL + 'storeitems/update',
		list: API_URL + 'storeitems/list',
		get: API_URL + 'storeitems/get',
    },
	stores: { 
		add: API_URL + 'stores/add',
		update: API_URL + 'stores/update',
		list: API_URL + 'stores/list',
		get: API_URL + 'stores/get',
    },
	

}
