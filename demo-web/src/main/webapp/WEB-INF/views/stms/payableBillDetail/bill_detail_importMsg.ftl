<#include "../../global.ftl" encoding="utf-8">

<!DOCTYPE html>
<html class="${sys !} ${mod !}">
<head>
	<meta name="decorator" content="detail"/>
	<title>商品条形码导入信息提示</title>
</head>
<body style="height: 200px; width: 90%; overflow: auto; padding-left: 20px;">
	<div class="row">
		${msg !''}
	</div>
	<div class="row" style="margin-top: 10px;">
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
		var data = jQuery.parseJSON('${infoData !""}');
		window.parent.reloadPageData(data);
		var $close = $(parent.document.getElementById('title:importExcelDetailDialog')).prev();
		$close.click();
	}
</script>
</body>
</html>