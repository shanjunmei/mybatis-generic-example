<!DOCTYPE html>
<html>
<head>
	<meta name="decorator" content="list"/>
	<title>退款账单导入信息提示</title>
	<style type="text/css">
		html,body,body div{height:100% !important;}
		.box-body{overflow: auto;}
	</style>
</head>
<body style="height: 200px; width: 90%; overflow: auto; padding-left: 20px;">
	<div >
		${msg !''}
	</div>
	<div  style="margin-top: 10px;">
		<input type="button" class="btn btn-default" value="确定" onclick="loadDetailToTable()" />
		<input type="button" class="btn btn-default" value="返回" onclick="history.go(-1);" />
	</div>
	
	
<#include "../../common/css.ftl" encoding="utf-8">
<#include "../../common/js.ftl" encoding="utf-8">
<#include "../../common/loadingffzx.ftl" encoding="utf-8"> 
<@load_content content="small"/>
<script type="text/javascript">
	function loadDetailToTable() {
		//关闭弹窗窗
		var data = '${refundBillTotalCount !""}';
		window.parent.reloadPageData(data);
		var $close = $(parent.document.getElementById('title:refunBillDetailForm')).prev();
		$close.click();
	}
</script>
</body>
</html>