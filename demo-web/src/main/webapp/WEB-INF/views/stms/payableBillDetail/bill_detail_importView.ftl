<#include "../../global.ftl" encoding="utf-8">

<!DOCTYPE html>
<html class="${sys !} ${mod !}">
<head>
<meta name="decorator" content="billDetail" />
<title></title>
</head>
<body>
	<div class="tab-content">
		<div class="tab-pane fade in active" id="myAccount">
			<form id="find-page-orderby-form" name="impotpic" enctype="multipart/form-data" action="${BasePath !}/payableBillDetail/importExcelDetail.do" method="post">
				<input type="hidden" id="billNo" name="billNo" value="" >
				<table width="100%" border="0">
					<tbody>
						<tr>
							<td width="100px"><span>*</span>选择文件：</td>
							<td width="200px"><input type="file" type="file" id="filePath" name="filePath" /></td>
						</tr>
					</tbody>
				</table>
			</form>
		</div>
	</div>

<#include "../../common/css.ftl" encoding="utf-8">
<#include "../../common/js.ftl" encoding="utf-8">
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
		</script>
<#include "../../common/loadingffzx.ftl" encoding="utf-8"> 
<@load_content content="small"/>  
</body>
</html>