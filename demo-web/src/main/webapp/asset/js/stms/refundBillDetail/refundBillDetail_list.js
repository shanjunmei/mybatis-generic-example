function gen_action(item,queryid) {
	var queryid=$("#queryid").val();
	var objAction = {
			edit:[],
			cancel: [],
	       
	};
	if(0==queryid){
		
	}
	
	if((queryid==null || queryid=="" || typeof(queryid)=="undefined")){
		objAction['edit'].push({
			label: '编辑'
				//class:'inline-edit'
		});
	}
	
	return objAction;
}

function initEdit() {
	var div = $("div#billDetail_list");
	var trs = div.find("div.dataTables_scrollBody table#dt_billDetail_list tbody tr");
	trs.each(function(index, dom) {
		$(dom).find("a.action_edit").each(function(ind, inp) {
			$(inp).focus(function() {
				editRefund(inp);
			})
		});
	});
}

function editRefund(th){
	var currTr = $(th).closest('tr');
	var currTrIndex = currTr.attr("trRow"); 
	var $input_curr=currTr.find("#input_"+currTrIndex);
	var $span_curr=currTr.find("#span_"+currTrIndex);
	if (typeof $(th).data('saved') != 'undefined' && $(th).data('saved') == 'N') {
		$(th).html('编辑').data('saved', 'y');
		var newRefundableAmount =$input_curr.val();
		var oldRefundableAmount =$span_curr.text();
		var billId=currTr.find("input[type='checkbox']").val();
		 $.ajax({
				url: rootPath+"/refundBillDetail/refundBillDetailEdit.do",
				type:'POST',
				data:{"billId":billId,"newRefundableAmount":newRefundableAmount},
				async:false,
				dataType: 'json',
				success: function(data){
					if(data == null || data == "fail"){
						 $.frontEngineDialog.executeDialogContentTime('修改失败');
						return;
					}
					$span_curr.text(newRefundableAmount);
					$input_curr.hide();
					$span_curr.show();
					$("#refundBillTotalCountVal").text(data);
				}//end success 
			});//end ajax	
	}else{
		$(th).html('保存').data('saved', 'N');
		$input_curr.show();
		$span_curr.hide();
	}
}



function subMitRefundMsg(th){
	 dialog({
         id: "delete_table_info",
         icon:'succeed',
         title: "信息",
         width:200,
         height:50,
         content: '<i class="fa fa-question-circle fa-3x" style="color: #86CFF9;vertical-align:middle;"></i>　是否更改自定义库存数量!',
         button: [
                  {
                      value: '确定',
                      callback: function(){
                    	  subMitRefund(th)
                      }
                  },
                  {
                      value: '取消',
                      callback: function(){
                      	recovery1(th);
                      }
                  }
                  
              ]
     }).showModal();
}

function subMitRefund(th){
	$(th).html('编辑')
	var currTr = $(th).closest('tr');
	var currTrIndex = currTr.attr("trRow"); 
	var newRefundableAmount =currTr.find("#input_"+currTrIndex).val();
	var oldRefundableAmount =currTr.find("#span_"+currTrIndex).val();
	alert("旧的应退金额："+oldRefundableAmount);
	currTr.find("#span_"+currTrIndex).text(newRefundableAmount);
	currTr.find("#input_"+currTrIndex).hide();
	currTr.find("#span_"+currTrIndex).show();
}

function recovery1(th){
	$(th).html('保存');
	var currTr = $(th).closest('tr');
	var currTrIndex = currTr.attr("trRow"); 
	var oldRefundableAmount =currTr.find("#span_"+currTrIndex).val();
	currTr.find("#input_"+currTrIndex).val(oldRefundableAmount);
	currTr.find("#input_"+currTrIndex).hide();
	currTr.find("#span_"+currTrIndex).show();
}

function reloadPageData(infoData) {
	$("#refundBillTotalCountVal").text(parseFloat(infoData).toFixed(2));
	reloadData("billDetail_list");
}


/*
* 导出
*/
function exportExcel() {
	var billNo=$("#billNo").val();
	document.forms[0].action = rootPath + "/refundBillDetail/export.do?billNo="+billNo;
	
	document.forms[0].submit();
	
	document.forms[0].action = rootPath + "/refundBillDetail/list.do";
}
