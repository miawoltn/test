import { API_URL } from '../services/app-config';

export let procurementUrl = {
    procurement: {
        add: API_URL + 'procurement/add',
        update: API_URL + 'procurement/update',
        list: API_URL + 'procurement/list',
        get: API_URL + 'procurement/get/',
        procurementApprovalBin: API_URL + 'procurement/procurementApprovalBin',
        procurementApprovalDetail: API_URL + 'procurement/procurementApprovalDetail/',
    },
    procurementdetails: {
        add: API_URL + 'procurementdetails/add',
        update: API_URL + 'procurementdetails/update',
        list: API_URL + 'procurementdetails/list',
        get: API_URL + 'procurementdetails/get/',
        procurementDetails: API_URL + 'procurementdetails/procurementDetails',
        procurementdetailsByProcurementIDAndSeleted: API_URL + 'procurementdetails/procurementdetailsinfo/',
    },
    procurementvendor: {
        add: API_URL + 'procurementvendor/add',
        update: API_URL + 'procurementvendor/update',
        list: API_URL + 'procurementvendor/list',
        get: API_URL + 'procurementvendor/get/',
        procurementVendorsByProcurementID: API_URL + 'procurementvendor/procurementVendorsByProcurementID/',
    },
};
