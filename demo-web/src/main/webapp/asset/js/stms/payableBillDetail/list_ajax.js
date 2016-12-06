/**
 * 应付账单明细列表js
 * auto wjp
 * date 2016-11-08 09:33
 */

/**
 * 判断是否为空
 * @param dom
 * @returns {Boolean}
 */
function isNotNull(dom) {
	if (dom != null && dom != undefined && dom != '') {
		return true;
	} else {
		return false;
	}
}

/**
 * 初始化供货价或扣点值改变事件和获得光标事件
 */
function initSupplyOrPointsChangeOrFocus() {
	var div = $("div#bill_audit_list");
	var trs = div.find("div.dataTables_scrollBody table#dt_bill_audit_list tbody tr");
	trs.each(function(index, dom) {
		$(dom).find("input[name^='supply_'], input[name^='points_']").each(function(ind, inp) {
			$(inp).change(function() {
				supplyOrPointsChange(inp);
			});
			
			/*$(inp).focus(function() {
				editFocus(inp);
			});*/
		});
	});
}

/**
 * 供货价或扣点值改变事件
 * @param th
 */
function supplyOrPointsChange(th) {
	//当前修改行
	var currTr = $(th).closest("tr");
	var currTrIndex = currTr.attr("trRow");
	var supply = currTr.find("input[id^='supply_']").val();
	var points = currTr.find("input[id^='points_']").val();
	var buyNum = currTr.find("input[id^='buyNum_']").val();
	var commodityPriceTotal = currTr.find("input[id^='commodityPriceTotal_']").val();
	var settlementPattern = currTr.find("input[id^='settlementPattern_']").val();
	var supplyAmount = currTr.find("input[id^='supplyAmount_']");
	var pointsAmount = currTr.find("input[id^='pointsAmount_']");
	var payableAmount = currTr.find("input[id^='payableAmount_']");
	var payableObtainAmount = currTr.find("input[id^='payableObtainAmount_']");
	if (settlementPattern == "1") {
		if (isNotNull(buyNum) && isNotNull(supply)) {
			if (!(isNaN(buyNum) || isNaN(supply))) {
				var supplyAmountVal = (parseFloat(buyNum)
				* parseFloat(supply)).toFixed(2);
				supplyAmount.val(supplyAmountVal);
				currTr.find("td.supplyAmount").text(supplyAmountVal);
				payableAmount.val(supplyAmountVal);
				currTr.find("td.payableAmount").text(supplyAmountVal);
				var payableObtainAmountVal = (parseFloat(commodityPriceTotal) - supplyAmountVal).toFixed(2);
				payableObtainAmount.val(payableObtainAmountVal);
				currTr.find("td.payableObtainAmount").text(payableObtainAmountVal);
			}
		}
	} else if (settlementPattern == "0") {
		if (isNotNull(commodityPriceTotal) && isNotNull(points)) {
			if (!(isNaN(commodityPriceTotal) || isNaN(points))) {
				var pointsAmountVal = (parseFloat(commodityPriceTotal) * (parseFloat(points) / 100)).toFixed(4);
				pointsAmount.val(pointsAmountVal);
				currTr.find("td.pointsAmount").text(pointsAmountVal);
				var payableAmountVal = (parseFloat(commodityPriceTotal) - pointsAmountVal).toFixed(2);
				payableAmount.val(payableAmountVal);
				currTr.find("td.payableAmount").text(payableAmountVal);
				var payableObtainAmountVal = (parseFloat(commodityPriceTotal) - payableAmountVal).toFixed(2);
				payableObtainAmount.val(payableObtainAmountVal);
				currTr.find("td.payableObtainAmount").text(payableObtainAmountVal);
			}
		}
	}
	
}

/**
 * 初始化编辑按钮事件
 */
function initEditClick() {
	var div = $("div#bill_audit_list");
	var trs = div.find("div.dataTables_scrollBody table#dt_bill_audit_list tbody tr");
	trs.each(function(index, dom) {
		$(dom).find("a[id^='audit_'][class*='edit']").each(function(ind, inp) {
			$(inp).click(function() {
				editClick(inp);
			})
		});
	});
}

/**
 * 编辑事件
 * @param th
 */
function editClick(th) {
	var editBtn = $(th);
	var currTr = editBtn.closest("tr");
	var currTrIndex = currTr.attr("trRow");
	var settlementPattern = currTr.find("input[id^='settlementPattern_']").val();
	var supply = currTr.find("input[id^='supply_']");
	var points = currTr.find("input[id^='points_']");
	if (editBtn.text() == "编辑") {
		//不存在已经编辑过但未保存的数据时才继续
		if (editFocus(th)) {
			if (settlementPattern == "1" && isNotNull(supply)) {
				supply.prev("span").hide();
				supply.show();
			} else if (settlementPattern == "0" && isNotNull(points)) {
				points.prev("span").hide();
				points.show();
			}
			
			editBtn.text("保存");
			editBtn.removeClass("edit");
			editBtn.addClass("save");
			editBtn.unbind("click", saveClick);
			editBtn.bind("click", saveClick);
		}
	}
}

