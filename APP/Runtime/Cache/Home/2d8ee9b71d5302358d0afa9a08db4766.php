<?php if (!defined('THINK_PATH')) exit();?><!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width,initial-scale=1,minimum-scale=1,maximum-scale=1,user-scalable=no" />
    <title></title>

    <link href="../.././Public/home/wap/css/mui.min.css" rel="stylesheet"/>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/vant@1.6/lib/index.css">

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
		.header{
			background:#1f253d;
			top:0;
			box-shadow:0 0px 0px #ccc;
			-webkit-box-shadow:0 0px 0px #ccc;
		}
		.h1{
			font-family:'微软雅黑';
			color:#fff;
		}
		.img{
			position:absolute;
			margin-top:9px;
			width:24px;
			right:8px;
		}
		.ul{
			margin-top:20px;
			background:#1a1d2e;
			line-height:2em;
		}
		.p{
			margin-left:10%;
			font-family:'微软雅黑';
			color:aquamarine;
		}
		.p1{
			position:absolute;
			left:35%;
			bottom:12px;
			font-family:'微软雅黑';
			font-size:1em;
			color:#fff;
		}
		.button{
			position:absolute;
			background:linear-gradient(45deg,BLUE,purple);
			color:#fff;
			top:12px;
			font-size:0.7em;
			right:20px;
			line-height:1.5em;
			width:80px;
			border-radius:8px;
			border:0px solid;
		}
	</style>
</head>
<body style="background: #1a1d2e;">
	<header class="mui-bar mui-bar-nav header">
			<a class="mui-action-back mui-icon mui-icon-left-nav mui-pull-left"  href="javascript:history.go(-1)"></a>
			<a href="javascript:void(0)" id="addcard" ><img src="../Public/home/wap/images/add.png" class="img"/></a>
			<h1 class="mui-title h1">银行卡</h1>
		</header>
		<br><br>
		<?php if(empty($clist)): ?><ul class="mui-table-view ul">
			<li class="mui-table-view-cell mui-collapse-content">暂时没有添加银行卡</li>
		</ul>
		<?php else: ?>
		<?php if(is_array($clist)): foreach($clist as $key=>$v): ?><ul class="mui-table-view ul">
			<li class="mui-table-view-cell mui-collapse-content"><p class="p">所属银行</p><p  class="p1"><?php echo ($v["bankname"]); ?></p> </li>
			<li class="mui-table-view-cell mui-collapse-content"><p class="p">持卡人</p><p class="p1"><?php echo ($v["name"]); ?></p> </li>
			<li class="mui-table-view-cell mui-collapse-content"><p class="p">银行卡号</p><p class="p1"><?php echo ($v["banknum"]); ?></p> </li>
			<button type="button" class="button"   onclick="delcard(<?php echo ($v["id"]); ?>)" >删除</button>
		</ul><?php endforeach; endif; endif; ?>
</body>
<script type="text/javascript" src="../.././Public/home/common/js/jquery-1.9.1.min.js" ></script>
<script type="text/javascript" src="../.././Public/home/common/layer/layer.js" ></script>
<script type="text/javascript">
	$("#addcard").click(function(){
		window.location.href="<?php echo U('User/tjyhk');?>"
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
							window.location.href = "<?php echo U('User/yinhangka');?>";
						}, 3000); 
					}else{
						layer.msg(data.msg);  //,data.url);
						setTimeout(function (args) {
							window.location.href = "<?php echo U('User/yinhangka');?>";
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