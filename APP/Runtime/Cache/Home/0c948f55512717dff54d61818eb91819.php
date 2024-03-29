<?php if (!defined('THINK_PATH')) exit();?><!DOCTYPE html>
<html>

	<head>
		<meta charset="utf-8">
		<title>抢单</title>
		<meta name="viewport" content="width=device-width, initial-scale=1,maximum-scale=1,user-scalable=no">
		<meta name="apple-mobile-web-app-capable" content="yes">
		<meta name="apple-mobile-web-app-status-bar-style" content="black">
		<link href="../.././Public/home/wap/css/mui.min.css" rel="stylesheet">
		<script type="text/javascript" src="../.././Public/home/common/js/jquery-1.9.1.min.js"></script>
		<script type="text/javascript" src="../.././Public/home/common/layer/layer.js"></script>
		<script type="text/javascript" src="../.././Public/home/common/js/index.js" ></script>
		<style>
			html,
			body {
				background-color: #1a1d2e;
			}
			.mui-bar~.mui-content .mui-fullscreen {
				top: 44px;
				height: auto;
			}
			.mui-pull-top-tips {
				position: absolute;
				top: -20px;
				left: 50%;
				margin-left: -25px;
				width: 40px;
				height: 40px;
				border-radius: 100%;
			}
			.mui-bar~.mui-pull-top-tips {
				top: 24px;
			}
			.mui-pull-top-wrapper {
				width: 42px;
				height: 42px;
				display: block;
				text-align: center;
				background-color: #efeff4;
				border: 1px solid #ddd;
				border-radius: 25px;
				background-clip: padding-box;
				box-shadow: 0 4px 10px #bbb;
				overflow: hidden;
			}
			.mui-pull-top-tips.mui-transitioning {
				-webkit-transition-duration: 200ms;
				transition-duration: 200ms;
			}
			.mui-pull-top-tips .mui-pull-loading {
				/*-webkit-backface-visibility: hidden;
				-webkit-transition-duration: 400ms;
				transition-duration: 400ms;*/
				
				margin: 0;
			}
			.mui-pull-top-wrapper .mui-icon,
			.mui-pull-top-wrapper .mui-spinner {
				margin-top:7px;
			}
			.mui-pull-top-wrapper .mui-icon.mui-reverse {
				/*-webkit-transform: rotate(180deg) translateZ(0);*/
			}
			.mui-pull-bottom-tips {
				text-align:center;
				background-color:#efeff4;
				font-size:15px;
				line-height:40px;
				color:#777;
			}
			.mui-pull-top-canvas {
				overflow:hidden;
				background-color:#fafafa;
				border-radius:40px;
				box-shadow:0 4px 10px #bbb;
				width:40px;
				height:40px;
				margin:0 auto;
			}
			.mui-pull-top-canvas canvas {
				width:40px;
			}
			.mui-slider-indicator.mui-segmented-control {
				background-color:#1f253d;
			}
			.mui-table-view-cell:after{
				background-color:#34313d;
			}
			.tab{
				background:#1f253d;
				top:0;
				box-shadow:0 0px 0px #ccc;
				-webkit-box-shadow:0 0px 0px #ccc;
			}
			.head{
				font-family:'微软雅黑';
				color:#fff;
			}
			.headlist{
				margin-left:35px;
			}
			.ullist{
				width:90%;
				left:5%;
				margin-top:20px;
				background:#1a1d2e;
				line-height:2em; 
			}
			.dingdan{
				margin-left:7%;
				font-family:'微软雅黑';
				color:aquamarine;
			}
			.buttonchakan{
				position:absolute;
				background:linear-gradient(45deg,BLUE,purple);
				color:#fff;
				top:12px;
				font-size:0.8em;
				right:10px;
				line-height:1.1em;
				width:80px;
				border-radius:10px;
				border:0px solid;
			}
		</style>
	</head>

	<body style="background:#1a1d2e;">
		<header class="mui-bar mui-bar-nav tab" >
				<a class="mui-action-back mui-icon mui-icon-left-nav mui-pull-left" href="javascript:history.go(-1)"></a>
				<h1 class="mui-title head">收单列表</h1>
		</header>
		<div class="mui-content">
			<div id="slider" class="mui-slider mui-fullscreen">
				<div id="sliderSegmentedControl" class="mui-scroll-wrapper mui-slider-indicator mui-segmented-control mui-segmented-control-inverted">
					<div class="mui-scroll">
						<a class="mui-control-item mui-active headlist" id="itemmobilea" href="javascript:void(0);">
							待收款
						</a>
						<a class="mui-control-item headlist" id="itemmobileb"  href="javascript:void(0);">
							已收款
						</a>
						<a class="mui-control-item headlist" id="itemmobilec"  href="javascript:void(0);">
							已取消
						</a>
						
						
					</div>
				</div>
				
				<div class="mui-slider-group"  id="item1mobile" style="display:block;">
					<div  class="mui-slider-item mui-control-content">
						<div class="mui-scroll-wrapper">
							<div class="mui-scroll">
							<?php if(empty($slist)): ?><ul class="mui-table-view ullist">
									<li class="mui-table-view-cell mui-collapse-content"><p style="text-align: center;">暂时没有记录</p> </li>
								</ul>
							<?php else: ?>
							<?php if(is_array($slist)): foreach($slist as $key=>$info): ?><ul class="mui-table-view ullist">
									<li class="mui-table-view-cell mui-collapse-content"><p class="dingdan">订单号</p><p style="position: absolute; left: 35%; bottom: 12px; font-family: '微软雅黑';font-size: 1em; color: #fff;"><?php echo ($info["ordernum"]); ?></p> </li>
									<a href="<?php echo U('Index/qiangdanxq',array('id'=>$info['id']));?>" type="button"class="buttonchakan" style="display: inline-block;width: 22%;height: 26px;line-height: 26px;text-align: center;">查看详情</a>
								</ul><?php endforeach; endif; endif; ?>
							</div>
						</div>
					</div>
					
				</div>
				
				<div class="mui-slider-group"  id="item2mobile"  style="display:none;">

					<div  class="mui-slider-item mui-control-content">
						<div class="mui-scroll-wrapper">
							<div class="mui-scroll">
								<?php if(empty($flist)): ?><ul class="mui-table-view ullist">
									<li class="mui-table-view-cell mui-collapse-content"><p style="text-align: center;">暂时没有记录</p> </li>
								</ul>
								<?php else: ?>
								<?php if(is_array($flist)): foreach($flist as $key=>$info): ?><ul class="mui-table-view ullist">
										<li class="mui-table-view-cell mui-collapse-content"><p class="dingdan">订单号</p><p style="position: absolute; left: 35%; bottom: 12px; font-family: '微软雅黑';font-size: 1em; color: #fff;"><?php echo ($info["ordernum"]); ?></p> </li>
										<a href="<?php echo U('Index/qiangdanxq',array('id'=>$info['id']));?>" type="button"class="buttonchakan" style="display: inline-block;width: 22%;height: 26px;line-height: 26px;text-align: center;">查看详情</a>
									</ul><?php endforeach; endif; endif; ?>
							</div>
						</div>
					</div>
					
				</div>
				
				
				<div class="mui-slider-group"  id="item3mobile"  style="display:none;">

					<div  class="mui-slider-item mui-control-content">
						<div class="mui-scroll-wrapper">
							<div class="mui-scroll">
								<?php if(empty($dlist)): ?><ul class="mui-table-view ullist">
									<li class="mui-table-view-cell mui-collapse-content"><p style="text-align: center;">暂时没有记录</p> </li>
								</ul>
								<?php else: ?>
								<?php if(is_array($dlist)): foreach($dlist as $key=>$info): ?><ul class="mui-table-view ullist">
										<li class="mui-table-view-cell mui-collapse-content"><p class="dingdan">订单号</p><p style="position: absolute; left: 35%; bottom: 12px; font-family: '微软雅黑';font-size: 1em; color: #fff;"><?php echo ($info["ordernum"]); ?></p> </li>
										<a href="<?php echo U('Index/qiangdanxq',array('id'=>$info['id']));?>" type="button"class="buttonchakan" style="display: inline-block;width: 22%;height: 26px;line-height: 26px;text-align: center;">查看详情</a>
									</ul><?php endforeach; endif; endif; ?>
							</div>
						</div>
					</div>
					
				</div>
				
				
				
				
				
				
				
				
				
			</div>
		</div>

	</body>
	<script type="text/javascript">
		$("#itemmobilea").click(function(){
			$("#item1mobile").show();
			$("#item2mobile").hide();
			$("#item3mobile").hide();
			$("#itemmobilea").addClass('mui-active');
			$("#itemmobileb").removeClass('mui-active');
			$("#itemmobilec").removeClass('mui-active');
			
		});
		$("#itemmobileb").click(function(){
			$("#item1mobile").hide();
			$("#item2mobile").show();
			$("#item3mobile").hide();
			$("#itemmobileb").addClass('mui-active');
			$("#itemmobilea").removeClass('mui-active');
			$("#itemmobilec").removeClass('mui-active');
			
		});
		$("#itemmobilec").click(function(){
			$("#item1mobile").hide();
			$("#item2mobile").hide();
			$("#item3mobile").show();
			$("#itemmobilec").addClass('mui-active');
			$("#itemmobileb").removeClass('mui-active');
			$("#itemmobilea").removeClass('mui-active');
			
		});
	
	</script>

</html>