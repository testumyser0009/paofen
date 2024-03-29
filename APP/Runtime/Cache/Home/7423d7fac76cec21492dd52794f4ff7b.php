<?php if (!defined('THINK_PATH')) exit();?><!DOCTYPE html>
<!-- saved from url=(0029)http://103.200.29.54/reg.html -->
<html><head><meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    
    <meta name="viewport" content="width=device-width,initial-scale=1,minimum-scale=1,maximum-scale=1,user-scalable=no">
    <title></title>
    <link href="../.././Public/home/wap/css/mui.min.css" rel="stylesheet">
	<script src="../.././Public/home/wap/js/mui.min.js"></script>
	 <script type="text/javascript" src="../.././Public/home/common/js/jquery-1.9.1.min.js" ></script>
    <script type="text/javascript" charset="utf-8">
      	mui.init();
    </script>
	<style>
		.mui-input-group:before{
			height:0px
		}
		.mui-input-group:after{
			height: 0px;
		}
		
	</style>
</head>
<body style="background: #1a1d2e;" class="mui-ios mui-ios-11 mui-ios-11-0">
	<header class="mui-bar mui-bar-nav" style="background: #1f253d; top:0;box-shadow:0 0px 0px #ccc;-webkit-box-shadow:0 0px 0px #ccc;">
			<a class="mui-action-back mui-icon mui-icon-left-nav mui-pull-left"></a>
			<h1 class="mui-title" style="font-family: &#39;微软雅黑&#39;; color: #fff;">忘记密码</h1>
		</header>
	<form class="mui-input-group"  id="registerForm"  style="position: absolute;  top: 15%; height: 0px; width: 80%; left: 0px; right: 0px; margin: auto; ">

		<div class="mui-input-row" style="height: 2.5em; border-radius:30px;background-color:#fff; margin-bottom: 30px;">
			<img src="../Public/home/wap/images/shouji.png" style="position: absolute; width: 35px; margin-left: 15px; margin-top: 5px;">
			<input type="number" name="mobile" maxlength="11" style=" color: #0062CC; margin-top: 2px;margin-left: 18%; font-size: 0.9em; font-family: &#39;微软雅黑&#39;;" placeholder="请输入手机号">
		</div>
		<div class="mui-input-row" style="height: 2.5em; border-radius:30px;background-color:#fff; margin-bottom: 30px;">
			<img src="../Public/home/wap/images/yanzheng.png" style="position: absolute; width: 35px; margin-left: 15px; margin-top: 5px;">
			<input type="number" id="sms_code" name="sms_code" style=" color: #0062CC; margin-top: 2px;margin-left: 18%; font-size: 0.9em; font-family: &#39;微软雅黑&#39;;" placeholder="请输入验证码">
			<button type="input" class="mui-btn mui-btn-danger" style="position: absolute;background: #fff; font-family: &#39;微软雅黑&#39;; left: 60%; top: 5px; font-size: 0.9em; color: #242424; width: 35%; border: 0px solid;" id="code">| 获取验证码</button>
			
		</div>
		<div class="mui-input-row" style="height: 2.5em; border-radius:30px;background-color:#fff; margin-bottom: 30px;">
			<img src="../Public/home/wap/images/mima.png" style="position: absolute; width: 35px; margin-left: 15px; margin-top: 4px;">
			<input type="password"  name="login_pwd" maxlength="20"  style=" color: #0062CC; margin-top: 2px;margin-left: 18%; font-size: 0.9em; font-family: &#39;微软雅黑&#39;;" placeholder="请输入密码">
		</div>
		<div class="mui-input-row" style="height: 2.5em; border-radius:30px;background-color:#fff; margin-bottom: 30px;">
			<img src="../Public/home/wap/images/mima.png" style="position: absolute; width: 35px; margin-left: 15px; margin-top: 4px;">
			<input type="password" id="confirm_password"  name="relogin_pwd" maxlength="20" style=" color: #0062CC; margin-top: 2px;margin-left: 18%; font-size: 0.9em; font-family: &#39;微软雅黑&#39;;" placeholder="请确认密码">
		</div>

		<br>
		<div class="mui-button-row">
			<button type="button" id="submit"  onclick="SetPwd()" class="mui-btn mui-btn-danger" style="line-height: 2em; font-size: 0.9em; width: 90%; font-family: &#39;微软雅黑&#39;; border-radius: 30px; border: 0px solid; background: linear-gradient(45deg,BLUE,purple);" >修改</button>
		</div>


	</form>
<script>
	mui.init({
		swipeBack: true //启用右滑关闭功能
	});
</script>
<script type="text/javascript" src="../.././Public/home/common/js/jquery-1.9.1.min.js" ></script>
<script type="text/javascript" src="../.././Public/home/common/layer/layer.js" ></script>
<script type="text/javascript">
    $('#code').click(function(){
        var mobile=$("input[name='mobile']").val();
        if(mobile=='' || mobile==null){
            layer.msg('请输入手机号码');
        }
        $.post("<?php echo U('Login/sendCode');?>",{'mobile':mobile},function(data){
            if(data.status==1){
                layer.msg(data.message);
                RemainTime();
            }else{
                layer.msg(data.message);
            }
        });
    });

    var intime="<?php echo (session('set_time')); ?>";
    var timenow ="<?php echo time(); ?>";

    var bet=(parseInt(intime)+60)-parseInt(timenow);
    $(document).ready(function(){
        if(bet>0){
            RemainTime();
        }
    });
    var iTime = 59;
    var Account;
    if(bet>0){
        iTime=bet;
    }
    function RemainTime(){
        var iSecond,sSecond="",sTime="";
        if (iTime >= 0){
            iSecond = parseInt(iTime%60);
            iMinute = parseInt(iTime/60)
            if (iSecond >= 0){
                if(iMinute>0){
                    sSecond = iMinute + "分" + iSecond + "秒";
                }else{
                    sSecond = iSecond + "秒";
                }
            }
            sTime=sSecond;
            if(iTime==0){
                clearTimeout(Account);
                sTime='获取验证码';
                iTime = 59;
            }else{
                Account = setTimeout("RemainTime()",1000);
                iTime=iTime-1;
            }
        }else{
            sTime='没有倒计时';
        }
        $('#code').html(sTime);

    }
	function SetPwd(){
		layer.msg('没有短信接口');
	}
</script>			
</body>
</html>