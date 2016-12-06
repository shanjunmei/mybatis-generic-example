<#include "../../global.ftl" encoding="utf-8">
<html>
<head>
<meta name="decorator" content="list" />
<title>结款单管理</title>
<#include "../../common/share_macro.ftl" encoding="utf-8">
</head>
<body>

	<div class="tab-content">
		<div class="tab-pane fade in active" id="settleBill_list">
			<div class="col-md-12">
				<div class="search">
					<form id="find-page-orderby-form" action="${BasePath !}/settleBill/queryData.do" method="post">
						<input id="find-page-index" type="hidden" name="pageIndex" value="1" /> 
						<input id="find-page-count" type="hidden" value="${(pageObj.pageCount) !}" />
                        <input id="find-page-size" type="hidden" name="pageSize" value="${(pageObj.pageSize) !}" />
						<div class="inquire-ul">
							<div class="form-tr">
								<div class="form-td">
								<label>结款单号：</label> 
                                <div class="div-form">
                                	<input id="code" name="code" class="form-control txt_mid input-sm" type="text" placeholder="" value="${(settleBill.code) !}">
                                </div>
							</div>
							
							<div class="form-td">
								<label>关联单号：</label> 
								<div class="div-form"><input id="code1" name="billNo" class="form-control txt_mid input-sm" type="text" placeholder="应付/退款账单号" ></div>
							</div>
							
							<div class="form-td">
								<label>付款单状态：</label> 
		                         <div class="div-form">
									<!-- SSUI: 新的下拉菜单初始化方法 -->
									<select id="payStatus" name="payStatus"  data-option='<@JSONArray dataDict="pay_status"/>' data-selected="" data-hint="--全部--" class="input-sm"></select>
		                         </div>  
							</div>
							
							<div class="form-td">
								<label>供应商：</label>
								<div class="div-form">
			                    	<div class="f7" id="vendorPartner" onclick="vendorPopupFrom()">
			                    		<input type="hidden" id="vendorCode" name="vendorCode" value="${(settleBill.vendorCode) !}"/>
		                            	<input class="form-control input-sm txt_mid" type="text" 
		                            		id="vendorName" name="vendorName" value="${(settleBill.vendorName) !}" readonly="readonly">
		                            	<span class="selectDel" onclick="$(this).parent().find('input').val('');">×</span>
		                            	<span class="selectBtn">选</span>
		                        	</div>
							    </div>
						    </div>
						    
						    <div class="form-td">
					    		<label>应结款金额：</label> 
								<div class="div-form">
									<input style="width: 66px;" id="smapayAmount" name="smapayAmount" class="form-control txt_mid input-sm" type="text" > 至 
									<input style="width: 66px;" id="maxpayAmount" name="maxpayAmount" class="form-control txt_mid input-sm" type="text" >
								</div>
						    </div>
						    
						    <div class="form-td">
									<div class="div-form">
										<input type="checkbox" id="_selectAll" checked="checked" />   
									</div>	
                                     <div class="div-form">
                                         <label>选中全部</label>
                                	  </div>
								</div>
						</div>
						
						<div class="btn-div3">
							<button id="find-page-orderby-button" class="btn btn-primary btn-sm btn-inquire" type="button"><i class="fa fa-search"></i>&nbsp;&nbsp;查询</button>
							
	                        <button class="btn btn-primary btn-sm btn-clear-keyword"  data-target="_data_table"><i class="fa fa-trash-o"></i>&nbsp;&nbsp;清空</button>
							<@permission name="stms:settleBill:export">
	                        <a onclick="exportExcel()" class="btn btn-primary btn-sm" ><i class="fa fa-arrow-circle-up"></i>&nbsp;&nbsp;导出</a>
	                        </@permission>
							<@permission name="stms:settleBill:generate">
	                        <!-- <a onclick="openBillList()" class="btn btn-primary btn-sm" ><i class="fa fa-arrow-circle-up"></i>&nbsp;&nbsp;新增结款单</a>-->
	                         <a href="${BasePath !}/settleBill/billList.do" class="btn btn-primary btn-sm"><i class="fa fa-plus"></i>&nbsp;&nbsp;新增结款单</a>
	                         </@permission>
						</div>
					</form>
				</div>
			</div>
			
		</div>
	</div>


<div id="_data_table" class="ff_DataTable"></div>

<script type="text/javascript" src="${BasePath}/asset/js/stms/settleBill/settleBill_list.js?v=${ver !}"></script>
<script type="text/javascript">
	var payStatus=<@JSONObject dataDict="pay_status"/>;
	var _data_list=null;
	$(document).ready(function(){		
	requirejs(['ff/init_datatable'],function( initDataTable){
		_data_list=new initDataTable({
		div_id: '_data_table',
		url: rootPath + "/settleBill/queryData.do", 
		columns:[
			{ data: "code", label: '结款单号',render: function(data,type,full,meta){return toDetailed(data, type, full, meta)}},
			{ data: "payStatus", label: '付款状态', data_dict:payStatus },
			{ data: "vendorCode", label: '供应商编码' },
			{ data: "vendorName", label: '供应商名称' },
			{ data: "payAmountSum", label: '应付账单金额总计' },
			{ data: "refundAmountSum", label: '退款账单金额总计(元)' },
			{ data: "payAmount", label: '应结款金额(元)' },
			{ data: "cumulativePayAmount", label: '累计结款金额(元)' },
			{ data: "remindPayAmount", label: '剩余结款金额(元)' },
			{ data: "createDate", label: '创建时间', class:'text-nowrap', format:{datetime:'yyyy-MM-dd HH:mm:ss'} },
			{ data: "lastPayTime", label: '上次结款时间', class:'text-nowrap', format:{datetime:'yyyy-MM-dd HH:mm:ss'} },
		],
		gen_permission: function(){
			// SSUI: 生成权限
			var map = [];	
			//结款
 			<@permission name="stms:settleBill:pay">
				map.push('SBC');
 			</@permission>
			//结款日志
 			<@permission name="stms:settleBill:log">
				map.push('SBCLOG');
 			</@permission>
			return map;		
		},
            
           //生成“操作”列，item 为当前行的数据
           clm_action: function(item){
               //gen_action详细的定义，见下
               return gen_action(item);
           },
           row_dblclick:function(row,data){
             iframeFullPage(rootPath+"/settleBill/form.do?id="+data.id);
        }

	})});
});
	
</script>
</body>
</html>
