import { API_URL } from '../services/app-config';
export let appraisalUrl = {
	appraisaldetails: {
		add: API_URL + 'appraisaldetails/add',
		update: API_URL + 'appraisaldetails/update',
		list: API_URL + 'appraisaldetails/list',
		get: API_URL + 'appraisaldetails/get',
		getOne: API_URL + 'appraisaldetails/getFull',
	},
	appraisalheader: {
		add: API_URL + 'appraisalheader/add',
		update: API_URL + 'appraisalheader/update',
		list: API_URL + 'appraisalheader/list',
		mylist: API_URL + 'appraisalheader/mylist',
		get: API_URL + 'appraisalheader/get',
		empInfo: API_URL + 'appraisalheader/get-info',
		benchmark: API_URL + 'appraisalheader/benchmark',
		report: API_URL + 'appraisalheader/report',
		chart: API_URL + 'appraisalheader/benchmark',
		my_appraisals: API_URL + 'appraisalheader/my-appraisals',
		dashboard: API_URL + 'appraisalheader/dashboard',
	},
	appraisal_approval: {
		add: API_URL + 'appraisal_approval/add',
		update: API_URL + 'appraisal_approval/update',
		list: API_URL + 'appraisal_approval/list',
		mylist: API_URL + 'appraisal_approval/mylist',
		get: API_URL + 'appraisal_approval/get',
		history: API_URL + 'appraisal_approval/history',
	},
	appraisal_trainings: {
		add: API_URL + 'appraisal_trainings/add',
		update: API_URL + 'appraisal_trainings/update',
		list: API_URL + 'appraisal_trainings/list',
		get: API_URL + 'appraisal_trainings/get',
	},
	kpi: {
		add: API_URL + 'kpi-employee/add',
		update: API_URL + 'kpi/update',
		list: API_URL + 'kpi-employee/list',
		get: API_URL + 'kpi-employee/get',
	},
	appraisal_rating: {
		add: API_URL + 'appraisal_rating/add',
		update: API_URL + 'appraisal_rating/update',
		list: API_URL + 'appraisal_rating/list',
		get: API_URL + 'appraisal_rating/get',
	}
}


