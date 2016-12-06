<html>
<head>
<meta name="decorator" content="list" />
<title>退货账单</title>
<#include "../../common/share_macro.ftl" encoding="utf-8">
</head>
<body>

	<div class="tab-content">
		<div class="tab-pane fade in active" id="billList">
			<div class="col-md-12">
				<div class="search">
					<form id="find-page-orderby-form" action="${BasePath !}/refundBill/list.do" method="post">
						<input id="find-page-index" type="hidden" name="pageIndex" value="1" /> 
						<input id="find-page-count" type="hidden" value="${(pageObj.pageCount) !}" />
						<input id="id" type="hidden" value="${(bill.id) !}" />
                        <input id="find-page-size" type="hidden" name="pageSize" value="${(pageObj.pageSize) !}" />
						<input type="hidden" name="billNos" value=""/>
						<div class="inquire-ul">
							<div class="form-tr">
								<div class="form-td">
									<label>退款单号：</label> 
									<div class="div-form"><input id="billNo" name="billNo" class="form-control txt_mid input-sm" type="text" placeholder="" value="${(bill.billNo) !}"></div>
								</div>
								<div class="form-td">
									<label>结款单号：</label> 
									<div class="div-form"><input id="invoiceNum" name="invoiceNum" class="form-control txt_mid input-sm" type="text" placeholder="" value="${(bill.invoiceNum) !}"></div>
								</div>
								
								<div class="form-td">
									<label>退款账单状态 ：</label> 
									<div class="div-form">
									<!-- SSUI: 新的下拉菜单初始化方法 -->
									<select id="billStatus" name="billStatus"  data-option='<@JSONArray dataDict="stms_bill_status"/>' data-selected="" class="input-sm" data-hint="--全部--"></select>
			                         </div>
								</div>
								<div class="form-td">
									<label>销售订单单号：</label> 
									<div class="div-form"><input id="orderNo" name="orderNo" class="form-control txt_mid input-sm" type="text" placeholder="" value="${(orderNo) !}"></div>
								</div>
							<div class="form-td">
					    		<label>业务时间范围：</label> 
								<div class="div-form">
							      <input name="businessStartDateTime" id="businessStartDateTime" class="form-control txt_mid input-sm"  readonly="readonly"
                                  onfocus="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm:ss',maxDate:'#F{$dp.$D(\'businessStartDateTime\')}'})"
                                   value="${(bill.businessStartDateTime) !}">
                                 </div> -  
                                 <div class="div-form">
                                   <input name="businessEndDateTime" id="businessEndDateTime" class="form-control txt_mid input-sm"  readonly="readonly"
                                    onfocus="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm:ss',minDate:'#F{$dp.$D(\'businessEndDateTime\')}'})"
                                    value="${(bill.businessEndDateTime) !}">
                                 </div>
								</div>
						    </div>
						
						<div class="form-td">
					    		<label>退款金额合计区间：</label> 
								<div class="div-form">
									<input style="width: 66px;" id="minrefundBillTotalCount" name="minrefundBillTotalCount" class="form-control txt_mid input-sm" type="text" value="${(minrefundBillTotalCount) !}">
									<input style="width: 66px;" id="maxrefundBillTotalCount" name="maxrefundBillTotalCount" class="form-control txt_mid input-sm" type="text" value="${(maxrefundBillTotalCount) !}"> -
								</div>
						    </div>
						
			        <div class="form-td">
	                    <label>结算模式：</label>
	                    <div class="div-form">
									<!-- SSUI: 新的下拉菜单初始化方法 -->
									<select id="settlementPattern" name="settlementPattern"  data-option='<@JSONArray dataDict="settlement_pattern"/>' data-selected="" data-hint="--全部--" class="input-sm"></select>
			                         </div>               
	       	 			</div>
	                 	     <div class="form-td">
									<label>供应商：</label>
									<div class="div-form">
				                    	<div class="f7" id="vendorPartner">
				                    		<input type="hidden" id="vendorCode" name="vendorCode" value="${(bill.vendorCode) !}"/>
			                            	<input class="form-control input-sm txt_mid" type="text" 
			                            		id="vendorName" name="vendorName" value="${(bill.vendorName) !}" readonly="readonly">
			                            	<span class="selectDel" onclick="$(this).parent().find('input').val('');">×</span>
			                            	<span class="selectBtn" onclick="vendorPopupFrom()">选</span>
			                        	</div>
								    </div>
								</div>
							
					</div>
						</div>
						<div class="btn-div3">
							<button id="find-page-orderby-button" class="btn btn-primary btn-sm btn-inquire" type="button"><i class="fa fa-search"></i>&nbsp;&nbsp;查询</button>
							<button class="btn btn-primary btn-sm btn-clear-keyword"  data-target="bill_list"><i class="fa fa-trash-o"></i>&nbsp;&nbsp;清空</button> 
							<@permission name="stms:refundBill:export">
							<a onclick="exportExcel(this)" class="btn btn-primary btn-sm" ><i class="fa fa-arrow-circle-up"></i>&nbsp;&nbsp;导出</a>
							</@permission>
						</div>
					</form>
				</div>
			</div>
			 <div id="bill_list" class="ff_DataTable"></div>
		</div>
	</div>



