<!DOCTYPE html>
<html>
<head>
    <meta name="decorator" content="list"/>
    <title>供货价格管理详情页面</title>
    <#include "../common/share_macro.ftl" encoding="utf-8">
</head>
<body>
    <div class="tab-content">
        <div class="tab-pane fade in active" id="myAccount">
            <div class="col-md-12">
                <div class="search">
                    <form id="find-page-orderby-form" action="${BasePath !}/auxiliaryData/list.do" method="post">
                        <input id="find-page-index" type="hidden" name="pageIndex" value="1" />
                        <input id="find-page-count" type="hidden" value="${(pageObj.pageCount) !}" />
                        <input id="find-page-size" type="hidden" name="pageSize" value="${(pageObj.pageSize) !}" />
                        <input id="commodityCode" type="hidden" name="commodityCode" value="${(commodityCode)!}"/>
                        <input id="viewType" type="hidden" name="viewType" value="${(viewType)!}"/>
                        <select class="input-select2" id="pattern" name="pattern" style="display:none;">
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
                        <div class="inquire-ul">
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
                                        <#list commodityStatusList as item>
                                            <#if item.getValue() == priceScheme.commodity.status>
                                                ${item.getName()}
                                            </#if>
                                        </#list>
                                    </div>
                                </div>
                            </div>                              
                        </div>
                    </form>
                </div>
            </div>

            <!-- SSUI: 只需定义 DataTable 外围的 DIV ID，注意添加统一的 class: ff_DataTable 便于全局控制 -->
            <div id="data_list" class="ff_DataTable"></div>
            <div class="col-md-12" style="height: 20px;">
			</div>
			<div class="col-md-12">
				<div class="btn-div" style="float: right;">
					<input type="button" class="btn btn-default btn-close-iframeFullPage" value="返回" />
				</div>
			</div>
        </div>
    </div>
<script type="text/javascript" src="${BasePath !}/asset/js/stms/priceScheme/priceScheme_editList.js?v=${ver !}"></script>
<style>
    .clm_name{word-break:break-all;}
</style>
<script type="text/javascript">    
	//初始化
	var pattern = $("#pattern");
	var settlementType = $("#settlementPattern");
	//var commodityStatus = $("#commodityStatus");
	$("#patternShow").val(pattern.find("option:selected").text());
	$("#settlementTypeShow").val(settlementType.find("option:selected").text());
    //SSUI: 生成各种字典
    var dict_actFlag = {"0":"启用", "1":"禁用"};
    var purchasePattern = <@JSONObject dataDict="purchase_pattern"/>;
    var settlementPattern = <@JSONObject dataDict="settlement_pattern"/>;
    var stmsSchemeType = <@JSONObject dataDict="stms_scheme_type"/>;
    var pricePlanStatus = {"ACTIVE":"生效中", "INEFFECTIVE":"未生效", "EXPIRED":"已失效", "CANCELED":"已取消", "DELETED":"已删除"};
    $(document).ready(function() {
        requirejs([ 'ff/init_datatable' ], function(initDataTable) {
            var dt_demo_list = new initDataTable({
                div_id : 'data_list',
                show_checkbox: false,
                url : rootPath + "/priceScheme/editList.do",
                columns:[
                    { data: "code", label: '价格方案编号', class:'text-nowrap'},
                    { data: "name", label: '价格方案名称', class:'text-nowrap'},
                    { data: "type", label: '方案类型', class:'text-nowrap', data_dict: stmsSchemeType },
                    { data: "effectiveTime", label: '生效时间', class:'text-nowrap'},
                    { data: "invalidTime", label: '失效时间', class:'text-nowrap'},
                    { data: "status", label: '方案状态', class:'text-nowrap', data_dict:pricePlanStatus},
                    { data: "createBy.name", label: '创建人', class:'text-nowrap'},
                    { data: "createDate", label: '创建时间', class:'text-nowrap'},
                    { data: "cancelBy.name", label: '取消人', class:'text-nowrap'},
                    { data: "cancelDate", label: '取消时间', class:'text-nowrap'},
                ],
                gen_permission: function() {
                    var map = [];
                    // SSUI: 生成权限
                    if ($("#viewType").val() == '0') {
                    	<@permission name="stms:priceScheme:edit">
                    	map.push('edit');
                        </@permission>
                    	<@permission name="stms:priceScheme:delete">
                    	map.push('delete');
                        </@permission>
                        
                        
                    }
                    
                    return map;         
                },
                clm_action: function(item){
                    // SSUI: gen_action() 在外链的 user_list.js 中详细定义
                    return gen_action(item);
                },
                row_dblclick:function(row,data) {
                    iframeFullPage(rootPath + "/priceScheme/form.do?commodityCode=" + data.commodity.code + "&id=" + data.id + "&viewType=1");
                } 
            });
            
            $('#data_list').on( 'draw.dt', function () {
            	if ("${viewType}" == '1') {
	            	var div = $("div#data_list");
	                var head = div.find("div.dataTables_scroll div.dataTables_scrollHead");
	                head.find("th.clm_action").hide();
            	}
            } );
        });
    });
</script>
</body>
</html>