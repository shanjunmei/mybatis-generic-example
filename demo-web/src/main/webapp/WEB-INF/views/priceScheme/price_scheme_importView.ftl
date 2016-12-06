<#include "../global.ftl" encoding="utf-8">

<!DOCTYPE html>
<html class="${sys !} ${mod !}">
<head>
<meta name="decorator" content="priceSchemeImport" />
<title></title>
</head>
<body>
	<div class="tab-content">
		<div class="tab-pane fade in active" id="myAccount">
			<form id="find-page-orderby-form" name="impotpic" enctype="multipart/form-data" action="${BasePath !}/priceScheme/importExcel.do" method="post">
				<input type="hidden" id="vendorCode" name="vendorCode" value="${vendorCode !''}" >
				<input type="hidden" id="vendorSettlementType" name="vendorSettlementType" value="${vendorSettlementType !''}" >
				<input type="hidden" id="code" name="code" value="${commodityCode !''}" >
				<table width="100%" border="0">
					<tbody>
						<tr>
							<td width="100px"><span>*</span>选择文件：</td>
							<td width="200px"><input type="file" type="file" id="filePath" name="filePath" /></td>
						</tr>
						<tr>
							<td>模板下载：</td>
							<td><a href="javascript:void(0);" onclick="downloadFile();"><font color="#39f">点击下载【导入】模板</font></a></td>
						</tr>
					</tbody>
				</table>
			</form>
		</div>
	</div>

<#include "../common/css.ftl" encoding="utf-8">
<#include "../common/js.ftl" encoding="utf-8">

<#include "../common/loadingffzx.ftl" encoding="utf-8"> 
<@load_content content="small"/>  
</body>
<script type="text/javascript">
	function submitImport(){
			var isTrue = true;
				var filePath = $("#filePath").val();
				if (filePath == null || filePath == '') {
					$.frontEngineDialog.executeDialogOK("导入失败", "请选择导入文件！",
							"200px");
					isTrue = false;
				}
				if (isTrue) {
					impotpic.submit();
				}
		}

	/**
	 * 导出商品sku列表
	 */
	function downloadFile(){
		document.forms[0].action = rootPath + "/priceScheme/exportSkuExcel.do";
		document.forms[0].submit();
		document.forms[0].action = rootPath + "/priceScheme/importExcel.do";
		/* var  path = "/template/priceScheme/importPriceScheme.xlsx";
		window.open(rootPath + path); */
	}
</script>
</html>