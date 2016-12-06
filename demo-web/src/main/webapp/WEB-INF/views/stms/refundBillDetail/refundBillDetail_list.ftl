<html>
<head>
<meta name="decorator" content="list" />
<title>退货账单详情</title>
<style type="text/css">
    .inline-edit{
        display:none;
    }
    .inline-cancel{
        display:none;
    }
</style>
<#include "../../common/share_macro.ftl" encoding="utf-8">
</head>
<body>
<ul class="nav nav-tabs" style="padding-left: 1%;">
      <li class="active"><a href="#">退货账单<#if queryid?? && queryid == '0'>查看<#else><#if bill.id ??>编辑</#if></#if></a></li>
  </ul>
    <input type="hidden" name="queryid" id="queryid" value="${(queryid) !}" />
	<div class="tab-content">
		<div class="tab-pane fade in active" id=billDetailList>
		<div class="row">
			<div class="col-lg-10 col-md-12 col-sm-12" style="padding-top: 10px;">
				<div class="search">
				<div class="inquire-ul">
					<div class="form-tr">
						    <div class="form-td">
								<label>退款账单号：</label> 
								<div class="div-form">
									<input type="hidden" id="billNo" name="billNo" value="${(billNo) !}" >
								 <div>${(billNo) !}</div>
								</div>  
							</div>
							<div class="form-td"> 
								<label>单据状态：</label> 
								<div class="div-form">
								<input type="hidden" id="billStatus" name="billStatus" value="${(bill.billStatus) !}" >
								 <div>${(bill.billStatus) !}</div>
								</div>  
							</div>
						</div>
						<div class="form-tr">
							 <div class="form-td">
								<label>供应商编码：</label> 
								<div class="div-form">
								<input type="hidden" id="vendorCode" name="vendorCode" value="${(bill.vendorCode) !}" >
								 <div>${(bill.vendorCode) !}</div>
								</div>  
							</div>
							 <div class="form-td">
								<label>供应商名称：</label> 
								<div class="div-form">
								<input type="hidden" id="vendorName" name="vendorName" value="${(bill.vendorName) !}" >
								<div>${(bill.vendorName) !}</div>
								</div>  
							</div>
						</div>
						<div class="form-tr">
							 <div class="form-td">
								<label>商品总价合计：</label> 
								<div class="div-form">
								<input type="hidden"  id="goodsTotalCount" name="goodsTotalCount" value="${(bill.goodsTotalCount) !}元" >
								<div>${(bill.goodsTotalCount?string('0.00')) !}元</div>
								</div>  
							</div>
							 <div class="form-td">
								<label>退款账单金额：</label> 
								<div class="div-form">
								<input type="hidden" id="refundBillTotalCount" name="refundBillTotalCount"value="${(bill.refundBillTotalCount) !}元" >
								<div> <span id="refundBillTotalCountVal">${(bill.refundBillTotalCount?string('0.00')) !}元</span></div>
								</div>  
							</div>	
					   </div>
					 </div>  
					<form id="find-page-orderby-form" action="${BasePath !}/refundBillDetail/list.do" method="post">
						<input id="find-page-index" type="hidden" name="pageIndex" value="1" /> 
						<input id="find-page-count" type="hidden" value="${(pageObj.pageCount) !}" />
                        <input id="find-page-size" type="hidden" name="pageSize" value="${(pageObj.pageSize) !}" />
                       <!--  <input type="hidden" id="billNo" name="billNo" value="${(billNo) !}" > -->
						<div class="inquire-ul">
						<div class="form-tr">
								<div class="form-td">
									<label>销售订单单号：</label> 
									<div class="div-form"><input id="orderNo" name="orderNo" class="form-control txt_mid input-sm" type="text" placeholder="" value="${(billDetail.orderNo) !}"></div>
								</div>
								<div class="form-td">
					    		<label>支付时间：</label> 
								<div class="div-form">
							      <input name=payTimeStart id="payTimeStart" class="form-control txt_mid input-sm"  readonly="readonly"
							      onfocus="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm:ss',maxDate:'#F{$dp.$D(\'payTimeStart\')}'})"
                                   value="${(payTimeStart) !}">
                                 </div> -  
                                 <div class="div-form">
                                   <input name="payTimeEnd" id="payTimeEnd" class="form-control txt_mid input-sm"  readonly="readonly"
                                    onfocus="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm:ss',minDate:'#F{$dp.$D(\'payTimeEnd\')}'})"
                                    value="${(payTimeEnd) !}">
                                 </div>
								</div>
						    </div>
								<div class="form-td">
									<label>商品条形码/商品名称：</label> 
									<div class="div-form"><input id="commoditBrcodeName" name="commoditBrcodeName" class="form-control txt_mid input-sm" type="text" placeholder="" value="${(commoditBrcodeName) !}"></div>
								</div>
								<div class="form-td">
									<label>退款单号：</label> 
									<div class="div-form"><input id="refundNo" name="refundNo" class="form-control txt_mid input-sm" type="text" placeholder="" value="${(billDetail.refundNo) !}"></div>
								</div>
					        </div>
						</div>
						<div class="btn-div3">
							<button id="find-page-orderby-button" class="btn btn-primary btn-sm btn-inquire" type="button"><i class="fa fa-search"></i>&nbsp;&nbsp;查询</button>
							<button class="btn btn-primary btn-sm btn-clear-keyword"  data-target="billDetail_list"><i class="fa fa-trash-o"></i>&nbsp;&nbsp;清空</button> 
							<#if queryid?? && queryid == '0'>
							
							<#else>
								<@permission name="stms:refundBill:audit">
								<a onclick="exportExcel()" class="btn btn-primary btn-sm" ><i class="fa fa-arrow-circle-up"></i>&nbsp;&nbsp;导出</a>
								</@permission>
								<@permission name="stms:refundBillDetail:importExcel">
								<a id="import_button" class="btn btn-primary btn-sm" ><i class="fa fa-plus" ></i>&nbsp;&nbsp;导入</a>
								</@permission>
							</#if>
						</div>
					</form>
				</div>
				</div>
			</div>
			 <div id="billDetail_list" class="ff_DataTable"></div>
		</div>
	</div>   
			<div class="col-md-12">
				<div class="btn-div" style="float: right;">
		             <#if queryid?? && queryid == '0'>
		             <input type="button" id="returnBack" class="btn btn-default btn-close-iframeFullPage"  value="返回">
		             <#else>
					 <input type="button" id="submitBtn" class="btn btn-primary" value="提交">
					 <input type="button" id="returnBack" class="btn btn-default btn-close-iframeFullPage"  value="返回">
		             </#if>
				</div>
			</div>

