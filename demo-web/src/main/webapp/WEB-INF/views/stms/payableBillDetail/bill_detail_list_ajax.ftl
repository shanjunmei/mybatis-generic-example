<!DOCTYPE html>
<html>
<head>
<meta name="decorator" content="edit" />
<title>应付账单查看</title>
<#include "../../common/share_macro.ftl" encoding="utf-8">
<style type="text/css">
#detailDiv th i {
    color: red;
    padding-right: 3px;
    font-style: normal;
}
</style>
</head>
<body>
    <ul class="nav nav-tabs" style="padding-left: 1%;">
        <li class="active"><a href="#">应付账单查看</a></li>
    </ul>
	<div class="tab-content">
		<div class="tab-pane fade in active">
			<div class="row">
				<div class="col-lg-10 col-md-12 col-sm-12">
					<div class="search">
						<form id="find-page-orderby-form" 
							 action="${BasePath !}/payableBillDetail/bill_detail_list.do" method="post">
							<div id="error_con" class="tips-form">
								<ul></ul>
							</div>
							<div class="tips-form"></div>
                        	<div class="inquire-ul">
							<div class="form-tr">
								<div class="form-td col-lg-3 col-md-3 col-sm-3">
									<label>应付账单号：</label>
									<div class="div-form">
										${(bill.billNo) !}
									</div>
								</div>
								<div class="form-td">
									<label>单据状态：</label>
									<div class="div-form">
										<#if billStatusList ??>
		                                      <#list billStatusList as item >                                      
		                                     		<#if (bill.billStatus) ??>
		                                     		<#if (bill.billStatus) == (item.value)>${(item.label) !}</#if>
		                                     		</#if>
		                                      </#list>
	                                      </#if>
									</div>
								</div>
							</div>
							<div class="form-tr">
								<div class="form-td col-lg-3 col-md-3 col-sm-3">
									<label>供应商编码：</label>
									<div class="div-form">
										${(bill.vendorCode) !''}
									</div>
								</div>
								<div class="form-td">
									<label>供应商名称：</label>
									<div class="div-form">
										${(bill.vendorName) !''}
									</div>
								</div>
							</div>
							<div class="form-tr">
								<div class="form-td col-lg-3 col-md-3 col-sm-3">
									<label>商品总价合计：</label>
									<div class="div-form">${(bill.goodsTotalCount?string('0.00')) !''}</div>
								</div>
								<div class="form-td">
									<label>供货价合计：</label>
									<div class="div-form">${(bill.supplyTotal?string('0.00')) !'&nbsp;'}</div>
								</div>
							</div>
							<div class="form-tr">
								<div class="form-td col-lg-3 col-md-3 col-sm-3">
									<label>扣点金额合计：</label>
									${(bill.pointsAmountTotal?string('0.00')) !'&nbsp;'}
								</div>
								<div class="form-td">
									<label>应付金额合计：</label>
									<div class="div-form">
										${(bill.payableAmountTotal?string('0.00')) !''}
									</div>
								</div>
							</div>
							<div class="form-tr">
								<div class="form-td col-lg-3 col-md-3 col-sm-3">
									<label>应付所得金额合计：</label>
									<div class="div-form">
									${(bill.payableObtainAmountTotal?string('0.00')) !}
									</div>
								</div>
							</div>
						<div class="form-tr">
						</div>
						<div class="form-tr">
						</div>
						<div class="form-tr">
							<div class="form-td">
								<label>销售订单号：</label>
								<div class="div-form">
									<input class="form-control input-sm txt_mid" type="text"
										id="orderNo" name="orderNo" value="${(bill.orderNo) !''}" 
										placeholder=""/>
								</div>
							</div>
							<div class="form-td">
								<label>支付时间：</label>
								<div class="div-form">
									<input name="payTimeStart" id="payTimeStart"
										class="form-control txt_mid input-sm" readonly="readonly"
										onfocus="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm:ss',maxDate:'#F{$dp.$D(\'payTimeEnd\')}'})"
										value="${(payTimeStart)!}"/>
								</div>
								至
								<div class="div-form">
									<input name="payTimeEnd" id="payTimeEnd"
										class="form-control txt_mid input-sm" readonly="readonly"
										onfocus="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm:ss',minDate:'#F{$dp.$D(\'payTimeStart\')}'})"
										value="${(payTimeEnd)!}"/>
								</div>
							</div>
							<div class="form-td">
								<label>商品：</label>
								<div class="div-form">
									<input class="form-control input-sm txt_mid" type="text"
										id="commoditBrcodeName" name="commoditBrcodeName" value="${(commoditBrcodeName) !''}" 
										placeholder="条形码/名称"/>
								</div>
							</div>
	                     </div>
						<div class="form-tr">
							<div class="btn-div3">
								<button id="find-page-orderby-button"
									class="btn btn-primary btn-sm" type="button">
									<i class="fa fa-search"></i>&nbsp;&nbsp;查询
								</button>
								<button id="clean" class="btn btn-primary btn-sm btn-clear-keyword"
									data-target="bill_detail_list">
									<i class="fa fa-trash-o"></i>&nbsp;&nbsp;清空
								</button>
							</div>
						</div>
						</div>						
					</form>
				</div>
			</div>
		</div>
		<!-- SSUI: 只需定义 DataTable 外围的 DIV ID，注意添加统一的 class: ff_DataTable 便于全局控制 -->
		<div id="bill_detail_list" class="ff_DataTable"></div>
		<div class="col-md-12" style="height: 20px;">
		</div>
		<div class="col-md-12">
			<div class="btn-div" style="float: right;">
				<input type="button" class="btn btn-default btn-close-iframeFullPage" value="返回" />
			</div>
		</div>
	</div>
	</div>
	
	<#include "../../common/select.ftl" encoding="utf-8">
	<script src="${BasePath !}/asset/js/control/bootstrap/js/bootstrap.min.js"></script>
	<script type="text/javascript">
	window.onbeforeunload = null;
	
	function numberToFixed(data, decimal) {
		if (data != null && data != "") {
			return parseFloat(data).toFixed(decimal);
		} else {
			return "";
		}
	}
	$(function(){
		//初始化列表
		requirejs(['ff/init_datatable'], function(initDataTable){
			dt_purchaseOrder_list = new initDataTable({
				div_id: 'bill_detail_list',
				url: rootPath + "/payableBillDetail/bill_detail_listAjax.do?billNo=${(bill.billNo) !}",
				columns:[
					{ data: "orderNo", label: '销售订单号' },
					{ data: "outboundNo", label: '出库单号' },
					{ data: "payTime", label: '支付时间', class:'text-nowrap', format:{datetime:'yyyy-MM-dd HH:mm:ss'} },
					{ data: "outboundTime", label: '出库时间', class:'text-nowrap', format:{datetime:'yyyy-MM-dd HH:mm:ss'} },
					{ data: "skuBarCode", label: '商品条形码' },
					{ data: "commodityName", label: '商品名称' },
					{ data: "buyNum", label: '商品数量' },
					{ data: "commodityPrice", label: '商品单价(元)', render: function(data, type, full, meta) {
						return numberToFixed(data, 2);
					} },
					{ data: "commodityPriceTotal", label: '商品总价(元)', render: function(data, type, full, meta) {
						return numberToFixed(data, 2);
					} },
					{ data: "settlementPattern", label: '结算模式', data_dict: <@JSONObject dataDict="settlement_pattern"/> },
					{ data: "supply", label: '供货价(元)', render: function(data, type, full, meta) {
						return numberToFixed(data, 2);
					} },
					{ data: "supplyAmount", label: '供货价金额(元)', render: function(data, type, full, meta) {
						return numberToFixed(data, 2);
					} },
					{ data: "points", label: '扣点', render: function(data, type, full, meta) {
						return numberToFixed(data, 2);
					} },
					{ data: "pointsAmount", label: '扣点金额(元)', render: function(data, type, full, meta) {
						return numberToFixed(data, 4);
					} },
					{ data: "payableAmount", label: '应付金额(元)', render: function(data, type, full, meta) {
						return numberToFixed(data, 2);
					} },
					{ data: "payableObtainAmount", label: '应付所得金额(元)', render: function(data, type, full, meta) {
						return numberToFixed(data, 2);
					} }
				],
				//是否显示复选框列，默认：true 显示
	            show_checkbox: false,
	          	//是否显示操作列，默认：true 显示
	            show_action: false,
				gen_permission: function(){
					// SSUI: 生成权限
					var map = [];				
					return map;		
				},
				clm_action: function(item){
					// SSUI: 方法 gen_action 的具体逻辑，在外链的 demo_list.js 中定义
					var objAction = {};
					return objAction;
				}
			});
		});
	});
</script>
</body>
</html>