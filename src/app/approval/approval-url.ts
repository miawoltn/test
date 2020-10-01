
import { API_URL } from '../services/app-config';

export let approvalUrl = {
	approval: { 
		add: API_URL + 'approval/add',
		update: API_URL + 'approval/update',
		list: API_URL + 'approval/list',
		get: API_URL + 'approval/get',
    },
	approvalcreditscoring: { 
		add: API_URL + 'approvalcreditscoring/add',
		update: API_URL + 'approvalcreditscoring/update',
		list: API_URL + 'approvalcreditscoring/list',
		get: API_URL + 'approvalcreditscoring/get',
    },
	approvalinstances: { 
		add: API_URL + 'approvalinstances/add',
		update: API_URL + 'approvalinstances/update',
		list: API_URL + 'approvalinstances/list',
		get: API_URL + 'approvalinstances/get/',
		getApprovalInstances: API_URL + 'approvalinstances/getApprovalInstances',
		HrApprovalInstances: API_URL + 'approvalinstances/getApprovalInstancesHr',
    },
	approvallimit: { 
		add: API_URL + 'approvallimit/add',
		update: API_URL + 'approvallimit/update',
		list: API_URL + 'approvallimit/list',
		get: API_URL + 'approvallimit/get',
    },
	approvalloan: { 
		add: API_URL + 'approvalloan/add',
		update: API_URL + 'approvalloan/update',
		list: API_URL + 'approvalloan/list',
		get: API_URL + 'approvalloan/get',
    },
	approvalprocessflow: { 
		add: API_URL + 'approvalprocessflow/add',
		update: API_URL + 'approvalprocessflow/update',
		list: API_URL + 'approvalprocessflow/list',
		get: API_URL + 'approvalprocessflow/get',
    },
	approvalprocessmodule: { 
		add: API_URL + 'approvalprocessmodule/add',
		update: API_URL + 'approvalprocessmodule/update',
		list: API_URL + 'approvalprocessmodule/list',
		get: API_URL + 'approvalprocessmodule/get',
    },
	approvalprocesstype: { 
		add: API_URL + 'approvalprocesstype/add',
		update: API_URL + 'approvalprocesstype/update',
		list: API_URL + 'approvalprocesstype/list',
		get: API_URL + 'approvalprocesstype/get',
    },
	approvalstages: { 
		add: API_URL + 'approvalstages/add',
		update: API_URL + 'approvalstages/update',
		list: API_URL + 'approvalstages/list',
		get: API_URL + 'approvalstages/get',
    },
	approvaltype: { 
		add: API_URL + 'approvaltype/add',
		update: API_URL + 'approvaltype/update',
		list: API_URL + 'approvaltype/list',
		get: API_URL + 'approvaltype/get',
    },
	

}
