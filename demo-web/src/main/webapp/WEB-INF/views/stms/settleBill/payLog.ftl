<#include "../../global.ftl" encoding="utf-8">
<html>
<head>
<meta name="decorator" content="list" />
<title>付款日志</title>

</head>
<body>
<div class="tab-content">

	<div >
		<table class="table table-hover table-striped bor2 table-common" style="text-align:center">
					<thead>
						<tr>
							<th  class="tab-td-center">序号</th>
							<th  class="tab-td-center">付款时间</th>
							<th  class="tab-td-center">付款人</th>
							<th  class="tab-td-center">付款金额（元）</th>
							<th  class="tab-td-center">当期累计付款金额（元）</th>
							<th  class="tab-td-center">当期剩余付款金额（元）</th>
						</tr>
					</thead>
					<tbody>
						<#if dataList?? > 
						<#list dataList as item >
						<tr>
							<td>${(item_index+1) !}</td>
							<td>${(item.payTime?string('yyyy-MM-dd HH:mm:ss')) !}</td>
							<td>${(item.payUserName) !}</td>
							<td>${(item.payAmount) !}</td>
							<td>${(item.cumulativePayAmount) !}</td>
							<td>${(item.remainAmount) !}</td>
						</tr>
						</#list> 
						</#if>
					</tbody>
		</table>
	</div>	
	<div>
		<div  style="text-align:right;margin-top:20px;margin-right:30px">
			<input type="button" class="btn btn-default btn-close-iframeFullPage" value="返回" onclick="isReturn()">
		</div>
	</div>	
</div>
	
  	

</body>
</html>
