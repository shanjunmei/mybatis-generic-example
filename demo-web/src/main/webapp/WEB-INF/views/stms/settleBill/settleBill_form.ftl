<#include "../../global.ftl" encoding="utf-8">
<!DOCTYPE html>
<html>
<head>
	<meta name="decorator" content="edit"/>
	<title>结款单编辑</title>
<#include "../../common/share_macro.ftl" encoding="utf-8">	
</head>
<body>
 <ul class="nav nav-tabs" style="padding-left: 1%;">
      <li class="active"><a href="#">结款单
      <#if viewType??>
		 <#if viewType == '0'>查看
		 <#elseif viewType == '1'>
			<#if entity.id??>
		 	编辑
		 	<#else>
		 	新增
		 	</#if> 
		 <#elseif viewType == '2'>提交
		 <#elseif viewType == '3'>审核
		 <#else>
		 	新增
		 </#if>	
	  <#else>
		新增
	  </#if>
</a></li>
  </ul>
	<div class="tab-content">
		<div class="tab-pane fade in active" id="addEntity">
			<div class="row">
	                    <div class="col-lg-10 col-md-12 col-sm-12">
	                    		<div class="addForm1">
	                    			<form  action="${BasePath !}/settleBill/save.do" method="post" id="myform" name="myform">
	                    				<div id="error_con" class="tips-form">
	                            <ul></ul>
	                        </div>
	                             <div class="tips-form">
	                             </div>
	                    			<input type="hidden" id="id" value="${(entity.id) !}" name="id">
	                    		<div class="width-input-div">
								<div class="form-tr">
									<div class="form-td">
										<label>结款单号：</label>
										<div class="div-form">
											<input class="form-control input-sm txt_mid" type="text" id="code" name="code" value="${(entity.code) !}" readonly="readonly">
										</div>
									</div>

									<div class="form-td">
										<label>结款状态：</label>
										<div class="div-form">
											<input   readonly="readonly"  value="<@valueToLabel dataDict='pay_status' myValue='${(entity.payStatus) !}' />"  class="form-control input-sm txt_mid"/>
											<#-- <select  id="payStatus" readonly="readonly" name="payStatus"  data-option='<@JSONArray dataDict="pay_status"/>' data-selected="${(entity.payStatus) !}" data-hint="--全部--" class="input-sm"></select>-->
										</div>
									</div>
									
									<div class="form-td">
										<label>供应商名称：</label>
										<div class="div-form">
											<input class="form-control input-sm txt_mid" type="text" id="vendorName" name="vendorName" value="${(entity.vendorName) !}" readonly="readonly">
										</div>
									</div>
									
									<div class="form-td">
										<label>供应商编码：</label>
										<div class="div-form">
											<input class="form-control input-sm txt_mid" type="text" id="vendorCode" name="vendorCode" value="${(entity.vendorCode) !}" readonly="readonly">
										</div>
									</div>
								</div>
								
								
								<div class="form-tr">
									<div class="form-td">
										<label>商品总价总计：</label>
										<div class="div-form">
											<input class="form-control input-sm txt_mid" type="text"  value="${(entity.commodityTotalAmount) !}" readonly="readonly">
										</div>
									</div>

									<div class="form-td">
										<label>供货价总计：</label>
										<div class="div-form">
											<input class="form-control input-sm txt_mid" type="text"  value="${(entity.supplyTotalAmount) !}" readonly="readonly">
										</div>
									</div>
									
									<div class="form-td">
										<label>扣点金额总计：</label>
										<div class="div-form">
											<input class="form-control input-sm txt_mid" type="text" value="${(entity.deductAmount) !}" readonly="readonly">
										</div>
									</div>
									
									<div class="form-td">
										<label>应付金额总计：</label>
										<div class="div-form">
											<input class="form-control input-sm txt_mid" type="text" id="payAmountSum" name="payAmountSum" value="${(entity.payAmountSum) !}" readonly="readonly">
										</div>
									</div>
									
										<div class="form-td">
										<label>退款金额总计：</label>
										<div class="div-form">
											<input class="form-control input-sm txt_mid" type="text" id="refundAmountSum" name="refundAmountSum" value="${(entity.refundAmountSum) !}" readonly="readonly">
										</div>
									</div>
								</div>
								
								
								<div class="form-tr">
									<div class="form-td">
										<label>应付款金额：</label>
										<div class="div-form">
											${(entity.payAmount) !}元，累计付款金额：${(entity.cumulativePayAmount) !}元，剩余付款金额：${(entity.remindPayAmount) !}元，
											<#if viewType ??>
												<#if viewType == '1'>
													本次付款：
													<input class="form-control input-sm txt_mid" type="text"  name="currentPayAmount" data-rule-required="true" data-msg-required="付款金额不能为空" > 元
												</#if>
											</#if>
										</div>
									</div>
								</div>
                        </div>
                        
                        <div id="bill_list" class="ff_DataTable"></div>
                        
						<div class="form-tr">
		                     <div>备注：若应结款金额&lt;=0，表示此结款单的退款账单金额总计&gt;=应付账单金额总计</div>
                             <div class="form-tr">
                                 <div class="btn-div">
                               		  <#if viewType ??>
												<#if viewType == '1'>
										 <@permission name="stms:settleBill:pay">
                                    	 <input type="submit" class="btn btn-primary" value="保存">
                                    	 </@permission>
                                    	 </#if>
										</#if>
                                     <input type="button" class="btn btn-default btn-close-iframeFullPage" value="取消" onclick="isReturn()">
                                 </div>
                             </div>    
                       </div>
                  </form>
               </div>
           </div>
        </div>
    </div>
</div>

<script type="text/javascript" src="${BasePath}/asset/js/stms/settleBill/settleBill_form.js?v=${ver !}"></script>
<script type="text/javascript">
$(document).ready(function(){	
	var isType={"0":"应付","1":"退款"};
	requirejs(['ff/init_datatable'], function(initDataTable){
		dt_demo_list = new initDataTable({
			show_action: false,
			div_id: 'bill_list',
			url: rootPath + "/settleBill/queryBillData.do",
			before_request: function(json){
				console.log(json);
				debugger;
				json.invoiceNum="${(entity.code)!}";
				return json;
			},
			show_checkbox: false,
			columns:[
				{ data: "billNo", label: '单据编号', class:'text-nowrap' },
				{ data: "type", label: '单据类型', data_dict: isType},
				{ data: "businessStartDateTime", label: '业务开始时间', class:'text-nowrap',format:{datetime:'yyyy-MM-dd HH:mm:ss'}},
				{ data: "businessEndDateTime", label: '业务结束时间', class:'text-nowrap',format:{datetime:'yyyy-MM-dd HH:mm:ss'}},
				{ data: "goodsTotalCount", label: '商品总价合计(元)', class:'text-nowrap'},
				{ data: "refundBillTotalCount", label: '应付/退款账单金额合计(元)', class:'text-nowrap',render:function(data, type, full, meta){
						debugger;
						if(full.type=='退款'){
							return full.refundBillTotalCount;
						}
						if(full.type='应付'){
							return full.payableAmountTotal;
						}
					}
				}
			]
		});
		
	});	
});
 $(function(){
	//$("select").select2();
	executeValidateFrom('myform');
});
</script>
</body>
</html>
