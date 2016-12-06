<!DOCTYPE html>
<html>
<head>
    <meta name="decorator" content="list"/>
    <title>退款账单修改日志列表</title>
    <#include "../../common/share_macro.ftl" encoding="utf-8">
</head>
<body>
	<div class="tab-content">
	    <div class="tab-pane fade in active">
	        <div class="col-md-12">
	             <div class="search">
					<form id="find-page-orderby-form"
						action="${BasePath !}/refundBillLog/list.do" method="post">
						<input type="hidden" name="ids" value=""/>
						<div class="inquire-ul">
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
									<label>修改时间：</label>
									<div class="div-form">
										<input name="updateDateStart" id="updateDateStart"
											class="form-control txt_mid input-sm" readonly="readonly"
											onfocus="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm:ss',maxDate:'#F{$dp.$D(\'updateDateEnd\')}'})"
											value="${(updateDateStart)!}">
									</div>
									至
									<div class="div-form">
										<input name="updateDateEnd" id="updateDateEnd"
											class="form-control txt_mid input-sm" readonly="readonly"
											onfocus="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm:ss',minDate:'#F{$dp.$D(\'updateDateStart\')}'})"
											value="${(updateDateEnd)!}">
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
								data-target="bill_log_list">
								<i class="fa fa-trash-o"></i>&nbsp;&nbsp;清空
							</button>
						</div>
					</form>
				</div>
	        </div>
			<!-- SSUI: 只需定义 DataTable 外围的 DIV ID，注意添加统一的 class: ff_DataTable 便于全局控制 -->
			<div id="refund_bill_log_list" class="ff_DataTable"></div>
	    </div>               
	</div>
<script type="text/javascript">
	window.onbeforeunload = null;
	$(function(){
		//初始化列表
		requirejs(['ff/init_datatable'], function(initDataTable){
			dt_purchaseOrder_list = new initDataTable({
				div_id: 'refund_bill_log_list',
				url: rootPath + "/refundBillLog/listAjax.do?billNo=${(bill.billNo) !}",
				columns:[
					{ data: "lastUpdateDate", label: '修改时间', class:'text-nowrap', format:{datetime:'yyyy-MM-dd HH:mm:ss'} },
					{ data: "lastUpdateBy.name", label: '修改人' },
					{ data: "billDetail.orderNo", label: '修改销售订单号' },
					{ data: "billDetail.skuBarCode", label: '商品条形码' },
					{ data: "billDetail.commodityName", label: '商品名称' },
					{ data: "billDetail.commodityPriceTotal", label: '商品总价(元)' },
					{ data: "refundableAmountBefore", label: '修改前应退金额' },
					{ data: "refundableAmountAfter", label: '修改后应退金额' }
				],
				//是否显示复选框列，默认：true 显示
	            show_checkbox: false,
	            show_action:false,
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