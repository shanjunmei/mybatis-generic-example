function gen_action(item) {
	var objAction = {
			examine:[],
			Journal: [],
	       
	};
	
	if (item.raw.billStatus == '0') {
		objAction['examine'].push({
			label: '审核',
			href: "javascript:iframeFullPage('"+ rootPath + "/refundBillDetail/listBillDetail.do?id=" + item.id+ "')"//
		});
	} else {		
		objAction['examine'].push({
			label: '审核',
			class: 'gray'
		});
	}
	
	
	
	objAction['Journal'].push({
		label: '日志',
		//href: "javascript:iframeFullPage('"+ rootPath + "/refundBillLog/list.do?id=" + item.id+ "')"//
		href: "javascript:refundBillLogOpen('" + item.id + "')"
	});
	
	return objAction;
}


function refundBillLogOpen(billId) {
	$.frontEngineDialog.executeIframeDialog('refundBillLog', '修改日志', rootPath
            + '/refundBillLog/list.do?id=' + billId, '1250', '660');
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
	
	document.forms[0].action = rootPath + "/refundBill/exportExcel.do";
	document.forms[0].billNos.value = cbox.join(",");
	console.info(document.forms[0].action);
	document.forms[0].submit();
	
	document.forms[0].action = rootPath + "/refundBill/list.do";
	document.forms[0].billNos.value = "";
	console.info(document.forms[0].action);
}

