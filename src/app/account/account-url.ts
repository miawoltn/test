
import { API_URL } from '../services/app-config';

export let accountUrl = {
	account: { 
		add: API_URL + 'account/add',
		update: API_URL + 'account/update',
		list: API_URL + 'account/list',
		get: API_URL + 'account/get',
    },
	accountgroup: { 
		add: API_URL + 'accountgroup/add',
		update: API_URL + 'accountgroup/update',
		list: API_URL + 'accountgroup/list',
		get: API_URL + 'accountgroup/get',
    },
	accountssubtype: { 
		add: API_URL + 'accountssubtype/add',
		update: API_URL + 'accountssubtype/update',
		list: API_URL + 'accountssubtype/list',
		get: API_URL + 'accountssubtype/get',
    },
	accounttype: { 
		add: API_URL + 'accounttype/add',
		update: API_URL + 'accounttype/update',
		list: API_URL + 'accounttype/list',
		get: API_URL + 'accounttype/get',
    },
	

}
