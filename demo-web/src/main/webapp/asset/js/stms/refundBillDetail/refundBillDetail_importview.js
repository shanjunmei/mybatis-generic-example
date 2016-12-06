
function submitImport(){ 
	var isTrue=true;
	var filePath=$("#filePath").val();
	if((filePath==null || filePath=="" || typeof(filePath)=="undefined")){
		$.frontEngineDialog.executeDialogOK("上传失败","请选择上传文件！","200px");
		isTrue=false;
		return;
	}
	
	$("#refundBillDetailImportForm").submit();
}

function downloadFile() {
	var path = "/template/refundBillDetail/importRefundBillDetail.xlsx";
	window.open(rootPath + "/refundBillDetail/downFile.do?path=" + path);
}