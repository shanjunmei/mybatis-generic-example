<!DOCTYPE html>
<html>
<head>
    <meta name="decorator" content="list"/>
    <title>合伙人页面</title>
    <#include "../common/share_macro.ftl" encoding="utf-8">
</head>
<body>
    <div class="tab-content">
        <div class="tab-pane fade in active" id="myAccount">
            <div class="col-md-12">
                <div class="search">
                    <form id="find-page-orderby-form" action="${BasePath !}/auxiliaryData/list.do" method="post">
                        <input id="find-page-index" type="hidden" name="pageIndex" value="1" />
                        <input id="hidden-dict-type" name="type" type="hidden" value="${(dict.type)!}"/>
                        <input id="find-page-count" type="hidden" value="${(pageObj.pageCount) !}" />
                        <input id="find-page-size" type="hidden" name="pageSize" value="${(pageObj.pageSize) !}" />
                        <div class="inquire-ul">
                            <div class="form-tr">
                                <div class="form-td">
                                    <label>供应商：</label> 
                                    <div class="div-form">
                                        <div class="f7" id="vendorPartner">
                                            <input type="hidden" id="vendorCode" name="vendor.code" value=""/>
                                            <input class="form-control input-sm txt_mid" type="text" id="vendorName" name="vendorName" value="" readonly="readonly">
                                            <span class="selectDel">×</span>
                                            <span class="selectBtn">选</span>
                                        </div>
                                    </div>
                                </div>
                                <#-- 
                                <div class="form-td">
                                    <label>采购模式：</label>
                                    <div class="div-form">
                                        <select class="input-sm" id="vendorPurchaseType" name="vendor.purchaseType" 
                                            data-hint="全部" data-option='<@JSONArray dataDict="purchase_pattern"/>' data-selected="">
                                        </select>                 
                                    </div>
                                </div>
                                 -->
                                <div class="form-td">
                                    <label>结算模式：</label>
                                    <div class="div-form">
                                        <select class="input-sm" id="vendorSettlementType" name="vendor.settlementType" 
                                            data-hint="全部" data-option='<@JSONArray dataDict="settlement_pattern"/>' data-selected="">
                                        </select>                     
                                    </div>
                                </div>
                                <div class="form-td">
                                    <label>商品：</label>
                                    <div class="div-form">
                                        <div class="f7" id="commodiySelectBox">
                                            <input type="hidden" id="commodityCode" name="commodity.code" value=""/>
                                            <input class="form-control input-sm txt_mid" type="text" id="commodityName" name="commodityName" value="" readonly="readonly">
                                            <span class="selectDel">×</span>
                                            <span class="selectBtn">选</span>
                                        </div>
                                    </div>
<!--                                     <div class="div-form"> -->
<!--                                         <input class="form-control input-sm txt_mid" type="text" name="commodity.code">                      -->
<!--                                     </div> -->
                                </div>
                            </div>                              
                        </div>
                        <div class="btn-div3">
                            <!-- SSUI: 查询按钮的 type 改为 button -->
                            <button id="find-page-orderby-button" class="btn btn-primary btn-sm btn-inquire" type="button"> <i class="fa fa-search"></i>&nbsp;&nbsp;查询</button>

                            <!-- SSUI: 注意添加 class: btn-clear-keyword 和 data-target="DataTable的ID"-->
                            <button class="btn btn-primary btn-sm btn-clear-keyword" data-target="data_list"> <i class="fa fa-trash-o"></i>&nbsp;&nbsp;清空 </button>
                            <@permission name="stms:priceScheme:import">
                            <button  onclick="showDown()" class="btn btn-primary btn-sm" type="button"><i class="fa fa-arrow-circle-down"></i>&nbsp;&nbsp;批量新增</button>
                            </@permission>
        
                            <@permission name="stms:priceScheme:export">
                            <a onclick="exportExcel()" class="btn btn-primary btn-sm" ><i class="fa fa-arrow-circle-up"></i>&nbsp;&nbsp;导出</a>
                            </@permission>
                        </div>
                    </form>
                </div>
            </div>

            <!-- SSUI: 只需定义 DataTable 外围的 DIV ID，注意添加统一的 class: ff_DataTable 便于全局控制 -->
            <div id="data_list" class="ff_DataTable"></div>
        </div>
    </div>
