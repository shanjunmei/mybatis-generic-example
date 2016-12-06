var rootURL = $("#ctx").val();
var loadPageTab = function(loadaurl, strParam){	
	
	var $searchBtn = $("#search-btn");
	
	if(loadaurl===null || loadaurl==="" || typeof(loadaurl)==="undefined"){
	}else{
		$('#content-wrapper').removeClass('hide-content-wrapper');
		$("#search-text").val(loadaurl);
		 
		if (typeof strParam != 'undefined') {
			var data_url = $(loadaurl + '-li').find('a').attr('data-url');
			$('li[datalink^="' + data_url + '"]').find('.tab_close > a').click();
			 
			$searchBtn.data('src_param', strParam);
			 
			setTimeout(function(){
				$searchBtn.click();
			}, 200);
			 
		} else {
			$searchBtn.click();
		}
		
		$('#dashboard_menu').hide();
	}
	
	changeDivHeight();  
}

$(function() {	

    window.addEventListener("message", function( event ) {
		
        // 判断子窗口发送过来的数据，显示在父窗口中
    	var getCurIframe=event.data;
    	var curIframeObj = getCurIframe.split(",");
		
		if (curIframeObj.length > 1 && $('#' + curIframeObj[0]).length) {
				
			if (curIframeObj[1]=='hidden'){
				$('#pagetab_contentholder').showLoader();
				document.getElementById(curIframeObj[0]).style.visibility = "hidden";
				
			}else if(curIframeObj[1]=='show'){
				$.fn.removeLoader();
				document.getElementById(curIframeObj[0]).style.visibility = "visible";
				
			}else if(curIframeObj[1]=='refload'){
				window.location.reload();
				
			}else if(curIframeObj[1]=='closeAll'){
				var _refurl=window.location.protocol+'//'+window.location.host+window.location.pathname;
				window.location=_refurl;
				
			}else if(curIframeObj[1].indexOf('pageTab:') > -1){
				var arr = curIframeObj[1].split(':');
				var pageHash = arr[1];
				var strParam = (typeof arr[2] != 'undefined') ? arr[2] : '';

				loadPageTab($.trim(pageHash), strParam);
				
			} else if(curIframeObj[1]=='closeCurrentTab'){
                $.fn.pageTab.closeCurrentTab();
				
			} else {	
			
				setTimeout(function () {
					$.fn.removeLoader();
					document.getElementById(curIframeObj[0]).style.visibility = "visible";
				}, 1000);
			}
		}

		// 如果有“当前作业仓”
		if (curIframeObj.length > 2) {
			
			if (curIframeObj[2] != '') {
				$('#top_curr_warehouse').show().find('span').text(curIframeObj[2]);
				
			} else {
				$('#top_curr_warehouse').hide();
			}
		}
		
    }, false );	
	
	
	window.onload=function(){  
		loadPageTab(location.hash);
    }
    
    
  $.ajax({
        type : "POST",
        url : rootURL+"/queryMenuByUserId.do",
        data : "name=John&location=Boston",
        async: false,
        success : function(resData) {            	
         // console.log(resData);
          var templateHTML = "";
         
          $("aside.main-sidebar > section > ul").empty();
          $("aside.main-sidebar > section > ul").append(templateHTML); 
          
          //update menu init  liuyu 2016-1-28  strat 
          var ulId='sidebar-menu';	
          _appendSubMenu($('.' + ulId),resData);
          //为第一个添加展开效果：active
          $("aside.main-sidebar > section > ul li").first().addClass("active"); 
        //update menu init  liuyu 2016-1-28  end 
        }
      });
  
  function _appendSubMenu($parent, resDataMenu) {
      // 拼装子菜单
      var menuItems = resDataMenu;
      for (var i = 0; i < menuItems.length; i++) {
          var menuItem = menuItems[i];
          // 添加li
          var menuItemId = menuItem.id + '-li';
          var liHtml = ' <li id="' + menuItemId + '" class="treeview"></li>';
          $parent.append(liHtml);
          var $menuItem = $('#' + menuItemId);
          if (menuItem.sub.length > 0 ) {
              // 子集不为空情况下添加次级菜单
              var ulId = menuItem.id + '-submenu';
              var ulHtml = '<a href="'+ ((menuItem.href == '')?'javascript:void(0)':menuItem.href) +'"> <i  class="fa fa-dashboard"></i><span>'+menuItem.name+'</span> <i class="fa fa-angle-left pull-right"></i></a><ul id="' + ulId + '" class="treeview-menu" ></ul>';
              $menuItem.append(ulHtml);
              _appendSubMenu($('#' + ulId), menuItem.sub);
          } else {
        	  var menuLiHtml='<a href="#'+menuItem.id+'" data-url="'+ menuItem.url +'" name="'+menuItem.name+'"><i class="fa fa-circle-o"></i>'+menuItem.name+'</a>';
              $menuItem.append(menuLiHtml);
          }
      }
  };

  var tabTitleHeight = 55; // 页签的高度
  $.fn.initPageTab({
      renderTo: '#content-wrapper', uniqueId: 'pageichotab',
     // contentCss: { 'height': $('#content-wrapper').height() - tabTitleHeight },
      contentCss: { 'height': $('.content-wrapper').height()-$('.content-header').height()-$('.main-footer').height()-$('.main-header').height()-5},
      tabs: [], loadOnce: true, tabWidth: 110, titleHeight: tabTitleHeight
  });
  
  // =========================================================
  // 为每个菜单项绑定click事件
  $(document).on('click', '.sidebar-menu [data-url]', function() {

	if ($(this).closest('#dashboard_menu').length){
		window.location.href = '//' + window.location.host + window.location.pathname + $(this).attr('href');
		window.location.reload();
		return false;
	}
		
     var nav = $(this).attr("data-url");
       if(nav =="" || nav == "#"){
        return;
      }

	  $('#dashboard_menu').hide();
	  $('#content-wrapper').removeClass('hide-content-wrapper');	  
	  
     //add Content Header (Page header)       liuyu 2016-1-22  strat
       var clickName=$(this).text();
      /* var clickParentName=$(this).parent().parent().siblings('a').text();
       $(".content-header").html('');
       var addHtml='<h1>'+clickName+'</h1><ol class="breadcrumb"><li><a href="#"><i class="fa fa-dashboard"></i> '+clickParentName+'</a></li><li class="active">'+clickName+'</li></ol>';
       $(".content-header").append(addHtml);*/
       //add Content Header (Page header)       liuyu 2016-1-22  end
       
       //change url:targetURL       liuyu 2016-1-22  strat
       var targetURL =nav;
      // 这里清除掉所有的active
      $("[data-url]").each(function() {
        $(this).parent().removeClass("active");
      });
      $(this).parent().siblings().removeClass("active");
      $(this).parent().siblings().children('ul').removeClass("menu-open"); 
      $(this).parent().siblings().children('ul').slideUp('slow');
      // 为当前选择的项添加Active
      $(this).parent().addClass("active");

      
     /* 参数解析
       * tabFirer：判断是否已存在，已存在则打开本身
       */
      $.fn.pageTab.addTab({
          tabFirer: $(this),			
          title: clickName,
          closeable: true,
          data: {
              dataType: 'iframe',
              dataLink: targetURL
          }
      }).loadData();
      
      
    });

});

