<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2018/5/16
  Time: 14:46
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
    <script id="allmobilize" charset="utf-8" src="style/js/allmobilize.min.js"></script>
    <meta http-equiv="Cache-Control" content="no-siteapp" />
    <link rel="alternate" media="handheld"  />
    <!-- end 云适配 -->
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
    <title>登录-拉勾-最专业的招聘平台</title>
    <meta property="qc:admins" content="23635710066417756375" />
    <meta content="拉勾网是3W旗下的互联网领域垂直招聘网站,互联网职业机会尽在拉勾网" name="description">
    <meta content="拉勾,拉勾网,拉勾招聘,拉钩, 拉钩网 ,互联网招聘,拉勾互联网招聘, 移动互联网招聘, 垂直互联网招聘, 微信招聘, 微博招聘, 拉勾官网, 拉勾百科,跳槽, 高薪职位, 互联网圈子, IT招聘, 职场招聘, 猎头招聘,O2O招聘, LBS招聘, 社交招聘, 校园招聘, 校招,社会招聘,社招" name="keywords">

    <meta name="baidu-site-verification" content="QIQ6KC1oZ6" />

    <!-- <div class="web_root"  style="display:none">h</div> -->

    <link rel="Shortcut Icon" href="h/images/favicon.ico">
    <link rel="stylesheet" type="text/css" href="style/css/style.css"/>

    <script src="style/js/jquery.1.10.1.min.js" type="text/javascript"></script>

    <script type="text/javascript" src="style/js/jquery.lib.min.js"></script>
    <script type="text/javascript" src="style/js/core.min.js"></script>

    <%--验证码  start --%>
    <%--<style type="text/css">--%>
        <%--#code--%>
        <%--{--%>
            <%--font-family:Arial;--%>
            <%--font-style:italic;--%>
            <%--font-weight:bold;--%>
            <%--border:0;--%>
            <%--letter-spacing:2px;--%>
            <%--color:blue;--%>
        <%--}--%>
    <%--</style>--%>
    <%--<script type = "text/javascript" src = "js/checkCode.js">--%>
    <%--</script>--%>
    <%--验证码  end--%>
    <script type="text/javascript">
        var youdao_conv_id = 271546;
    </script>
    <script type="text/javascript" src="style/js/conv.js"></script>
</head>

<body id="login_bg">
<div class="login_wrapper">
    <div class="login_header">
        <a href="h/"><img src="style/images/logo_white.png" width="285" height="62" alt="拉勾招聘" /></a>
        <div id="cloud_s"><img src="style/images/cloud_s.png" width="81" height="52" alt="cloud" /></div>
        <div id="cloud_m"><img src="style/images/cloud_m.png" width="136" height="95"  alt="cloud" /></div>
    </div>

    <input type="hidden" id="resubmitToken" value="" />
    <div class="login_box">
        <form id="loginForm">
            <input type="text" id="loginName" name="loginName" placeholder="请输入用户名" style="width: 300px"/>
            <input type="password" id="loginPwd" name="loginPwd" placeholder="请输入密码" style="width: 300px"/>
            <img id="checkImg" src="${pageContext.request.contextPath}/loginController/checkImg.do" onclick="change()" title="点击更换验证码">
            <input type="text"  id="checkCode" name="checkCode" placeholder="请输入验证码"  style="width: 150px"/>
            <span class="error" style="display:none;" id="beError"></span>
            <%--<label class="fl" for="remember"><input type="checkbox" id="remember" value="" checked="checked" name="autoLogin" /> 记住我</label>--%>
            <a href="#" class="fr" target="_blank">忘记密码？</a>

            <!--<input type="submit" id="submitLogin" value="登 &nbsp; &nbsp; 录" />-->
            <a style="color:#fff;" onclick="validates()" class="submitLogin" title="登 &nbsp; &nbsp; 录"/>登 &nbsp; &nbsp; 录</a>

            <input type="hidden" id="callback" name="callback" value=""/>
            <input type="hidden" id="authType" name="authType" value=""/>
            <input type="hidden" id="signature" name="signature" value=""/>
            <input type="hidden" id="timestamp" name="timestamp" value=""/>
        </form>
        <div class="login_right">
            <div>还没有拉勾帐号？</div>
            <a  href="LaGouReg.jsp"  class="registor_now">立即注册</a>
            <div class="login_others">使用以下帐号直接登录:</div>
            <a  href="https://weibo.com/"  target="_blank" class="icon_wb" title="使用新浪微博帐号登录"></a>
            <a  href="h/ologin/auth/qq.html"  class="icon_qq" target="_blank" title="使用腾讯QQ帐号登录"></a>
        </div>
    </div>
    <div class="login_box_btm"></div>
