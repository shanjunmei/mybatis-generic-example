$(function() {
	//初始化事件
	
	initChange();
	
	// 匹配integer
    jQuery.validator.addMethod("isInteger", function(value, element) {       
         return this.optional(element) || /^[-\+]?\d+$/.test(value);       
    }, "匹配整数");
	
});

function typeChange(th) {
	var rowDatas = $("div#detailDiv").find("table tbody").find("tr[id^='row_']");
	var type = $(th).find("option:selected").val();
	//活动扣点不限制输入0和小数
	if ("3" == type) {
		rowDatas.each(function(index, doc) {
			var trPointsObj = $(doc).find('input[name$="points"]');
			trPointsObj.removeAttr("min");
		});
	} else if ("2" == type) {
		rowDatas.each(function(index, doc) {
			var trPointsObj = $(doc).find('input[name$="points"]');
			trPointsObj.attr("min", 1);
		});
	}
}

function initChange() {
	var rowDatas = $("div#detailDiv").find("table tbody").find("tr[id^='row_']");
	initSupplyPrice(rowDatas);
	initPoints(rowDatas);
	changeSchemeType(rowDatas);
}

function initSupplyPrice(rowDatas) {
	//拿到第一行的供货价对象
	var trSupplyPriceObjOne = rowDatas.find('input[name$="supplyPrice"]:eq(0)');
	if (trSupplyPriceObjOne != null && trSupplyPriceObjOne.length > 0) {
		//绑定一个一次性的改变事件
		trSupplyPriceObjOne.one("change", function() {
			rowDatas.each(function(index, doc) {
				var trSupplyPriceObj = $(doc).find('input[name$="supplyPrice"]');
				trSupplyPriceObj.val(trSupplyPriceObjOne.val());
			});
		});
	}
}

function initPoints(rowDatas) {
	//拿到第一行的扣点对象
	var trPointsObjOne = rowDatas.find('input[name$="points"]:eq(0)');
	if (trPointsObjOne != null && trPointsObjOne.length > 0) {
		//绑定一个一次性的改变事件
		trPointsObjOne.one("change", function() {
			rowDatas.each(function(index, doc) {
				var trIndex = $(this).attr("trRow");
				var trPointsObj = $(doc).find('input[name$="points"]');
				trPointsObj.val(trPointsObjOne.val());
			});
		});
	}
}

function changeSchemeType(rowDatas) {
	
	rowDatas.each(function(index, doc) {
		var trIndex = $(this).attr("trRow");
		if ($("#settlementTypeShow").val() == "扣点") {
			$(doc).find('input[name$="points"]').removeAttr("readonly");
		} else {
			$(this).find('input[name$="supplyPrice"]').removeAttr("readonly");
		}
	});
	
//	if ($("#id").val() != "" ) {
//		$("#type").prop("disabled", "disabled");
//	}
		
	if ($("#type").find("option:selected").text().startsWith("正常")) {
		$("#effectiveTime").prop("disabled", "disabled");
		$("#invalidTime").prop("disabled", "disabled");
	}
	
	$("#type").on("change", function() {
		if ($(this).find("option:selected").text().startsWith("正常")) {
			$("#effectiveTime").prop("disabled", "disabled");
			$("#invalidTime").prop("disabled", "disabled");
		} else {
			$("#effectiveTime").removeProp("disabled");
			$("#invalidTime").removeProp("disabled");
		}
	});
}