/**
 * 保存事件
 */
function saveClick() {
	var th = this;
	dialog({
        id: "payableBillDetailSaveMsg",
        icon:'succeed',
        title: "提示",
        width:"200",
        content: "是否确定保存，保存后不可更改，请确认",
        button: [
                 {
                     value: '确定',
                     callback: function (){
                    	var flag = true;
                		var data = "";
                		var rowData = $(th).closest("tr");
                		var trIndex = rowData.attr("trRow");
                		var id = rowData.find("input[name='id_" + trIndex + "']").val();
                		var billNo = $("#billNo").val();
                		var supply = rowData.find("input[name='supply_" + trIndex + "']").val();
                		var points = rowData.find("input[name='points_" + trIndex + "']").val();
                		var settlementPattern = rowData.find("input[name='settlementPattern_" + trIndex + "']").val();
                		var supplyAmount = rowData.find("input[name='supplyAmount_" + trIndex + "']").val();
                		var pointsAmount = rowData.find("input[name='pointsAmount_" + trIndex + "']").val();
                		var payableAmount = rowData.find("input[name='payableAmount_" + trIndex + "']").val();
                		var payableObtainAmount = rowData.find("input[name='payableObtainAmount_" + trIndex + "']").val();
                		if (("1" == settlementPattern && !isNotNull(supply)) 
                				|| ("0" == settlementPattern && !isNotNull(points))) {
            				$.frontEngineDialog.executeDialogContentTime(
            						'填写内容不完整，保存不成功！', 1000);
            				return;
                		}
                		
                		data = "{'id':'" + id + "'";
                		data += ", 'billNo':'" + billNo + "'";
                		data += ", 'settlementPattern':'" + settlementPattern + "'";
                		if ("1" == settlementPattern && isNotNull(supply)) {
                			data += ", 'supply':'" + supply + "'";
                			data += ", 'supplyAmount':'" + supplyAmount + "'";
                		} else if ("0" == settlementPattern && isNotNull(points)) {
                			data += ", 'points':'" + points + "'";
                			data += ", 'pointsAmount':'" + pointsAmount + "'";
                		}
                		
                		data += ", 'payableAmount':'" + payableAmount + "'";
                		data += ", 'payableObtainAmount':'" + payableObtainAmount + "'}";
                		//替换tab空格
                		data = data.replace(/[	]/g,"");
                		common_doSave(rootPath + "/payableBillDetail/save.do", "post", null, {"dataJson": data}, function(resultData) {
                			if (resultData && 'success' == resultData.status) {		//成功
                	 			$.frontEngineDialog.executeDialogContentTime('成功！',1000);
                	 			setTimeout(function() {
                	 				reloadPageData(resultData.infoData);
                				}, 1000);
                			} else if((resultData && 'error' == resultData.status)){		//错误
                	     		$.frontEngineDialog.executeDialogContentTime(resultData.infoStr,4000);
                	     	}else if((resultData && 'exception' == resultData.status)){		//异常
                	     		$.frontEngineDialog.executeDialogContentTime(resultData.infoStr,4000);
                	     	}
                		});
                     }
                 },
                 {
                     value: '返回'
                 }
                 
             ]
    }).showModal();
}

/**
 * 刷新页面相关数据
 */
function reloadPageData(infoData) {
	if (isNotNull(infoData.supplyTotal) 
				&& !isNaN(infoData.supplyTotal)) {
			$("#supplyTotal").text(parseFloat(infoData.supplyTotal).toFixed(2));
		}
		
		if (isNotNull(infoData.pointsAmountTotal) 
				&& !isNaN(infoData.pointsAmountTotal)) {
			$("#pointsAmountTotal").text(parseFloat(infoData.pointsAmountTotal).toFixed(2));
		}
		
		if (isNotNull(infoData.payableAmountTotal) 
				&& !isNaN(infoData.payableAmountTotal)) {
			$("#payableAmountTotal").text(parseFloat(infoData.payableAmountTotal).toFixed(2));
		}
		
		if (isNotNull(infoData.payableObtainAmountTotal) 
				&& !isNaN(infoData.payableObtainAmountTotal)) {
			$("#payableObtainAmountTotal").text(parseFloat(infoData.payableObtainAmountTotal).toFixed(2));
		}
		
		reloadData("bill_audit_list");
}

/**
 * 供货价、扣点获得光标事件
 * @param th
 */
