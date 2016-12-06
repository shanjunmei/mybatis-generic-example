function gen_action(item,status) {
	var objAction = {
			SBC:[],
			SBCLOG:[]
	};
	
	
	objAction['SBC'].push({
		label: '付款',
		href: "javascript:iframeFullPage('"+ rootPath + "/settleBill/form.do?id="+item.id+"&viewType=1')"
	});
	
	objAction['SBCLOG'].push({
		label: '结款日志',
		href: "javascript:iframeFullPage('"+ rootPath + "/settleBill/log.do?settleNo="+item.code+"')"
	});
	
	
	return objAction;
}

/*
 * 点击结款单号查看明细
 */
function toDetailed(data, type, full, meta){
    var codeLing='<a href="javascript:iframeFullPage(\''+ rootPath + '/settleBill/form.do?id='+full.id+'\')">'+data+'</a>';
    return codeLing;
}


//选择供应商
function vendorPopupFrom() {
	$.frontEngineDialog.executeIframeDialog('vendor_select_stms', '选择供应商', rootPath
	    + '/refundBill/listSelectVendor.do', '1000', '600');
}


/*
* 导出
*/
function exportExcel() {
	var _selectAll=$("#_selectAll").is(":checked");
	var exportUrl=rootPath+"/settleBill";
	var params=$("#find-page-orderby-form").form2Json();

	if(_selectAll){
		exportUrl=exportUrl+"/export.do";
		
	}else{
		var selectData=_data_list.getSelectedData().raw;
		if(selectData.length==0){
			$.frontEngineDialog.executeDialogContentTime("请选择需要导出的单据","4000");
			return;
		}
		var p=[];
		for(var i=0;i<selectData.length;i++){
			p.push({"numbers":selectData[i].code});
			/*if(p==null){
				p="numbers="+selectData[i].billNo;
			}else{
				p=p+"&numbers="+selectData[i].billNo;
			}*/
		}
		exportUrl=exportUrl+"/exportSelect.do";
		params=p;
	}
	FFZX.download(exportUrl,params);
		
	/*document.forms[0].action = rootPath + "/settleBill/export.do";
	
	document.forms[0].submit();
	
	document.forms[0].action = rootPath + "/settleBill/list.do";*/
}

function openBillList(){
	var url=rootPath+"/settleBill/billList.do";
	//window.open(url);
	FFZX.openPageTab('434152ed846547fbb42e7d377155e737', {});
}



