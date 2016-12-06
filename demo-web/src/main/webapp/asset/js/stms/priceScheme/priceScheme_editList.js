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

	var objAction = {
			edit:[],
			'delete':[]
	};
	if (item.raw.status == 'INEFFECTIVE' || item.raw.status == 'CANCELED') {
		objAction['edit'].push({
			label: '修改',
			href: rootPath + "/priceScheme/form.do?commodityCode=" + item.commodity.code + "&id=" + item.id + "&viewType=0"
//			href: "javascript:edit('" + item.id + ", " + item.commodity.code + ", " + 0 + "')"
//			href: "javascript:edit('" + item.id + "', '" + item.commodity.code + "')"
		});
		objAction['delete'].push({
			label: '删除',
			href: rootPath + "/priceScheme/delete.do?id=" + item.id
		});
	} else {
		objAction['edit'].push({
			label: '修改',
			class: 'gray'
		});
		objAction['delete'].push({
			label: '编辑',
			class: 'gray'
		});
	}
	return objAction;
}

function edit(id, commodityCode) {
	var url = rootPath + "/priceScheme/form.do?commodityCode=" + commodityCode + "&id=" + id + "&viewType=0";
	var dlg = dialog(
			{
				id : "edit",
				title : '修改SKU价格方案',
				lock : false,
				content : "<iframe src="
						+ url
						+ " width='1200px' height='600px' frameborder='0' scrolling='no' id='printerForm'></iframe>",
				button : [
						{
							value : '保存',
							callback : function() {
								// document.getElementById("printerForm").submit();
								// //
								var printerPage = document.getElementById("printerForm").contentWindow;
								printerPage.document.getElementById("savePriceScheme").click();
								return false;
							}
						// autofocus: true //Boolean (默认值:false) 是否自动聚焦
						}, {
							value : '返回',
							callback : function() {
								return true;
							}
						} ]
			}).showModal();

}

function isEnabled(id, status) {
	var titleStr = "启用";
	if (status == 0) {
		titleStr = "禁用";
	}

	$.frontEngineDialog.executeDialog(
		'selMenu', 
		titleStr, 
		'是否确定' + titleStr+ '？', 
		"200px", 
		"35px", 
		function() {
			$.ajax({
				url : rootPath + "/vendor/updateActFlag.do",
				data : {
					vendorId : id,
					actFlag : status
				},// 给服务器的参数
				type : "POST",
				dataType : "json",
				async : false,
				cache : false,
				success : function(result) {
					if (result.status == 'success' || result.code == 0) {
						dialog({
							quickClose : true,
							content : '操作成功！'
						}).show();
						
						// SSUI: 重新载入当前页的数据
						reloadData('vendor_list');
					} else {
						$.frontEngineDialog.executeDialogContentTime(result.infoStr,2000);
					}
				}
			});
		});
}
