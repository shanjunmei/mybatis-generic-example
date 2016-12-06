<!DOCTYPE html>
<html>
<head>
    <meta name="decorator" content="list"/>
    <title>应付账单列表</title>
    <#include "../../common/share_macro.ftl" encoding="utf-8">
</head>
<body>
	<div class="tab-content">
	    <div class="tab-pane fade in active">
	        <div class="col-md-12">
	             <div class="search">
					<form id="find-page-orderby-form"
						action="${BasePath !}/payableBill/list.do" method="post">
						<input type="hidden" name="billNos" value=""/>
						<div class="inquire-ul">
							<div class="form-tr">
								<div class="form-td">
									<label>应付账单号：</label>
									<div class="div-form">
										<input id="billNo" name="billNo"
											value="${(bill.billNo) !}"
											class="form-control txt_mid input-sm" type="text"
											placeholder="">
									</div>
								</div>
								<div class="form-td">
									<label>结款单号：</label>
									<div class="div-form">
										<input id="invoiceNum" name="invoiceNum"
											value="${(bill.invoiceNum) !}"
											class="form-control txt_mid input-sm" type="text"
											placeholder="">
									</div>
								</div>
								<div class="form-td">
									<label>应付账单状态：</label>
									<div class="div-form">
										<select class="input-sm" id="billStatus" name="billStatus" 
											data-hint="全部" data-option='<@JSONArray dataDict="stms_bill_status"/>' data-selected="">
										</select>
									</div>
								</div>
								<div class="form-td">
									<label>销售订单号：</label>
									<div class="div-form">
										<input class="form-control input-sm txt_mid" type="text"
											id="orderNo" name="orderNo" value="${(bill.orderNo) !''}" 
											placeholder=""/>
									</div>
								</div>
							</div>
							<div class="form-tr">
								<div class="form-td">
									<label>业务时间范围：</label>
									<div class="div-form">
										<input name="businessStartDateTime" id="businessStartDateTime"
											class="form-control txt_mid input-sm" readonly="readonly"
											onfocus="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm:ss',maxDate:'#F{$dp.$D(\'businessEndDateTime\')}'})"
											value="${(bill.businessStartDateTime)!}">
									</div>
									至
									<div class="div-form">
										<input name="businessEndDateTime" id="businessEndDateTime"
											class="form-control txt_mid input-sm" readonly="readonly"
											onfocus="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm:ss',minDate:'#F{$dp.$D(\'businessStartDateTime\')}'})"
											value="${(bill.businessEndDateTime)!}">
									</div>
								</div>
								<div class="form-td">
									<label>应付金额合计：</label>
									<div class="div-form">
										<input name="payableAmountTotalMin" id="payableAmountTotalMin"
											class="form-control txt_mid input-sm" type="number" step="0.1"
											value="${(payableAmountTotalMin)!}">
									</div>
									至
									<div class="div-form">
										<input name="payableAmountTotalMax" id="payableAmountTotalMax"
											class="form-control txt_mid input-sm" type="number" step="0.1"
											value="${(payableAmountTotalMax)!}">
									</div>
								</div>
								<div class="form-td">
									<label>供应商：</label>
									<div class="div-form">
										<input type="hidden" id="vendorCode" name="vendorCode"
											value="${(bill.vendorCode) !}">
										<div class="f7" onclick="selectSupplier()">
											<input class="form-control input-sm txt_mid" type="text"
												id="vendorName" name="vendorName"
												value="${(bill.vendorName) !''}"
												readonly="readonly"> <span class="selectBtn">选</span>
										</div>
									</div>
								</div>
							</div>
						</div>

						<div class="btn-div3">
							<button id="find-page-orderby-button"
								class="btn btn-primary btn-sm" type="button">
								<i class="fa fa-search"></i>&nbsp;&nbsp;查询
							</button>
							<button id="clean" class="btn btn-primary btn-sm btn-clear-keyword"
								data-target="bill_list">
								<i class="fa fa-trash-o"></i>&nbsp;&nbsp;清空
							</button>
							<@permission name="stms:payableBill:export"> <a
								onclick="exportExcel(this)" class="btn btn-primary btn-sm"
								<i class="fa fa-plus"></i>&nbsp;&nbsp;导出</a> </@permission>
						</div>
					</form>
				</div>
	        </div>
			<!-- SSUI: 只需定义 DataTable 外围的 DIV ID，注意添加统一的 class: ff_DataTable 便于全局控制 -->
			<div id="bill_list" class="ff_DataTable"></div>          
	    </div>               
	</div>
<script src="${BasePath !}/asset/js/stms/payableBill/list_ajax.js?v=${ver !}"/></script>
<script type="text/javascript">
	window.onbeforeunload = null;
	$(function(){
		//初始化列表
		requirejs(['ff/init_datatable'], function(initDataTable){
			dt_purchaseOrder_list = new initDataTable({
				div_id: 'bill_list',
				url: rootPath + "/payableBill/listAjax.do",
				columns:[
					{ data: "clm_checkbox", label: '<input type="checkbox" class="selectAll" />', render: function(data, type, full, meta) {
						return "<input type=\"checkbox\" id=\"" + full.id + "\" name=\"billNos\" value=\"" 
							+ full.billNo + "\">";
					}},	
					{ data: "billNo", label: '应付帐单号', render: function(data, type, full, meta) {
						return "<a href=\"javascript:iframeFullPage('"+ rootPath + "/payableBillDetail/bill_detail_list.do?id=" + full.id + "')\">" + data + "</a>";
					} },
					{ data: "invoiceNum", label: '结款单号' },
					{ data: "billStatus", label: '应付账单状态', data_dict: <@JSONObject dataDict="stms_bill_status"/> },
					{ data: "vendorCode", label: '供应商编码' },
					{ data: "vendorName", label: '供应商名称' },
					{ data: "goodsTotalCount", label: '商品总价合计' },
					{ data: "supplyTotal", label: '供货价合计' },
					{ data: "pointsAmountTotal", label: '扣点金额合计' },
					{ data: "payableAmountTotal", label: '应付金额合计' },
					{ data: "payableObtainAmountTotal", label: '应付所得金额合计' },
					{ data: "businessStartDateTime", label: '业务开始时间', class:'text-nowrap', format:{datetime:'yyyy-MM-dd HH:mm:ss'} },
					{ data: "businessEndDateTime", label: '业务结束时间', class:'text-nowrap', format:{datetime:'yyyy-MM-dd HH:mm:ss'} },
					{ data: "createDate", label: '创建时间', class:'text-nowrap', format:{datetime:'yyyy-MM-dd HH:mm:ss'} },
					{ data: "auditor", label: '审核人' },
					{ data: "auditTime", label: '审核时间', class:'text-nowrap', format:{datetime:'yyyy-MM-dd HH:mm:ss'} }
				],
				gen_permission: function(){
					// SSUI: 生成权限
					var map = [];				
					//审核
					<@permission name="stms:payableBill:audit">
						map.push('audit');
					</@permission>
					//修改日志
					<@permission name="stms:payableBill:log">
						map.push('log');
					</@permission>
					return map;		
				},
				clm_action: function(item){
					// SSUI: 方法 gen_action 的具体逻辑，在外链的 demo_list.js 中定义
					return gen_action(item);
				},
				row_dblclick:function(row,data){
					 iframeFullPage(rootPath + "/payableBillDetail/bill_detail_list.do?id=" + data.id);
				}
			});
		});
	});
	
</script>
</body>
</html>