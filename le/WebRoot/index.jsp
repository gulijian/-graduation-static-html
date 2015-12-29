<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<!DOCTYPE HTML >
<html>
  <head>
    <title>首页</title>
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<link href="css/font-awesome.min.css" rel="stylesheet">
	<link href="css/animate.min.css" rel="stylesheet">
	<script type="text/javascript"  src="js/jquery-1.11.1.min.js"></script>
  	<style type="text/css">
  	    /*common css*/
  		*{margin:0px;padding:0px;font-size:16x;font-family:"微软雅黑"}
  		a{text-decoration:none;color:white;}
  		li{list-style:none;}
  		/* navbar start*/
  		.active{background:red;}
  		.navbar{background:#101010;position:relative;height:60px;}
  		.navbar .navbar_item{position:relative;}
  		.navbar .navbar_left{float:left;left:100px;top:5px;}
  		.navbar .navbar_right{float:right;right:100px;}
  		.navbar .navbar_right ul li{float:left;margin:0px 20px;}
  		.navbar .navbar_right ul li a{padding:25px 25px;line-height:10px;display:block;border-radius:3px;}
  		.navbar .navbar_right ul li a:hover{background:red;}
  		.navbar .navbar_right ul li ul{position:absolute;width:20%;display:none;border:1px solid black;background:#474e5d;}
  		.navbar .navbar_right ul li ul li{float:none;margin:0px;}
  		.navbar .navbar_right ul li:hover ul{display:block;}
  		/*navbar end*/
  		/*banner start*/
  		#banner{position:relative;}
  		#banner .banner-inner,.banner-cricle,.banner-ear{float:left;width:100%;} 
  		#banner .banner-inner .item{background-repeat: no-repeat;background-size: cover;
			width:100%;height:600px;position:absolute;z-index:-1;}
		#banner .banner-inner .item .description{position:absolute;top:200px;left:200px;display:none;}	
  		#banner .banner-inner .item .slide—img{position:absolute;float:left;right:200px;top:200px;display:none;animation-delay:1s;}
  		#banner .banner-cricle{margin:550px 700px;z-index:2;}
  		#banner .banner-cricle ul li{background:#fff;float:left;border:1px solid black;margin-left:50px;width:23px;height:23px;border-radius:50%;text-align:center;}
  		#banner .banner-cricle ul li:hover{cursor:pointer;background:red;}
  		#banner .banner-cricle ul li.active{background:red}
  		#banner .banner-ear{position:absolute;margin-top:300px;} 
  		#banner .banner-ear a{display:block;width:40px;height:40px;background:red;line-height:40px;text-align:center;margin:0px 20px;border-radius:5px;}
  		#banner .banner-ear a:first-child{float:left;}
  	    #banner .banner-ear a:last-child{float:right;}
  		/*banner end*/
  		
  		
  		
  	</style>
  
  	<script type="text/javascript">
  		$(function(){
  			//页面初始化，第一张banner图，文字和slide图片显示
  			$(".banner-inner").find(".item").eq(0).find(".description").addClass('animated slideInLeft').css({"display":"block"});
			$(".banner-inner").find(".item").eq(0).find(".slide—img").addClass('animated fadeInUp').css({"display":"block"});
  			//圆圈切换banner
			$(".banner-cricle").find("li").bind("click",function(){
  				//获取li索引
  				var index = $(this).index();
  				//遍历banner对象
  				$(".banner-inner").find(".item").each(function(i,item){
  						if(index == i){//如果li索引和banner索引相同，则显示双方
  							//联动显示banner图
  							$(this).show().siblings().css({"display":"none"});
  							//显示描述
  							$(this).find(".description").addClass('animated slideInLeft').css({"display":"block"});
  							//显示slide图片
  							$(this).find(".slide—img").addClass('animated fadeInUp').css({"display":"block"});
  							//切换li激活状态
  							$(".banner-cricle").find("li").eq(i).addClass("active").siblings("li").removeClass("active");
  						}
  				});
  			});
  			
  			/* //next按钮切换banner
  			var next= 0;
			$(".banner-ear").find("a:last-child").bind("click",function(){
				//获取当前激活li的索引
				next =  $(".banner-cricle").find("li.active").index();
				var length = $(".banner-cricle").find("li").length;
				next++;
				if(next == length){
					next = 0;
				}
				//切换li激活状态
				$(".banner-cricle").find("li").eq(next).addClass("active").siblings("li").removeClass("active");
				//联动显示banner图
				$(".banner-inner").find(".item").eq(next).show().siblings().css({"display":"none"});
				//显示描述
				$(".banner-inner").find(".item").eq(next).find(".description").addClass('animated slideInLeft').css({"display":"block"});
				//显示slide图片
				$(".banner-inner").find(".item").eq(next).find(".slide—img").addClass('animated fadeInUp').css({"display":"block"});
			});
			
			//pre按钮切换banner
			var pre = 0;
			$(".banner-ear").find("a:first-child").bind("click",function(){
				//获取当前激活li的索引
				pre =  $(".banner-cricle").find("li.active").index();
				var length = $(".banner-cricle").find("li").length;
				pre--;
				if(pre == -1){
					pre = length-1;
				}
				//切换li激活状态
				$(".banner-cricle").find("li").eq(pre).addClass("active").siblings("li").removeClass("active");
				//联动显示banner图
				$(".banner-inner").find(".item").eq(pre).show().siblings().css({"display":"none"});
				//显示描述
				$(".banner-inner").find(".item").eq(pre).find(".description").addClass('animated slideInLeft').css({"display":"block"});
				//显示slide图片
				$(".banner-inner").find(".item").eq(pre).find(".slide—img").addClass('animated fadeInUp').css({"display":"block"});
			}); */
  		});
  		
  		//按钮banner图切换
  		var nextStr = "next";
  		var preStr = "pre";
		function btnChange(obj){
			var item = $(obj).data("item");
			//获取当前激活的li索引
			var index  = $(".banner-cricle").find("li.active").index();
			//获取li的总长度
			var length = $(".banner-cricle").find("li").length;
			if(item == nextStr){//点击next按钮
				index++;
				if(index == length){
					index = 0;
				}
				//切换li激活状态 和 联动显示banner图
				changeBanner(index);
			}else if(item == preStr){//点击pre按钮
				index--;
				if(index == -1){
					index = length-1;
				}
				//切换li激活状态 和 联动显示banner图
				changeBanner(index);
			}else{
				alert("出错啦。。。。。");
			}
		}
		//切换li激活状态 和 联动显示banner图
		function changeBanner(index){
			//切换li激活状态
			$(".banner-cricle").find("li").eq(index).addClass("active").siblings("li").removeClass("active");
			//联动显示banner图
			$(".banner-inner").find(".item").eq(index).show().siblings().css({"display":"none"});
			//显示描述
			$(".banner-inner").find(".item").eq(index).find(".description").addClass('animated slideInLeft').css({"display":"block"});
			//显示slide图片
			$(".banner-inner").find(".item").eq(index).find(".slide—img").addClass('animated fadeInUp').css({"display":"block"});
		}
		
  	</script>
  </head>
  
  <body>
     <!-- header navbar start  -->
  	 <header>
  	 	<nav class="navbar">
  	 		<div class="navbar_item navbar_left">
  	 			<a href="javascript:void(0)">
  	 				<img alt="logo" src="images/logo.png">
  	 			</a>
  	 		</div>
  	 		<div class="navbar_item navbar_right">
  	 			<ul>
  	 				<li><a href="javascript:void(0)" class="active">首页</a></li>
  	 				<li><a href="javascript:void(0)">相册</a></li>
  	 				<li><a href="javascript:void(0)">博客</a></li>
  	 				<li><a href="javascript:void(0)">日志</a>
  	 					<ul>
  	 						<li><a href="javascript:void(0)">首页</a></li>
		  	 				<li><a href="javascript:void(0)">相册</a></li>
		  	 				<li><a href="javascript:void(0)">博客</a></li>
  	 					</ul>
  	 				</li>
  	 				<li><a href="javascript:void(0)">旅行</a>
  	 					<ul>
  	 						<li><a href="javascript:void(0)">首页</a></li>
		  	 				<li><a href="javascript:void(0)">相册</a></li>
		  	 				<li><a href="javascript:void(0)">博客</a></li>
  	 					</ul>
  	 				</li>
  	 			</ul>
  	 		</div>
  	 	</nav>
  	 </header>
  	 <!-- header navbar end  -->
  	 
  	 <!-- section banner start -->
  	 <section id="banner">
  	 	 <!-- banner-inner start -->
  	 	 <div class="banner-inner">
  	 	 	 <div class="item" style="background-image:url(images/banner/bg1.jpg);display:block;">
 	 	 		 <div class="container">
 	 	 			  <div class="description">
 	 	 			  	 <h1>我的校园</h1> 
 	 	 			  	 <span>成立于多少年前，校风校史优良1</span>
 	 	 			  </div>
 	 	 			  <div class="slide—img">
 	 	 			  	 <img alt="me" src="images/banner/img1.png" height="400px" width="300px;"/>
 	 	 			  </div>
 	 	 	     </div>
 	 	 	 </div>
 	 	 	 <div class="item" style="background-image:url(images/banner/bg2.jpg);display:none;" >
 	 	 		<div class="container">
 	 	 			 <div class="description">
 	 	 			  	 <h1>我的校园</h1> 
 	 	 			  	 <span>成立于多少年前，校风校史优良2</span>
 	 	 			  </div>
 	 	 			  <div class="slide—img">
 	 	 			  	 <img alt="me" src="images/banner/img2.png" height="400px" width="300px"/>
 	 	 			  </div>
 	 	 	     </div>
 	 	 	 </div>
 	 	 	 <div class="item" style="background-image:url(images/banner/bg3.jpg);display:none;">
 	 	 		 <div class="container">
 	 	 			  <div class="description">
 	 	 			  	 <h1>我的校园</h1> 
 	 	 			  	 <span>成立于多少年前，校风校史优良3</span>
 	 	 			  </div>
 	 	 			  <div class="slide—img">
 	 	 			  	 <img alt="me" src="images/banner/img3.png" height="400px" width="300px"/>
 	 	 			  </div>
 	 	 	     </div>
 	 	 	 </div>
 	 	 	  <div class="item" style="background-image:url(images/banner/bg2.jpg);display:none;">
 	 	 		 <div class="container">
 	 	 			   <div class="description">
 	 	 			  	 <h1>我的校园</h1> 
 	 	 			  	 <span>成立于多少年前，校风校史优良4</span>
 	 	 			  </div>
 	 	 			  <div class="slide—img">
 	 	 			  	 <img alt="me" src="images/banner/img2.png" height="400px" width="300px"/>
 	 	 			  </div>
 	 	 	     </div>
 	 	 	 </div>
  	 	 </div>
  	 	  <!-- banner-inner end -->
  	 	  <!-- banner-cricle start -->
  	 	 <div class="banner-cricle">
  	 	 	 <ul>
	  	 	 	 <li class="active"></li>
	  	 	 	 <li></li>
	  	 	 	 <li></li>
	  	 	 	 <li></li>
  	 		 </ul>
  	 	 </div>
  	 	  <!-- banner-cricle end -->
  	 	  <!-- banenr-ear start -->
  	 	 <div class="banner-ear"> 
  	 	 	<a href="#" class="" onclick="btnChange(this);" data-item="pre"><i class="fa fa-chevron-left"></i></a>
  	 	 	<a href="#" class="" onclick="btnChange(this);" data-item="next"><i class="fa fa-chevron-right"></i></a>
  	 	 </div>
  	 	 <!-- banenr-ear end -->
  	 </section>
  	 <!-- section banner end -->
  	 
  </body>
</html>
