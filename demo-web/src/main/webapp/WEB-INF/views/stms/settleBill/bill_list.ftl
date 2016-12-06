<#include "../../global.ftl" encoding="utf-8">
<html>
<head>
<meta name="decorator" content="list" />
<title>应付单/退款单列表</title>
<#include "../../common/share_macro.ftl" encoding="utf-8">
</head>

<body>

	<div class="tab-content">
		<div class="tab-pane fade in active" id="settleBill_list">
			<div class="col-md-12">
				<div class="search">
					<form id="find-page-orderby-form" action="${BasePath !}/settleBill/billList.do" method="post">
						<input id="find-page-index" type="hidden" name="pageIndex" value="1" /> 
						<input id="find-page-count" type="hidden" value="${(pageObj.pageCount) !}" />
                        <input id="find-page-size" type="hidden" name="pageSize" value="${(pageObj.pageSize) !}" />
						<div class="inquire-ul">
							<div class="form-tr">
								<div class="form-td">
									<label>单据编号：</label> 
									<div class="div-form"><input name="billNo" class="form-control txt_mid input-sm" type="text" placeholder="应付/退款账单号" ></div>
								</div>
								
								<div class="form-td">
									 <label>单据类型：</label>
                                        <div class="div-form">
                 							<select name="type">
                 								<option value>--全部--</option>
                 								<option value="0">应付单</option>
                 								<option value="1">退款单</option>		
                 							</select>
                                        </div>
								</div>
								
								

								<div class="form-td">
									<label>业务开始时间：</label>
									<div class="div-form">
										<input name="businessStartDateTime" id="businessStartDateTime"
											class="form-control txt_mid input-sm" readonly="readonly"
											onfocus="WdatePicker({startDate:'%y',dateFmt:'yyyy-MM-dd',maxDate:new Date()})"/>
											
									</div>
								</div>

								<div class="form-td">
									<label>业务结束时间： </label>
									<div class="div-form">
										<input name="businessEndDateTime" id="businessEndDateTime"
											class="form-control txt_mid input-sm" readonly="readonly"
											onfocus="WdatePicker({startDate:'%y',dateFmt:'yyyy-MM-dd',maxDate:new Date(),minDate:'#F{$dp.$D(\'businessStartDateTime\')}'})"/>
									</div>
								</div>
								
								
								<div class="form-td">
									<label>应付/应退账单金额合计：</label>
									<div class="div-form">
										<input  name="smapayAmount"
											class="form-control txt_mid input-sm" type="text"/>
											
									</div>
								</div>
								
							
							
							
								<div class="form-td">
									<label>至：</label> 
									<div class="div-form"> 
                                             	<input  name="maxpayAmount"
											class="form-control txt_mid input-sm" type="text"
											/>
							
                                     </div>
                                              
								</div>
							</div>
							<div class="form-tr">    
                           		
								
								<div class="form-td">
									 <label>供应商：</label>
                                        <div class="div-form">
                                            	<div class="f7" onclick="vendorPopupFrom()">
												<input type="hidden" id="vendorId" name="vendorId"/>
												<input type="hidden" id="vendorCode" name="vendorCode"/> <input
													class="form-control input-sm txt_mid" type="text"
													id='vendorName' name="suplierName" readonly="readonly" />
													<span class="selectDel" onclick="$(this).parent().find('input').val('');">×</span>
													 <span	class="selectBtn">选</span>
											</div>              
                                        </div>
								</div>
								
								
								<div class="form-td">
									<div class="div-form">
										<input type="checkbox" id="_selectAll"  />   
									</div>	
                                     <div class="div-form">
                                         <label>选中全部</label>
                                	  </div>
								</div>
							
								</div>
						</div>
						
						<div class="btn-div3">
							<button id="find-page-orderby-button" class="btn btn-primary btn-sm btn-inquire" type="button"><i class="fa fa-search"></i>&nbsp;&nbsp;查询</button>
							<a  class="btn btn-primary btn-sm btn-clear-keyword" data-target="data_list"><i class="fa fa-remove"></i>&nbsp;&nbsp;清空</a>
						
							<@permission name="stms:settleBill:generate">
							<a class="btn btn-primary btn-sm" type="batchGenerate" onclick="batchGenerate()"><i class="fa fa-plus"></i>&nbsp;&nbsp;生成结款单</a>
							</@permission>
							<!-- <input type="button" class="btn btn-default btn-close-iframeFullPage" value="返回" onclick="isReturn()"> -->
							<a class="btn btn-primary btn-sm" onclick="javascript:history.go(-1)" ></i>&nbsp;&nbsp;返回</a>
						</div>
					</form>
				</div>
			</div>
			
		</div>
	</div>


