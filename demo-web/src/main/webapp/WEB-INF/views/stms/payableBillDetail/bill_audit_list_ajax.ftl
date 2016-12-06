<!DOCTYPE html>
<html>
<head>
<meta name="decorator" content="edit" />
<title>应付账单审核</title>
<#include "../../common/share_macro.ftl" encoding="utf-8">
<style type="text/css">
div#bill_audit_list div.dataTables_scroll th i {
    color: red;
    padding-right: 3px;
    font-style: normal;
}
div#bill_audit_list div.dataTables_scroll .fixedWidth {
	width: 84px;
}
</style>
</head>
<body>
    <ul class="nav nav-tabs" style="padding-left: 1%;">
        <li class="active"><a href="#">应付账单审核</a></li>
    </ul>
	<div class="tab-content">
		<div class="tab-pane fade in active" id="addOffice">
			<div class="row">
				<div class="col-lg-10 col-md-12 col-sm-12">
					<div class="search">
						<input type="hidden" id="id" value="${(bill.id) !''}" />
						<input type="hidden" id="billNo" value="${(bill.billNo) !''}" />
						<form id="find-page-orderby-form"
							 action="${BasePath !}/payableBillDetail/bill_detail_listAjax.do" method="post" id="myform" name="myform">
							<div id="error_con" class="tips-form">
								<ul></ul>
							</div>
							<div class="tips-form"></div>
                        <div class="inquire-ul">
							<div class="form-tr">
								<div class="form-td col-lg-3 col-md-3 col-sm-3">
									<label>应付账单号：</label>
									<div class="div-form">
										${(bill.billNo) !''}
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
									<div class="div-form">
										${(bill.goodsTotalCount?string('0.00')) !}
									</div>
								</div>
								<div class="form-td">
									<label>供货价合计：</label>
									<div class="div-form" id="supplyTotal">${(bill.supplyTotal?string('0.00')) !'&nbsp;'}</div>
								</div>
							</div>
							<div class="form-tr">
								<div class="form-td col-lg-3 col-md-3 col-sm-3">
									<label>扣点金额合计：</label>
									<div class="div-form" id="pointsAmountTotal">
									${(bill.pointsAmountTotal?string('0.00')) !'&nbsp;'}
									</div>
								</div>
								<div class="form-td">
									<label>应付金额合计：</label>
									<div class="div-form" id="payableAmountTotal">
										${(bill.payableAmountTotal?string('0.00')) !}
									</div>
								</div>
							</div>
							<div class="form-tr">
								<div class="form-td col-lg-3 col-md-3 col-sm-3">
									<label>应付所得金额合计：</label>
									<div class="div-form" id="payableObtainAmountTotal">
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
										value="${(payTimeStart)!}">
								</div>
								至
								<div class="div-form">
									<input name="payTimeEnd" id="payTimeEnd"
										class="form-control txt_mid input-sm" readonly="readonly"
										onfocus="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm:ss',minDate:'#F{$dp.$D(\'payTimeStart\')}'})"
										value="${(payTimeEnd)!}">
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
								data-target="bill_audit_list">
								<i class="fa fa-trash-o"></i>&nbsp;&nbsp;清空
							</button>
							<a onclick="exportExcelDetail('${(bill.billNo) !''}')" class="btn btn-primary btn-sm"
								<i class="fa fa-plus"></i>&nbsp;&nbsp;导出</a>
							<a onclick="importExcelDetail(this)" class="btn btn-primary btn-sm"
								<i class="fa fa-plus"></i>&nbsp;&nbsp;导入</a>
							</div>
						</div>	
						</div>					
					</form>
				</div>
			</div>
		</div>
		<!-- SSUI: 只需定义 DataTable 外围的 DIV ID，注意添加统一的 class: ff_DataTable 便于全局控制 -->
		<div id="bill_audit_list" class="ff_DataTable"></div>
		<div class="col-md-12" style="height: 20px;">
		</div>
		<div class="col-md-12">
			<div class="btn-div" style="float: right;">
				<a id="submit" class="btn btn-primary" onclick="submitClick(this)">提交</a>
				<input type="button" class="btn btn-default btn-close-iframeFullPage" value="返回" />
			</div>
		</div>
	</div>
	</div>
	
	<#include "../../common/select.ftl" encoding="utf-8">
	<script src="${BasePath !}/asset/js/stms/payableBillDetail/list_ajax.js?v=${ver !}"/></script>
	<script src="${BasePath !}/asset/js/control/bootstrap/js/bootstrap.min.js"></script>
	<script type="text/javascript">
	window.onbeforeunload = null;
	function nullToEmpty(col) {
		if (col == null || col == undefined) {
			return "";
		} else {
			return col;
		}
	}
	
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
				div_id: 'bill_audit_list',
				url: rootPath + "/payableBillDetail/bill_detail_listAjax.do?billNo=${(bill.billNo) !}",
				columns:[
					{ data: "clm_checkbox", label: '<input type="checkbox" class="selectAll" />', render: function(data, type, full, meta) {
						var colHtml = "<input type=\"hidden\" id=\"oldSupply_" + meta.row + "\" value=\"" + nullToEmpty(full.supply) + "\" />"
							+ "<input type=\"hidden\" id=\"oldPoints_" + meta.row + "\" value=\"" + nullToEmpty(full.points) + "\" />"
							+ "<input type=\"hidden\" class=\"form-control input-sm\""
							+ "id=\"settlementPattern_" + meta.row + "\" name=\"settlementPattern_" + meta.row + "\" value=\"" + nullToEmpty(full.raw.settlementPattern) + "\"/>"
							+ "<input type=\"hidden\" class=\"form-control input-sm\""
							+ "id=\"buyNum_" + meta.row + "\" name=\"buyNum_" + meta.row + "\" value=\"" + nullToEmpty(full.buyNum) + "\"/>"
							+ "<input type=\"hidden\" class=\"form-control input-sm\""
							+ "id=\"commodityPriceTotal_" + meta.row + "\" name=\"commodityPriceTotal_" + meta.row + "\" value=\"" + nullToEmpty(full.commodityPriceTotal) + "\"/>"
							+ "<input type=\"hidden\" class=\"form-control input-sm\""
							+ "id=\"supplyAmount_" + meta.row + "\" name=\"supplyAmount_" + meta.row + "\" value=\"" + nullToEmpty(full.supplyAmount) + "\"/>"
							+ "<input type=\"hidden\" class=\"form-control input-sm\""
							+ "id=\"pointsAmount_" + meta.row + "\" name=\"pointsAmount_" + meta.row + "\" value=\"" + nullToEmpty(full.pointsAmount) + "\"/>"
							+ "<input type=\"hidden\" class=\"form-control input-sm\""
							+ "id=\"skuBarCode_" + meta.row + "\" name=\"skuBarCode_" + meta.row + "\" value=\"" + nullToEmpty(full.skuBarCode) + "\"/>"
							+ "<input type=\"hidden\" class=\"form-control input-sm\""
							+ "id=\"payableAmount_" + meta.row + "\" name=\"payableAmount_" + meta.row + "\" value=\"" + nullToEmpty(full.payableAmount) + "\"/>"
							+ "<input type=\"hidden\" class=\"form-control input-sm\""
							+ "id=\"payableObtainAmount_" + meta.row + "\" name=\"payableObtainAmount_" + meta.row + "\" value=\"" + nullToEmpty(full.payableObtainAmount) + "\"/>";
						colHtml += "<input id=\"" + full.id + "\" name=\"id_" + meta.row + "\" type=\"checkbox\""
							+ "value=\"" + full.id + "\" />";
						return colHtml;
					}},	
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
					{ data: "supply", label: '供货价(元)', class:'fixedWidth', render: function(data, type, full, meta) {
						if (full.raw.settlementPattern != null && full.raw.settlementPattern == '1') {
							return "<span>" + nullToEmpty(data) + "</span><input type=\"number\" min=\"0\" step=\"0.1\" id=\"supply_" + meta.row 
								+ "\" name=\"supply_" + meta.row + "\" class=\"form-control input-sm\""
                    			+ "style=\"display:none; width:60px;\" value=\"" + numberToFixed(data, 2) + "\"/>";
						} else {
							return "";
						}
					} },
					{ data: "supplyAmount", label: '供货价金额(元)' },
					{ data: "points", label: '扣点', class:'fixedWidth', render: function(data, type, full, meta) {
						if (full.raw.settlementPattern != null && full.raw.settlementPattern == '0') {
							return "<span>" + nullToEmpty(data) + "</span><input type=\"number\" step=\"1\" id=\"points_" + meta.row 
								+ "\" name=\"points_" + meta.row + "\" class=\"form-control input-sm\""
                    			+ "style=\"display:none; width:60px;\" value=\"" + numberToFixed(data, 2) + "\"/>";
						} else {
							return "";
						}
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
				"createdRow": function ( row, data, index ) {
					$(row).attr("id", "row_" + index).attr("trRow", index);
					$('td', row).eq(13).addClass("supplyAmount");
					$('td', row).eq(15).addClass("pointsAmount");
					$('td', row).eq(16).addClass("payableAmount");
					$('td', row).eq(17).addClass("payableObtainAmount");
					$('td', row).eq(18).find("a").attr("id", "audit_" + index);
		        }, 
				gen_permission: function(){
					// SSUI: 生成权限
					var map = [];
					map.push('audit');
					return map;		
				},
				clm_action: function(item){
					// SSUI: 方法 gen_action 的具体逻辑，在外链的 demo_list.js 中定义
					var objAction = {
							audit:[]
					};
					
					/* if (item.raw.lastUpdateBy != null && item.raw.lastUpdateBy.id != null 
							&& item.raw.lastUpdateBy.id.length > 0) {
						objAction['audit'].push({
							label: '编辑',
							class: 'gray'
						});
					} else { */
						objAction['audit'].push({
							label: '编辑',
							class: 'edit'
						});
					/* } */
					
					return objAction;
				}
			});
			
			$('#bill_audit_list').on( 'draw.dt', function () {
				//初始化供货价或扣点改变事件和获得光标事件
				initSupplyOrPointsChangeOrFocus();
				//初始化编辑按钮事件
				initEditClick();
			} );
		});
	});
	
</script>
</body>
</html>