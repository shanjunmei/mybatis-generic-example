	FFZX.download = function(url, params){
		
		var $form = $("<form />"); //定义一个form表单
		
		$form.attr("style","display:none");
		$form.attr("target","");
		$form.attr("method","post");
		$form.attr("action",url);
		
		if (params) {
			
			if($.isArray(params)){
				for(var i=0;i<params.length;i++){
					var paramInput=$("<input />");
					paramInput.attr("type", "hidden");
					paramInput.attr("name", "numbers");
					paramInput.attr("value", params[i].numbers);
					$form.append(paramInput);
				}
			}else{
				for (var pk in params) {
					var paramInput=$("<input />");
					paramInput.attr("type", "hidden");
					paramInput.attr("name", pk);
					paramInput.attr("value", params[pk]);
					$form.append(paramInput);
				}
			}
		}
		
		$("body").append($form);
		$form.submit(); //表单提交 
	}