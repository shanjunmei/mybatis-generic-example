/**
 * 采购订单列表js
 * auto wjp
 * date 2016-10-11 10:59
 */

/**
 * 操作列自定义
 * @param item
 * @returns {___anonymous120_181}
 */
function gen_action(item) {
	console.log(item);
	var objAction = {
			add:[],
			edit:[],
			isEnabled:[]
	};
		objAction['add'].push({
			label: '新增',
			href: rootPath + "/priceScheme/form.do?viewType=0&commodityCode=" + item.commodity.code,
			class:'text-nowrap'
		});
		objAction['edit'].push({
			label: '编辑',
			href: "javascript:iframeFullPage('"+ rootPath + "/priceScheme/editListView.do?viewType=0&commodityCode=" + item.commodity.code + "')",
			class:'text-nowrap'
		});
	
	/*objAction['actFlag'].push({
		label: item.raw.status == 'CANCELED' ? "生效" : "取消生效",
		href: "javascript:isEnabled('" + item.id + "', '" + (item.raw.status == 'CANCELED' ? "ACTIVE" : "CANCELED") + "')"
	});*/
    if(item.raw.status == 'ACTIVE' && (item.raw.type == 1 || item.raw.type == 3)) {
        objAction['isEnabled'].push(
            {
                    label:  '取消生效',
                    href: "javascript:isEnabled('" + item.id + "', 'CANCELED')",
                    class:'text-nowrap'
            }
        );
    } else {
        objAction['isEnabled'].push(
             {
                    label: '取消生效',
                    class:'text-nowrap gray'
             }
        );
    }
	return objAction;
}

function isEnabled(id, status) {
//	var titleStr = "生效";
//	if (status == 0) {
		titleStr = "取消生效";
//	}
	$.frontEngineDialog.executeDialog(
		'selMenu', 
		titleStr, 
		'<i class="fa fa-question-circle fa-3x" style="color: #86CFF9;vertical-align:middle;"></i>　是否' + titleStr + '!',
		"200px", 
		"35px", 
		function() {
			$.ajax({
				url : rootPath + "/priceScheme/updateStatus.do",
				data : {
					id : id,
					status : status
				},// 给服务器的参数
				type : "POST",
				dataType : "json",
				async : false,
				cache : false,
				success : function(result) {
					if (result.status == 'success' || result.code == 0) {
						$.frontEngineDialog.executeDialogContentTime(result.infoStr,2000);
						// SSUI: 重新载入当前页的数据
						reloadData('data_list');
					} else {
						$.frontEngineDialog.executeDialogContentTime(result.infoStr,2000);
					}
				}
			});
		});
}

/*
 * 供应商选择框
 */
$("#vendorPartner").on("click", function() {
	$.frontEngineDialog.executeIframeDialog('vendor_select_commodity', '选择供应商',  rootPath + '/priceScheme/selectVendor.do', '1000', '600');
});

/*
 * 商品选择框
 */
$("#commodiySelectBox").on("click", function() {
	$.frontEngineDialog.executeIframeDialog('commodiySelectBox', '选择商品',  rootPath + '/priceScheme/selectCommodity.do', '1000', '600');
});

$(".selectDel").on("click", function (event) {
	event.stopImmediatePropagation();//阻止剩余的事件处理函数执行并且防止事件冒泡到DOM树上
	$(this).siblings("input").each(function () {
		$(this).val("");
    });
});


/*
 * 点击编号查看生效方案明细
 */
function toDetailed(data, type, full, meta) {
	if (data == null || data == 'undefined') {
		return "";
	}
    var codeLing='<a href="javascript:iframeFullPage(\''+ rootPath + '/priceScheme/form.do?viewType=1&commodityCode=' + full.commodity.code + '&id=' + full.id + '\')">'+data+'</a>';
    return codeLing;
}

/*
 * 点击编号查看备选方案明细
 */
function toStandbyDetailed(data, type, full, meta) {
	if (data == null || data == 'undefined') {
		return "";
	}
    var codeLing='<a href="javascript:iframeFullPage(\''+ rootPath + '/priceScheme/form.do?viewType=1&commodityCode=' + full.commodity.code + '&id=' + full.priceScheme.id + '\')">'+data+'</a>';
    return codeLing;
}


function isNotNull(dom) {
	if (dom != null && dom != undefined && dom != '') {
		return true;
	} else {
		return false;
	}
}    

/*
* 导入
*/
function showDown(){
	var vendorCode = $("form").find("input[name='vendor.code']");
	var vendorSettlementType = $("form").find("input[name='vendor.settlementType']");
	var commodityCode = $("form").find("input[name='commodity.code']");
	if(!isNotNull(vendorCode.val())){
		$.frontEngineDialog.executeDialogContentTime('请先选择供应商！', 1000);
		return ;
	}
	
	var url = rootPath + '/priceScheme/importView.do?vendorCode=' + vendorCode.val() 
		+ '&vendorSettlementType=' + vendorSettlementType.find("option:selected").val() + '&commodityCode=' + commodityCode.val();
	//console.log(url);
	var dlg=dialog({
	  id: "printerForm",
	  title: '导入excel',
	  lock: false,
	  content:"<iframe  id='printerForm' src="+url+" width='500px' height='210px' frameborder='0' scrolling='no'></iframe>",
	  button: [
			{
			     value: '上传',
			     callback: function () { 
			     	document.getElementById("printerForm").contentWindow.submitImport();
			     	return false;
			     },
			},
	        {
	            value: '关闭',
	            callback: function () {
	            	 console.log("t");
	            	 return true;
	             }
	        }
	    ]
	}).showModal(); 
}


/*
* 导出
*/
function exportExcel() {
	document.forms[0].action = rootPath + "/priceScheme/exportExcel.do";
	
	document.forms[0].submit();
	
	document.forms[0].action = rootPath + "/priceScheme/list.do";
}