$(function(){
 $("li.dropdown.user.user-menu > a").on("click",function(event){
	 
	 if($(this).attr("aria-expanded") ==="false"){
		$(this).attr("aria-expanded","true");
		$(this).parent("li.dropdown").addClass("open");
	 }
	 else{
		$(this).attr("aria-expanded","false");
		$(this).parent("li.dropdown").removeClass("open");
	 }
	 event.stopPropagation();
 });
 
 //add search form (Optional)  liuyu 2016-1-22  strat    未完成， doto
  $("#search-btn").on("click",function(event){
 	var searchText =$("#search-text").val();
	
 	if (searchText!="") {
 		var searchChange=$("aside.main-sidebar .sidebar-menu a[href='"+searchText+"']");
 		if(searchChange.length > 0){
 		//console.log(searchText);
		 	if($(searchChange).parent().parent().parent().hasClass('active')){
		 		//console.log('1');
		 	}else{
		 		//移除之前展开效果
				$("aside.main-sidebar .sidebar-menu .treeview")
					.removeClass("active")
					.find(".treeview-menu")
					.removeClass("menu-open").slideUp('slow');
		 	 	
		 	 	//添加展开效果
		 	 	$(searchChange).parentsUntil(".sidebar-menu>ul").slideDown("slow");
		 	 	$(searchChange).parentsUntil(".sidebar-menu>li").addClass("active");
		 	 	//$(searchChange).parent().parent().parent().addClass("active");
		 	 	$(searchChange).parent().parent().addClass("menu-open"); 
		 	 	//$(searchChange).parent().parent().slideDown("slow");
		 	 	
		 	}
 		var nav = $(searchChange).attr("data-url");
		
		
        if(nav =="" || nav == "#"){
         return;
       }
        var clickName=$(searchChange).text();
        var clickParentName=$(searchChange).parent().parent().siblings('a').text();
        var addHtml='<h1>'+clickName+'</h1><ol class="breadcrumb"><li><a href="#"><i class="fa fa-dashboard"></i> '+clickParentName+'</a></li><li class="active">'+clickName+'</li></ol>';
        $("aside.main-sidebar .content-header").html(addHtml);

        var src_param = $(this).data('src_param') || '';
		
		if (src_param != '') {
			nav = nav + '?' + src_param;
		}

		var targetURL =nav;
       // 这里清除掉所有的active
       $("[data-url]").each(function() {
         $(this).parent().removeClass("active");
       });
       $(searchChange).parent().siblings().removeClass("active");
       $(searchChange).parent().siblings().children('ul').removeClass("menu-open").slideUp('slow');
       // 为当前选择的项添加Active
       $(searchChange).parent().addClass("active");
       
       /* 参数解析
        * tabFirer：判断是否已存在，已存在则打开本身
        */
       $.fn.pageTab.addTab({
           tabFirer: $(searchChange),			
           title: clickName,
           closeable: true,
           data: {
               dataType: 'iframe',
               dataLink: targetURL
           }
       }).loadData();
 	}
 	}
  });
  //add search form (Optional)  liuyu 2016-1-22  end 	未完成， doto
 $("aside.control-sidebar").remove();

 if (window.location.href.indexOf('#') == -1) {
	genSitemap();
 }
});

var genSitemap = function(){
	var $dashboardMenu = $('#dashboard_menu');
	var $sideMenu = $('.main-sidebar .sidebar-menu').clone();
	$dashboardMenu.empty();
	$dashboardMenu.append($sideMenu).show().find(':hidden').show();	
	$('#content-wrapper').addClass('hide-content-wrapper');
};

//当浏览器窗口大小改变时，设置显示内容的高度  
window.onresize=function(){  
	 changeDivHeight();  
}  
function changeDivHeight(){               
	var h = document.documentElement.clientHeight;//获取页面可见高度  
	h=h-160;
	$("#content-wrapper iframe").css("height",h+"px");
	$("#content-wrapper #pagetab_contentholder").css("height",h+"px");
	var h2 = document.documentElement.clientHeight;//获取页面可见高度  
	var mainheaderH=$(".main-header").height();
	var mainfooterH=$(".main-footer").height();
	h2=h2-(mainheaderH+mainfooterH+30);
	$(".content-wrapper").css("min-height",h2+"px");
}