<#include "../../common/tree.ftl" encoding="utf-8">
<link rel="stylesheet"  href="${BasePath}/asset/js/control/ztree/css/pageleft.css" type="text/css"> 
<link rel="stylesheet"  href="${BasePath !}/asset/js/control/ztree/css/tree_artdialog.css" type="text/css"> 
<script src="${BasePath !}/asset/js/stms/refundBillDetail/refundBillDetail_list.js?ver=${ver !}" type="text/javascript"></script>
<script type="text/javascript">
$(document).ready(function(){	
	var billNo=$("#billNo").val();
	var queryid=$("#queryid").val();
	requirejs(['ff/init_datatable'], function(initDataTable){
		dt_demo_list = new initDataTable({
			div_id: 'billDetail_list',
			url: rootPath + "/refundBillDetail/list.do?billNo="+billNo,
			columns:[
				{ data: "orderNo", label: '销售订单号', class:'text-nowrap' },
				{ data: "payTime", label: '支付时间', class:'text-nowrap',format:{datetime:'yyyy-MM-dd HH:mm:ss'}},
				{ data: "refundTime", label: '退款账时间',format:{datetime:'yyyy-MM-dd HH:mm:ss'}},
				{ data: "refundNo", label: '退款单号', class:'text-nowrap'},
				{ data: "skuBarCode", label: '商品条形码', class:'text-nowrap'},
				{ data: "commodityName", label: '商品名称', class:'text-nowrap'},
				{ data: "buyNum", label: '商品数量', class:'text-nowrap'},
				{ data: "commodityPrice", label: '商品单价(元)', class:'text-nowrap'},
				{ data: "commodityPriceTotal", label: '商品总价(元)', class:'text-nowrap'},
				{ data: "settlementPattern", label: '结算模式', class:'text-nowrap',data_dict: <@JSONObject dataDict="settlement_pattern"/>},
				{ data: "payableAmount", label: '已付金额(元)', class:'text-nowrap'},
				{ data: "refundableAmount", label: '应退金额', class:'text-nowrap',render: function(data, type, full, meta){
	                    // data 为当前单元格对应的数据
	                    // full 为当前行对应的全部数据
	                    var strOption = "<span id='span_"+meta.row+"'>"+full.refundableAmount+"</span>";      
	                    strOption+="<input id='input_"+meta.row+"'  class=\"form-control txt_mid input-sm\" style='display:none;width:80px' value='"+full.refundableAmount+"' />";
	                    return strOption;
                	}
            	}
			],
			"createdRow": function ( row, data, index ) {
				$(row).attr("id", "row_" + index).attr("trRow", index);
	        },
	         show_action: (queryid == '0') ? false : true,
			gen_permission: function(){
				// SSUI: 生成权限
				var map = [];
				//审核
				<@permission name="stms:refundBillDetail:edit">
					map.push('edit');
				</@permission>
				return map;		
			},
			clm_action: function(item){
				return gen_action(item);
			},
		});
		
		$('#billDetail_list').on( 'draw.dt', function () {
			//初始化编辑事件
			initEdit();
		} );
	});	
});

	$("#import_button").click(function() {
		var billNo = $("#billNo").val();
   		var url = rootPath + '/refundBillDetail/importView.do';
        var dlg = dialog({
           id: "refunBillDetailForm",
           title: '退款账单明细导入',
           lock: false,
           content : "<iframe  id='refunBillDetailForm' name='refunBillDetailForm,"+window.location.href+"' src="+url+" width='500px' height='210px' frameborder='0' scrolling='no' id='refunBillDetailForm'></iframe>",
	   	    button: [
	    	        {
	    	            value: '导入',
	    	            callback: function () {
	    	            	var dialogVew = document.getElementById("refunBillDetailForm").contentWindow;
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
     }); 
 

$("#submitBtn").click(function(){
	 var billNo=$("#billNo").val();
	 var url = rootPath + "/refundBillDetail/auditRefund.do";
	 var data = {"billNo": billNo};
	 common_doSave(url, "post", null, data);
});

var option = {
    theme : 'vsStyle',
    expandLevel : 6
};

</script>
</body>
</html>
