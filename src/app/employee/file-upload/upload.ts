import { API_URL } from 'src/app/services/app-config';

export let uploadUrl = {
	uploadxls: {
		add: API_URL + 'employee/bulk',
		waitinglist: API_URL +  '/bulkupload/waitinglist',
		single: API_URL + '/bulkupload/add',
		icm_msg: API_URL + '/bulkupload/icm',
		backlog: API_URL + '/bulkupload/backlog',
	},
};
