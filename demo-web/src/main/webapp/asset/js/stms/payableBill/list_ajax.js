/**
 * 应付账单列表js
 * auto wjp
 * date 2016-11-08 09:33
 */

/**
 * 操作列自定义
 * @param item
 * @returns {___anonymous120_181}
 */
function gen_action(item) {
	var objAction = {
			audit:[],
			log:[]
	};
	if (item.raw.billStatus == '0') {
		objAction['audit'].push({
			label: '审核',
			href: "javascript:iframeFullPage('"+ rootPath + "/payableBillDetail/bill_audit_list.do?id=" + item.id + "')"
		});
	} else {		
		objAction['audit'].push({
			label: '审核',
			class: 'gray'
		});
	}
	
	objAction['log'].push({
		label: '修改日志',
		href: "javascript:payableBillLogOpen('" + item.id + "')"
	});
	
	return objAction;
}

//打开选择采购供应商
function selectSupplier(){
    $.frontEngineDialog.executeIframeDialog('vendor', '采购供应商', rootPath
            + '/payableBill/selectVendor.do', '1000', '610');
}

function payableBillLogOpen(billId) {
	$.frontEngineDialog.executeIframeDialog('payableBillLog', '修改日志', rootPath
            + '/payableBillLog/list.do?id=' + billId, '1200', '660');
}

/**
* 获取选中的值
*/
var getSelectedWaitSubmit = function(pagId) {
	if(pagId==''||pagId==undefined){
		pagId = 'table';
	}
	var arr = [];
	$("#dt_"+pagId+" tbody tr td input[type='checkbox']:checkbox:checked").each(function() {
		var purchaseState = $(this).attr("purchaseState");
		if (purchaseState && (purchaseState == "0" || purchaseState == "1")) {
			arr.push($(this).val());
		}
	});
	return arr;
}

/**
 * 多选，获取选择结果
 */
var getSelected = function(pagId) {
	if(pagId==''||pagId==undefined){
		pagId = 'table';
	}
	var arr = [];
	$("#dt_"+pagId+" tbody tr td input[type='checkbox']:checkbox:checked").each(function() {
			arr.push($(this).val());
	});
	return arr;
};

/*
 * 导出 
 */
function exportExcel(th) {
	var cbox =getSelected("bill_list");
	if (cbox == "" || cbox.length == 0) {
		$.frontEngineDialog.executeDialogContentTime('请选择'+ $(th).text() +'项！！',2000);
		return;
	}
	
	document.forms[0].action = rootPath + "/payableBill/exportExcel.do";
	document.forms[0].billNos.value = cbox.join(",");
	console.info(document.forms[0].action);
	document.forms[0].submit();
	
	document.forms[0].action = rootPath + "/payableBill/list.do";
	document.forms[0].billNos.value = "";
	console.info(document.forms[0].action);
}