<div id="data_list" class="ff_DataTable"></div>



<script type="text/javascript" src="${BasePath}/asset/js/stms/settleBill/settleBill_list.js?v=${ver !}"></script>
<script type="text/javascript">


var _bill_list=null;


$(document).ready(function(){		
		requirejs(['ff/init_datatable'],function( initDataTable){
		_bill_list=new initDataTable({
			div_id: 'data_list',
			url: rootPath + "/settleBill/queryBillData.do",
			columns:[
					{ data: "billNo", label: '单据编号', class:'text-nowrap',render:function(data, type, full, meta){
							var target=rootPath ;//+ "/bill/form.do?viewType=0&id=" + full.id;
							if('1'==full.type){
								target=target+"/refundBillDetail/listBillDetail.do?id="+full.id+"&queryid=0"
							}else if("0"==full.type){
								target=target+"/payableBillDetail/bill_detail_list.do?id=" + full.id;
							}else{
								return data;
							}
							return '<a href="javascript:iframeFullPage(\''+target+'\')">'+data+'</a>';
						}
					},
					{ data: "type", label: '单据类型',render:function(data){
						if(data==0){
							return "应付单";
						}else if(data==1){
							return "退款单";
						}else{
							return data;
						}
					
					} },
					{ data: "vendorCode", label: '供应商编码' },
					{ data: "vendorName", label: '供应商名称' },
					{ data: "goodsTotalCount", label: '商品总价合计' },
					{ data: "supplyTotal", label: '供货价合计' },
					{ data: "pointsAmountTotal", label: '扣点金额合计' },
					{ data: "payableAmountTotal", label: '应付金额合计' },
					{ data: "payableObtainAmountTotal", label: '应付所得金额合计' },
					{ data: "businessStartDateTime", label: '业务开始时间', class:'text-nowrap', format:{datetime:'yyyy-MM-dd HH:mm:ss'} },
					{ data: "businessEndDateTime", label: '业务结束时间', class:'text-nowrap', format:{datetime:'yyyy-MM-dd'} },
					{ data: "createDate", label: '创建时间', class:'text-nowrap', format:{datetime:'yyyy-MM-dd HH:mm:ss'} },
					{ data: "auditor", label: '审核人' },
					{ data: "auditTime", label: '审核时间', class:'text-nowrap', format:{datetime:'yyyy-MM-dd'} },
		
			],
			show_action:false
		})});
	});



function batchGenerate(){

var _selectAll=$("#_selectAll").is(":checked");
console.log(_selectAll);
var generateUrl=rootPath+"/settleBill";
var params=$("#find-page-orderby-form").serialize();

	if(_selectAll){
		generateUrl=generateUrl+"/generateByQuery.do";
		
	}else{
		var selectData=_bill_list.getSelectedData().raw;
		if(selectData.length==0){
			$.frontEngineDialog.executeDialogContentTime("请选择需要生成的结款单的单据","4000");
			return;
		}
		var p=null;
		for(var i=0;i<selectData.length;i++){
			if(p==null){
				p="numbers="+selectData[i].billNo;
			}else{
				p=p+"&numbers="+selectData[i].billNo;
			}
		}
		generateUrl=generateUrl+"/generateBySelect.do";
		params=p;
	}
	
	$.frontEngineAjax.executeAjaxPost(generateUrl,params,
		function(response){
			console.log(response);
			if(response.status==0){
				$.frontEngineDialog.executeDialogContentTime(response.infoStr,4000);
				FFZX.DT.get('data_list').ajax.reload();
				//_bill_list.ajax.reload();
			}else{
				$.frontEngineDialog.executeDialogOK("警告",response.infoStr);
			}
			
		},function(response){
			console.log(response);
			$.frontEngineDialog.executeDialogOK("警告",response.responseText);
		});
}
</script>
</body>
</html>