<script type="text/javascript" src="${BasePath !}/asset/js/stms/priceScheme/priceScheme_table_list.js?v=${ver !}"></script>
<style>
    .clm_name{word-break:break-all;}
</style>
<script>    
    //SSUI: 生成各种字典
    var dict_actFlag = {"0":"启用", "1":"禁用"};
    var purchasePattern = <@JSONObject dataDict="purchase_pattern"/>;
    var settlementPattern = <@JSONObject dataDict="settlement_pattern"/>;
    var stmsSchemeType = <@JSONObject dataDict="stms_scheme_type"/>;
    $(document).ready(function() {
        requirejs([ 'ff/init_datatable' ], function(initDataTable) {
            var dt_demo_list = new initDataTable({
                div_id : 'data_list',
                show_checkbox: false,
                url : rootPath + "/priceScheme/queryTableData.do",
                columns:[
                    { data: "vendor.code", label: '供应商编码', class:'text-nowrap'},
                    { data: "vendor.name", label: '供应商名称', class:'text-nowrap'},
                    { data: "vendor.purchaseType", label: '采购模式', class:'text-nowrap', 
                    	render: function(data, type, full, meta) {
                    		        if (data == 0) {
                    		        	return "联营促销";
                    		        } else {
                    		        	return "联营";
                                    }
                    		        
                    		    }
                    },
                    { data: "commodity.barCode", label: '商品条形码', class:'text-nowrap'},
                    { data: "commodity.name", label: '商品名称', class:'text-nowrap'},
                    { data: "commodity.status", label: '商品状态', class:'text-nowrap',
                        render: function(data, type, full, meta) {
                            if (data == 'COMMODITY_STATUS_ADDED') {
                                return "已上架";
                            } else if (data == 'COMMODITY_STATUS_DEL') {
                                return "已删除";
                            } else if (data == 'COMMODITY_STATUS_ENTRYED') {
                                return "已录入";
                            } else if (data == 'COMMODITY_STATUS_ENTRYING') {
                                return "录入中";
                            } else if (data == 'COMMODITY_STATUS_SHELVES') {
                                return "已下架";
                            }
                        }
                    },
                    { data: "vendor.settlementType", label: '结算模式', class:'text-nowrap', 
                    	render: function(data, type, full, meta) {
                            if (data == 0) {
                                return "扣点";
                            } else if (data == 1) { 
                                return "供货价";
                            } else {
                            	return "";
                            }
                        }
                    },
                    { data: "type", label: '生效方案类型', class:'text-nowrap', data_dict: stmsSchemeType},
                    { data: "code", label: '生效方案编号', class:'text-nowrap', render: function(data, type, full, meta) {return toDetailed(data, type, full, meta)}},
                    { data: "name", label: '生效方案名称', class:'text-nowrap'},
                    { data: "effectiveTime", label: '生效时间', class:'text-nowrap'},
                    { data: "invalidTime", label: '失效时间', class:'text-nowrap'},
                    { data: "priceScheme.code", label: '备用方案编号', class:'text-nowrap', render: function(data, type, full, meta) {return toStandbyDetailed(data, type, full, meta)}},
                    { data: "priceScheme.name", label: '备用方案名称', class:'text-nowrap'},
                    { data: "priceScheme.type", label: '备用方案类型', class:'text-nowrap',
                    	render: function(data, type, full, meta) {
                            if (data == 0) {
                                return "正常供货价";
                            } else if (data == 1) {
                                return "活动供货价";
                            } else if (data == 2) {
                                return "正常扣点";
                            } else if (data == 3) {
                                return "活动扣点";
                            }
                        }	
                    },
                ],
                gen_permission: function() {
                    var map = [];
                    // SSUI: 生成权限
                    <@permission name="stms:priceScheme:add">
                        map.push('add');
                    </@permission>
                    <@permission name="stms:priceScheme:edit">
                        map.push('edit');
	                </@permission>                    
	                <@permission name="stms:priceScheme:takeEffect">
                        map.push('isEnabled');
	                </@permission>                        
                    return map;         
                },
                clm_action: function(item){
                    // SSUI: gen_action() 在外链的 user_list.js 中详细定义
                    return gen_action(item);
                },
                row_dblclick:function(row, data) {
                    iframeFullPage(rootPath + "/priceScheme/editListView.do?commodityCode=" + data.commodity.code + "&viewType=1");
                } 
            });
        });
    });
    
    
</script>
</body>
</html>