<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>${systemConfig['lovej.site.name']}-${bundle("site.login")}</title>
</head>
<link rel="stylesheet" type="text/css" href="${rc.contextPath}/styles/admin/css/login.css" />
<link rel="shortcut icon" type="image/x-icon" href="${rc.contextPath}/styles/admin/images/favicon.ico" />
<#-- form验证 -->
<link rel="stylesheet" href="${rc.contextPath}/styles/formValidator.2.2.1/css/validationEngine.jquery.css" type="text/css"/>
<script src="${rc.contextPath}/styles/formValidator.2.2.1/js/jquery-1.6.min.js" type="text/javascript"></script>
<script src="${rc.contextPath}/styles/formValidator.2.2.1/js/languages/jquery.validationEngine-${(rc.locale)!'zh_CN'}.js" type="text/javascript" charset="utf-8"></script>
<script src="${rc.contextPath}/styles/formValidator.2.2.1/js/jquery.validationEngine.js" type="text/javascript" charset="utf-8"></script>
<script>
    jQuery(document).ready(function(){
        jQuery("#formID").validationEngine();
        
        $("#forget").click(function(){
        	var username = $("#username").val();
        	if (username != '') {
        		location.href='${rc.contextPath }/admin/forget/forgetPwd?username='+username;	
        	}
        });
    });
    
    jQuery(document).ready(function(){
    	$("#captcha").click(function(){
    		$(this).attr("src", "${rc.contextPath}/ImageCaptcha?time=" + new Date());
    		return false;
    	});
    }); 
</script>
<body>
<form action="${rc.contextPath }/admin/login/login" method="post" id="formID" name="user">
<div id='content'>
    <div class="tl"></div> 
	<div class="t"></div>
    <div class="tr"></div>
    <div class="c">
    	<div class="in">
    		<div class="toplogo">
        		<img src="${rc.contextPath}/styles/admin/images/logo.png"/>
            </div>
	        <div class="topdiv1" style="width:298px;height:20px;padding:0px 20px 0px 20px!important">
            	<span class="label">
            		<font style="color:red;font-weight:bold;font-style:italic;">
            		<#if msg?? && msg=="NotFoundUserException"><font color="red">${bundle("exception.NotFoundUserException")}</font>
            		<#elseif msg?? && msg=="UserIsFrozenException"><font color="red">${bundle("exception.UserIsFrozenException")}</font>
            		<#elseif msg?? && msg=="NotMatchUserPasswordException"><font color="red">${bundle("exception.NotMatchUserPasswordException")}</font>
            		<#else>
            			${msg}
            		</#if>
            		</font>
            	</span>
            </div>            
	        <div class="topdiv2">
            	<span class="label">${bundle("login.username")}:</span>
            	<input type="text" name="username" class="validate[required] input" id="username" value="${(user.username)!""}"/>
            </div>
            <div class="topdiv1">
            	<span class="label">${bundle("login.password")}:</span>
            	<input type="password" name="password" class="validate[required] input" id="password"/>
            </div>
            <div class="topdiv2">
            	<span class="label">${bundle("login.captcha")}:</span>
            	<input type="text" name="verifyCode" class="validate[required,minSize[5],maxSize[5]] input" id="verifyCode" style="width:100px;float:left;"/>
            	<div style="float:left;">
				<img id="captcha" width="120" height="40" src="${rc.contextPath}/ImageCaptcha" alt="点击刷新验证码">
				<span class="msg-box" data-for="verifyCode" style="margin-top:10px;"></span>
			</div>
            </div>                         
        </div>
        <div class="btn">
			<div class="remember">
        		<input type="checkbox" name="rememberMe"/>${bundle("login.remember")}
        		&nbsp;&nbsp;&nbsp;&nbsp;
        		<a id="forget" href='javascript:;'>忘记密码？</a>
			</div>
			<div class="logindiv">
            <input type="submit" class="login" value=""/>
			</div>
        </div>
    </div>
    <div class="bl"></div> 
	<div class="b"></div>
    <div class="br"></div>      
</div>
</form>
</body>
</html>