<!DOCTYPE html>
<html>
<head>
<meta name="decorator" content="list" />
<title></title>
</head>
<body>
	<div class="tab-content">
		<div class="tab-pane fade in active" id="myAccount">
			<form  name="refundBillDetailImportForm" id="refundBillDetailImportForm" enctype="multipart/form-data" action="${BasePath !}/refundBillDetail/importExcel.do" method="post">
				<input type="hidden" id="billNo" name="billNo" value="" >
				<table width="100%" border="0">
					<tbody>
						<tr>
							<td width="100px"><span>*</span>选择文件：</td>
							<td width="200px"><input type="file" type="file" id="filePath" name="filePath" /></td>
						</tr>
						<tr>
							<td>模板下载：</td>
							<td>
								<a href="javascript:void(0);" onclick="downloadFile();"><font color="#39f">点击下载导入模板</font></a>
							</td>
						</tr>
					</tbody>
				</table>
			</form>
		</div>
		<script src="${BasePath !}/asset/js/stms/refundBillDetail/refundBillDetail_importview.js?ver=${ver !}" type="text/javascript"></script>
	</div>
	<#include "../../common/loadingffzx.ftl" encoding="utf-8">
	<@load_content content="small"/>
</body>
</html>