</div>

<script type="text/javascript">

    //切换验证码
    function change(){
        var img1=document.getElementById("checkImg");
        img1.src="${pageContext.request.contextPath}/loginController/checkImg.do?"+new Date(); //加时间戳防止缓存
    }

            function validates() {
                //验证表单
                var loginName = $("#loginName").val();
                var loginPwd = $("#loginPwd").val();
                var checkCode = $("#checkCode").val();

                if(loginName != null | loginPwd != null | checkCode != null){
                    $.ajax({
                        type:'POST',
                        data:$("#loginForm").serialize(),
                        url:"<%=request.getContextPath()%>/loginController/laGouLogin.do",
                        Success:function (result) {
                            if(result!=0){
                                if(result==2){
                                    window.location.href="<%=request.getContextPath()%>/index.jsp";
                                }else if(result ==1){
                                    $('#beError').text("请输入正确的帐号或密码").show();
                                }
                            }else{
                                $('#beError').text("请填写帐号和密码").show();
                            }
                        },
                        error:function () {
                        }
                    })
                }else{
                    $('#beError').text("请填写完整").show();
                }
            }

    <%--$(function(){--%>
        <%--//验证表单--%>
        <%--$("#loginForm").validate({--%>
            <%--/* onkeyup: false,--%>
             <%--focusCleanup:true, */--%>
            <%--rules: {--%>
                <%--email: {--%>
                    <%--required: true,--%>
                    <%--email: true--%>
                <%--},--%>
                <%--password: {--%>
                    <%--required: true--%>
                <%--}--%>
            <%--},--%>
            <%--messages: {--%>
                <%--email: {--%>
                    <%--required: "请输入用户名",--%>
<%--//                    email: "请输入有效的邮箱地址，如：vivi@lagou.com"--%>
                <%--},--%>
                <%--password: {--%>
                    <%--required: "请输入密码"--%>
                <%--}--%>
            <%--},--%>
            <%--submitHandler:function(form){--%>
                <%--if($('#remember').prop("checked")){--%>
                    <%--$('#remember').val(1);--%>
                <%--}else{--%>
                    <%--$('#remember').val(null);--%>
                <%--}--%>
                <%--var email = $('#email').val();--%>
                <%--var password = $('#password').val();--%>
                <%--var remember = $('#remember').val();--%>

                <%--var callback = $('#callback').val();--%>
                <%--var authType = $('#authType').val();--%>
                <%--var signature = $('#signature').val();--%>
                <%--var timestamp = $('#timestamp').val();--%>

                <%--$(form).find(":submit").attr("disabled", true);--%>

                <%--$.ajax({--%>
                    <%--type:'POST',--%>
                    <%--data:$("#loginForm").serialize(),--%>
                    <%--url:"<%=request.getContextPath()%>/loginController/laGouLogin.do",--%>
                <%--}).done(function(result) {--%>
                    <%--if(result!=0){--%>
                        <%--if(result==2){--%>
                            <%--window.location.href="<%=request.getContextPath()%>/index.jsp";--%>
                        <%--}else if(result ==1){--%>
                            <%--$('#beError').text("请输入正确的帐号或密码").show();--%>
                        <%--}--%>
                    <%--}else{--%>
                        <%--$('#beError').text("请填写帐号和密码").show();--%>
                    <%--}--%>
                    <%--$(form).find(":submit").attr("disabled", false);--%>
                <%--});--%>
            <%--}--%>
        <%--});--%>
    <%--})--%>
</script>

</body>
</html>