function editFocus(th) {
	//当前光标进入行
	var currTr = $(th).closest("tr");
	var currTrIndex = currTr.attr("trRow");
	//被编辑过的应付账单明细数据
	var editTr;
	var editTrIndex;
	var editSkuBarCode;
	var editSettlementPattern;
	var editSavea;
	var editOldSupply;
	var editOldPoints;
	var div = $("div#bill_audit_list");
	div.find("div.dataTables_scrollBody table#dt_bill_audit_list tbody tr").each(function(index, dom) {
		var tr = $(dom);
		var trRow = tr.attr("trRow");
		var skuBarCode = tr.find("input[id^='skuBarCode_']").val();
		var settlementPattern = tr.find("input[id^='settlementPattern_']").val();
		var oldSupply = tr.find("input[id^='oldSupply_']").val();
		var oldPoints = tr.find("input[id^='oldPoints_']").val();
		var savea = tr.find("a[id^='audit_'][class*='save']");
		if (savea != null && savea.length > 0){
			editTr = tr;
			editTrIndex = trRow;
			editSkuBarCode = skuBarCode;
			editSettlementPattern = settlementPattern;
			editSavea = savea;
			editOldSupply = oldSupply;
			editOldPoints = oldPoints;
			return false;
		}
	});
	
	if (isNotNull(editTrIndex) && currTrIndex != editTrIndex) {
		dialog({
            id: "replenishEditFocusMsg",
            icon:'succeed',
            title: "提示",
            width:"200",
            content: "应付账单明细，条形码：" + editSkuBarCode + "未保存，是否保存该行数据",
            button: [
                     {
                         value: '是',
                         callback: function() {
                        	 editSavea.click();
                         }
                     },
                     {
                         value: '否',
                         callback: function (){
                        	 //回到未处理状态
                        	 if ("1" == editSettlementPattern) {
                        		 var supply = editTr.find("input[id^='supply_']");
                        		 supply.val(editOldSupply);
                        		 supply.change();
                        		 supply.prev("span").show();
                        		 supply.hide();
                        	 } else if ("0" == editSettlementPattern) {
                        		 var points = editTr.find("input[id^='points_']");
                        		 points.val(editOldPoints);
                        		 points.change();
                        		 points.prev("span").show();
                        		 points.hide();
                        	 }
                        	 
                        	 var savea = editTr.find("a[id^='audit_']");
                        	 savea.text("编辑");
                        	 savea.removeClass("save");
                        	 savea.addClass("edit");
                        	 savea.unbind("click", saveClick);
                         }
                     }
                     
                 ]
        }).showModal();
		return false;
	} else {
		return true;
	}
}

/**
 * 导出应付账单明细
 * @param th
 */
function exportExcelDetail(billNo) {	
	document.forms[0].action = rootPath + "/payableBillDetail/exportExcelDetail.do?billNo=" + billNo;
	console.info(document.forms[0].action);
	document.forms[0].submit();
	
	document.forms[0].action = rootPath + "/payableBillDetail/bill_detail_listAjax.do";
	console.info(document.forms[0].action);
}

/**
 * 应付账单明细导入修改
 * @param th
 */
function importExcelDetail(th) {
	var billNo = $("#billNo").val();
	if(!isNotNull(billNo)){
		$.frontEngineDialog.executeDialogContentTime('请先选择应付账单！', 1000);
		return ;
	}
	
	var url = rootPath + '/payableBillDetail/importExcelDetailView.do';
	var d = dialog({
		id:"importExcelDetailDialog",
	    title: '条形码导入',
	    content:"<iframe src=" + url + " width='500px' height='210px' frameborder='0' scrolling='no' id='billDetailForm'></iframe>",
	    button: [
 	        {
 	            value: '导入',
 	            callback: function () {
 	            	var dialogVew = document.getElementById("billDetailForm").contentWindow;
 	            	dialogVew.document.getElementById("billNo").value = billNo;
 	            	dialogVew.submitImport();
 	            	return false;
 	            },
 	        },
 	        {
 	            value: '取消',
 	            callback: function () {
 	            }
 	        }
 	    ]
	}).show();
}

/**
 * 提交
 */
function submitClick(th) {
	//被编辑过的应付账单明细数据
	var editTr;
	var editTrIndex;
	var div = $("div#bill_audit_list");
	div.find("div.dataTables_scrollBody table#dt_bill_audit_list tbody tr").each(function(index, dom) {
		var tr = $(dom);
		var trRow = tr.attr("trRow");
		var skuBarCode = tr.find("input[id^='skuBarCode_']").val();
		var savea = tr.find("a[id^='audit_'][class*='save']");
		if (savea != null && savea.length > 0){
			editTr = tr;
			editTrIndex = trRow;
			return false;
		}
	});
	
	if (isNotNull(editTrIndex)) {
		$.frontEngineDialog.executeDialogContentTime("请先保存第[" + (parseInt(editTrIndex) + 1) + "]行数据！", 2000);
		return ;
	}
	
	var url = rootPath + "/payableBillDetail/audit.do";
	var id = $("#id").val();
	var data = {"id": id};
	common_doSave(url, "post", null, data);
};