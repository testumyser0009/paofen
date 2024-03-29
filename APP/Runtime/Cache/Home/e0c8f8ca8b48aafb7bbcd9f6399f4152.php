<?php if (!defined('THINK_PATH')) exit();?><!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width,initial-scale=1,minimum-scale=1,maximum-scale=1,user-scalable=no" />
    <title></title>

    <link href="../.././Public/home/wap/css/mui.min.css" rel="stylesheet"/>

	<style>
		.body{
			line-height: px;
		}
		.mui-table-view-cell:after{
			left: 0px;
			background-color:#292828;
		}
		.mui-table-view:before{
			background-color:#292828;
		}
		.mui-table-view:after{
			background-color:#292828;
		}
		.mui-input-group:before{
			height:0px
		}
		.mui-input-group:after{
			height: 0px;
		}
		.header{
			background:#1f253d;
			top:0;
			box-shadow:0 0px 0px #ccc;
			-webkit-box-shadow:0 0px 0px #ccc;
		}
		.czjilu{
			font-family:'微软雅黑';
			color: #fff;
		}
		.ul{
			margin-top:12%;
			background:#1f253d;
		}
		.zfbcz{
			color:#fff;
			margin-left:10px;
			font-family:'微软雅黑';
		}
		.money{
			margin-left:60%;
			top:81px;
			font-size:1.4em;
			color:#2AC845;
		}
		.time{
			position:absolute;
			color:#ccc;
			padding:6px;
			right:60%;
		}
	</style>
</head>
<body style="background:#1a1d2e;">
	<header class="mui-bar mui-bar-nav header">
			<div style="width:10%;float:left;">
				<a class="mui-action-back mui-icon mui-icon-left-nav mui-pull-left" href="javascript:history.go(-1)"></a>
			</div>
			<div style="width:80%;float:left;"><h1 class="mui-title czjilu">充值记录</h1></div>
			<div style="width:10%;float:right;text-align:center;" id="gorecharge">
				<img src="../Public/home/wap/images/file1.png" style=" height:36px; margin: 10%;">
			</div>	
	</header>	
	
		<ul class="mui-table-view ul">
			<?php if(empty($relist)): ?><li class="mui-table-view-cell" style="text-align: center;"><span style="color:#007aff;font-size:14px;">您暂时没有充值成功的记录</span></li>
			<?php else: ?>
			<?php if(is_array($relist)): foreach($relist as $key=>$info): ?><li class="mui-table-view-cell">
			 	<span class="zfbcz"><?php if($info['way'] == 1){echo '支付宝充值';}elseif($info['way'] == 2){echo '微信充值';}elseif($info['way'] == 3){echo '银行卡充值';}?></span>
			 	<span class="money">+<?php echo $info['price'];?><font style=" font-size: 11px;"></font></span>
			 	<span class="time"><?php echo date("Y-m-d H:i",$info['addtime']);?></span>
			 </li><?php endforeach; endif; endif; ?>
		</ul>
		
</body>
<script type="text/javascript" src="../.././Public/home/common/js/jquery-1.9.1.min.js" ></script>
<script type="text/javascript" src="../.././Public/home/common/layer/layer.js" ></script>
<script type="text/javascript">
	$("#gorecharge").click(function(){
		window.location.href="<?php echo U('Recharge/chongzhi');?>"
	});

</script>
<script type="text/javascript">
	function delcard(id){
		var cid = id;
		if(confirm("确定要删除吗？")){
			$.post("<?php echo U('User/del_bankcard');?>",
				{'cid' : cid},
				function(data){
					if(data.code==1){
						layer.msg(data.msg);  //,data.url);
						setTimeout(function (args) {
							window.location.href = "<?php echo U('User/bankcardlist');?>";
						}, 3000); 
					}else{
						layer.msg(data.msg);  //,data.url);
						setTimeout(function (args) {
							window.location.href = "<?php echo U('User/bankcardlist');?>";
						}, 3000); 
					}
				}
			);
		}else{
			return false;
		}
		
	}

</script>
</html>