<#include "../../common/tree.ftl" encoding="utf-8">
<link rel="stylesheet"  href="${BasePath}/asset/js/control/ztree/css/pageleft.css" type="text/css"> 
<link rel="stylesheet"  href="${BasePath !}/asset/js/control/ztree/css/tree_artdialog.css" type="text/css"> 
<script src="${BasePath !}/asset/js/stms/refundBill/refundBill_list.js?ver=${ver !}" type="text/javascript"></script>


<script type="text/javascript">
$(document).ready(function(){	
	requirejs(['ff/init_datatable'], function(initDataTable){
		dt_demo_list = new initDataTable({
			div_id: 'bill_list',
			url: rootPath + "/refundBill/list.do",
			columns:[
				{ data: "clm_checkbox", label: '<input type="checkbox" class="selectAll" />', render: function(data, type, full, meta) {
					return "<input type=\"checkbox\" id=\"" + full.id + "\" name=\"billNos\" value=\"" + full.billNo + "\"" 
						+ full.billNo + "\">";
				}},	
				{ data: "billNo", label: '退款账单号', class:'text-nowrap',render: function(data, type, full, meta){return toDetailed(data, type, full, meta)} },
				{ data: "invoiceNum", label: '结款单号', class:'text-nowrap'},
				{ data: "billStatus", label: '退款账单状态', data_dict: <@JSONObject dataDict="stms_bill_status"/>},
				{ data: "vendorCode", label: '供应商编码', class:'text-nowrap'},
				{ data: "vendorName", label: '供应商名称', class:'text-nowrap'},
				{ data: "goodsTotalCount", label: '商品总价合计(元)', class:'text-nowrap'},
				{ data: "refundBillTotalCount", label: '退款账单金额合计(元)', class:'text-nowrap'},
				{ data: "businessStartDateTime", label: '业务开始时间', class:'text-nowrap'},
				{ data: "businessEndDateTime", label: '业务结束时间', class:'text-nowrap'},
				{ data: "createDate", label: '创建时间', class:'text-nowrap',format:{datetime:'yyyy-MM-dd HH:mm:ss'}},
				{ data: "auditor", label: '审核人', class:'text-nowrap'},
				{ data: "auditTime", label: '审核时间', class:'text-nowrap'}
			],
			gen_permission: function(){
				// SSUI: 生成权限
				var map = [];
				//审核.
				<@permission name="stms:refundBill:auditRefund">
				map.push('examine');
				</@permission>
				//日志
				<@permission name="stms:refundBill:Journal">
			      map.push('Journal');
			    </@permission>
				
				return map;		
			},
			clm_action: function(item){
				return gen_action(item);
			},
			
			row_dblclick:function(row,data){
				 iframeFullPage(rootPath + "/refundBillDetail/listBillDetail.do?id=" + data.id+"&queryid=0");
				 //var codeLing='<a href="javascript:iframeFullPage(\''+ rootPath + '/refundBillDetail/listBillDetail.do?id='+full.id+'&queryid=0\')">'+data+'</a>';
			}
		});
	});
});



//$(".input-select2").select2();
var option = {
        theme : 'vsStyle',
        expandLevel : 6
    };
   /*  $('#TreeTable').treeTable(option); */
 
//选择供应商
function vendorPopupFrom() {
    $.frontEngineDialog.executeIframeDialog('vendor_select_stms', '选择供应商', rootPath
            + '/refundBill/listSelectVendor.do', '1000', '600');
}
   
   
/*
 * 点击编号查看明细
 */
function toDetailed(data, type, full, meta){
	var codeLing='<a href="javascript:iframeFullPage(\''+ rootPath + '/refundBillDetail/listBillDetail.do?id='+full.id+'&queryid=0\')">'+data+'</a>';
    return codeLing;
}



</script>
</body>
</html>
