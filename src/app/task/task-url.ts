import { API_URL } from '../services/app-config';

export let taskUrl = {
	task: {
		add: API_URL + 'task/add',
		update: API_URL + 'task/update',
		list: API_URL + 'task/list',
		get: API_URL + 'task/get',
		tasklist: API_URL + 'task/task-list',
		pendingRating: API_URL + 'task/pending-rating',
		rateTask: API_URL + 'task/update-rating',
		report: API_URL + 'task/report',
		chart: API_URL + 'task/charts',
	},
	taskdelegation: {
		add: API_URL + 'taskdelegation/add',
		update: API_URL + 'taskdelegation/update',
		list: API_URL + 'taskdelegation/list',
		get: API_URL + 'taskdelegation/get',
	},
	tasknote: {
		add: API_URL + 'tasknote/add',
		update: API_URL + 'tasknote/update',
		list: API_URL + 'tasknote/list',
		get: API_URL + 'tasknote/get',
	},
	taskpriority: {
		add: API_URL + 'taskpriority/add',
		update: API_URL + 'taskpriority/update',
		list: API_URL + 'taskpriority/list',
		get: API_URL + 'taskpriority/get',
	},
	taskstatus: {
		add: API_URL + 'taskstatus/add',
		update: API_URL + 'taskstatus/update',
		list: API_URL + 'taskstatus/list',
		get: API_URL + 'taskstatus/get',
	},


}
