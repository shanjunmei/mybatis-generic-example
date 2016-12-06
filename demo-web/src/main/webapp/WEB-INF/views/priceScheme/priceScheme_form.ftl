<!DOCTYPE html>
<html>
<head>
<meta name="decorator" content="edit" />
<title>采购订单编辑</title>
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
        <li class="active"><a href="#">供货价<#if (priceScheme.id) ??><#if viewType ?? && viewType == '1'>查看<#else>编辑</#if><#else>新增</#if></a></li>
    </ul>
    <div class="tab-content">
        <div class="tab-pane fade in active" id="addOffice">
            <div class="row">
                <div class="col-lg-10 col-md-12 col-sm-12">
                    <div class="addForm1">
                        <form action="${BasePath !}/priceScheme/save.do" method="post" id="myform" name="myform">
                            <div id="error_con" class="tips-form">
                                <ul></ul>
                            </div>
                            <div class="tips-form"></div>
                            <input type="hidden" id="id" name="id" value="${(priceScheme.id) !}" />
                            <input type="hidden" id="code" name="code" value="${(priceScheme.code) !}${code !}" />
                            <input type="hidden" id="commodityCode" name="commodity.code" value="${(priceScheme.commodity.code) !}" />
                            <select class="input-select2" id="pattern" name="purchaseType" style="display:none;">
                                <option value=""></option>
                                <#if purchasePatternList ??>
                                <#list purchasePatternList as item >                                      
                                    <option value="${(item.value) !}" 
                                    <#if (priceScheme.vendor.purchaseType) ??><#if (priceScheme.vendor.purchaseType) == (item.value)>selected="selected"</#if></#if>
                                    >${(item.label) !}</option>
                                </#list>
                                </#if>                         
                            </select>
                            <select class="input-select2" id="settlementPattern" name="settlementPattern" style="display:none;">
                                <option value=""></option>
                                <#if settlementPatternList ??>
                                <#list settlementPatternList as item >                                      
                                    <option value="${(item.value) !}" 
                                    <#if (priceScheme.vendor.settlementType) ??><#if (priceScheme.vendor.settlementType) == (item.value)>selected="selected"</#if></#if>
                                    >${(item.label) !}</option>
                                </#list>
                                </#if>                         
                            </select>
                        <div class="width-input-div">
                            <div class="form-tr">
                                <div class="form-td">
                                    <label>供应商编码：</label>
                                    <div class="div-form">
                                        <input class="form-control input-sm" type="text" id="vendorCode" name="vendor.code" 
                                            value="${(priceScheme.vendor.code) !}" readonly="readonly" />
                                    </div>
                                </div>
                                <div class="form-td">
                                    <label>供应商名称：</label>
                                    <div class="div-form">
                                        <input class="form-control input-sm" type="text" id="vendorName" 
                                            value="${(priceScheme.vendor.name) !}" readonly="readonly" >
                                    </div>
                                </div>
							    <div class="form-td">
                                    <label>采购模式：</label>
                                    <div class="div-form">
                                        <input class="form-control input-sm" type="text" id="patternShow" 
                                            value="" readonly="readonly" >
                                    </div>
                                </div>
                                <div class="form-td">
                                    <label>当前结算模式：</label>
                                    <div class="div-form">
                                        <input class="form-control input-sm" type="text" id="settlementTypeShow"
                                            value="" readonly="readonly" >
                                    </div>
                                </div>
                            </div>
                            <div class="form-tr">
                                <div class="form-td">
                                    <label>商品条形码：</label>
                                    <div class="div-form">
                                        <input class="form-control input-sm" type="text" id="commodityBarCode" name="commodity.barCode" 
                                            value="${(priceScheme.commodity.barCode) !}" readonly="readonly" >
                                    </div>
                                </div>
                                <div class="form-td">
                                    <label>商品名称：</label>
                                    <div class="div-form">
                                        <input class="form-control input-sm" type="text" id="warehouseAddress" name="warehouseAddress" 
                                            value="${(priceScheme.commodity.name) !}" readonly="readonly" >
                                    </div>
                                </div>
                                <div class="form-td">
                                    <label>商品状态：</label>
                                    <div class="div-form">
                                    <#if commodityStatusList?? && (priceScheme.commodity.status) ??>
                                        <#list commodityStatusList as item>
                                            <#if item.getValue() == (priceScheme.commodity.status)>
                                                ${item.getName()}
                                            </#if>
                                        </#list>
                                    </#if>
                                    </div>
                                </div>
                            </div>
                            <div class="form-tr">
                                <div class="form-td">
                                    <label><i>*</i>方案类型：</label>
                                    <div class="div-form">
                                        <select class="input-select2" id="type" name="type" onchange="typeChange(this)">
			                                <option value=""></option>
			                                <#if stmsSchemeTypeMap?? && stmsSchemeTypeMap?size gt 0>
			                                <#list stmsSchemeTypeMap?keys as itemKey>
			                                    <option value="${itemKey !}" 
			                                    <#if (priceScheme.type) ??><#if (priceScheme.type) == itemKey>selected="selected"</#if></#if>
			                                    >${stmsSchemeTypeMap[itemKey]}</option>
			                                </#list>
			                                </#if>                         
			                            </select>
                                    </div>
                                </div>
                                <div class="form-td">
                                    <label><i>*</i>方案名称：</label>
                                    <div class="div-form">
                                        <input class="form-control input-sm" type="text" id="name" name="name" 
                                            value="${(priceScheme.name) !}" data-rule-required="true" data-msg-required="方案名称不能为空">
                                    </div>
                                </div>
                                <div class="form-td">
                                    <label>方案状态：</label>
                                    <div class="div-form">
                                        <input class="form-control input-sm" type="hidden" id="status" name="status" 
                                            value="${(priceScheme.status) !}">
                                        <#if pricePlanStatusList?? && (priceScheme.status) ??>
                                        <#list pricePlanStatusList as item>
                                            <#if item.getValue() == (priceScheme.status)>
                                                ${item.getName()}
                                            </#if>
                                        </#list>
                                        </#if>
                                    </div>
                                </div>
                                <div class="form-td">
                                    <label><i>*</i>生效时间：</label>
                                    <div class="div-form">
                                        <input name="effectiveTime" id="effectiveTime"
                                               class="form-control input-sm" readonly="readonly"
                                               onfocus="WdatePicker({minDate:'%y-%M-%d',dateFmt:'yyyy-MM-dd HH:mm:ss',maxDate:'#F{$dp.$D(\'invalidTime\')}'})"
                                               value="${(priceScheme.effectiveTime?string('yyyy-MM-dd HH:mm:ss'))!}">
                                    </div>
                                </div>                   
                                <div class="form-td">
                                    <label><i>*</i>失效时间：</label> 
                                    <div class="div-form">
                                        <input name="invalidTime" id="invalidTime"
                                               class="form-control input-sm" readonly="readonly"
                                               onfocus="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm:ss',minDate:'#F{$dp.$D(\'effectiveTime\')}'})"
                                               value="${(priceScheme.invalidTime?string('yyyy-MM-dd HH:mm:ss'))!}"> 
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="form-tr" id="detailDiv" style="overflow-x: scroll;">
                            <table class="table table-hover table-striped bor2 table-common">
                                <thead>
                                <tr>
                                    <th width="50px">序号</th>
                                    <th>价格方案编号</th>
                                    <th>SKU条形码</th>
                                    <th>SKU</th>
                                    <th>SKU禁用状态</th>
                                    <th><i>*</i>供货价(元)</th>
                                    <th><i>*</i>扣点（%）</th>
                                </tr>
                                </thead>
                                <tbody>
                                <#if (priceScheme.priceSchemeDetails) ?? >
                                <#list (priceScheme.priceSchemeDetails) as item >
                                <tr id="row_${(item_index + 1) }" trRow="${(item_index + 1) }">
                                    <input type="hidden" name="priceSchemeDetails[${(item_index)}].id" value="${item.id !}"/>
                                    <td>${(item_index+1)}</td>
                                    <td>
                                        <span>${item.effectiveProgrammeCode !}${code !}<span/>
                                    </td>
                                    <td class="name">
                                        <span>${(item.commoditySku.barcode) !}<span/>
                                        <input type="hidden" name="priceSchemeDetails[${(item_index)}].commoditySku.barcode" value="${(item.commoditySku.barcode) !}"/>
                                    </td>           
                                    <td class="name">
                                        <span>${(item.commoditySku.commodityAttributeValues) !}<span/>
                                        <input type="hidden" name="priceSchemeDetails[${(item_index)}].commoditySku.commodityAttributeValues" value="${(item.commoditySku.commodityAttributeValues) !}"/>
                                    </td>
                                    <td class="name">
                                        <span>${((item.commoditySku.actFlag) ! == '1')?string('禁用', '启用')}<span/>
                                        <input type="hidden" name="priceSchemeDetails[${(item_index)}].commoditySku.actFlag" value="${(item.commoditySku.actFlag) !}"/>
                                    </td>
                                    <td class="name">
                                        <#if (priceScheme.vendor.settlementType) ?? && (priceScheme.vendor.settlementType) == '0'>
                                        <input type="text" class="form-control input-sm" name="priceSchemeDetails[${(item_index)}].supplyPrice" value="${item.supplyPrice !}" readonly="readonly"/>
		                                <#else>
		                                <input type="number" class="form-control input-sm" name="priceSchemeDetails[${(item_index)}].supplyPrice" value="${item.supplyPrice !}" readonly="readonly"
                                                data-rule-required="true" data-msg-required="第${(item_index + 1) }行供货价不能为空" 
                                                data-rule-decimal="true" data-msg-decimal="第${(item_index + 1) }行供货价必须是数字类型且小数位不能超过两位"
                                                step="0.1" min="0"/>
		                                </#if>
                                    </td>
                                    <td class="name">
                                        <#if (priceScheme.vendor.settlementType) ?? && (priceScheme.vendor.settlementType) == '1'>
                                        <input type="text" class="form-control input-sm" name="priceSchemeDetails[${(item_index)}].points" value="${item.points !}" readonly="readonly"/>
		                                <#else>
		                                <input type="number" class="form-control input-sm" name="priceSchemeDetails[${(item_index)}].points" value="${item.points !}" readonly="readonly"
                                                data-rule-required="true" data-msg-required="第${(item_index + 1) }行扣点不能为空" 
                                                data-rule-isInteger="true" data-msg-isInteger="第${(item_index + 1) }行扣点必须是整数"
                                                step="1" min="1"/>
		                                </#if>
                                    </td>
                                </tr>
                                </#list>
                                </#if>
                                </tbody>
                            </table>
                         </div>
							<div class="form-tr">
								<div class="btn-div" style="float: right;">
									<#if viewType == '0'> <#--  -->
									<input type="submit" id="savePriceScheme" class="btn btn-primary" value="保存"> 
									</#if>  
									<input type="button" class="btn btn-default btn-close-iframeFullPage" value="返回" />
								</div>
							</div>
						</form>
                </div>
            </div>
        </div>
    </div>
    </div>
<#include "../common/select.ftl" encoding="utf-8">
<script src="${BasePath !}/asset/js/control/bootstrap/js/bootstrap.min.js"></script>
<script src="${BasePath !}/asset/js/stms/priceScheme/priceScheme_form.js"/></script> 

<script type="text/javascript">
	$(function(){
	    executeValidateFrom('myform');
	    $(".input-select2").select2();
	});
    //初始化
	var pattern = $("#pattern");
	var settlementType = $("#settlementPattern");
// 	var commodityStatus = $("#commodityStatus");
	$("#patternShow").val(pattern.find("option:selected").text());
	$("#settlementTypeShow").val(settlementType.find("option:selected").text());
// 	$("#commodityStatusShow").val(commodityStatus.find("option:selected").text());
</script>
</body>
</html>