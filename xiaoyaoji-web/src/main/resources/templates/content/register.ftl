<%--
  User: zhoujingjie
  Date: 17/4/4
  Time: 13:12
--%>

<!--[if lt IE 9]> <script>location.href='unsupport.html?refer='+encodeURIComponent(location.href)</script> <![endif]-->
<!DOCTYPE html>
<html lang="zh-CN">
<head>
    <title>注册 - 小幺鸡</title>
    .ftl:include page="/WEB-INF/includes/meta.ftl">
        .ftl:param name="ignore" value="true"/>
    <.ftl:include>
</head>
<body>
<div id="register">
<div class="login-form mc">
        <form class="form" v-on:submit.prevent>
            <div class="ta-c logo"><a href="${ctx}/"><img src="/img/logo/full.png"></a> </div>
            <div class="item">
                <input type="text" autofocus tabindex="1" name="nickname" v-model="nickname" maxlength="10" v-validate="'required'" initial="off" class="text"  placeholder="输入姓名方便团队识别"/>
                <p class="tip">{{ errors.first('nickname') }}</p>
            </div>
            <div class="item">
                <input type="email"  class="text" name="email" tabindex="2" v-model="email" maxlength="45" v-validate="'required|email'" placeholder="输入邮箱可以找回密码"/>
                <p class="tip">{{ errors.first('email') }}</p>
            </div>
            <div class="item">
                <input type="password" tabindex="3" name="password" v-model="password" v-validate="'required'" maxlength="20" class="text" autocomplete="off"  placeholder="密码"/>
                <p class="tip">请输入密码</p>
            </div>
            <div class="item">
                <input type="submit" id="register-btn" tabindex="4" v-on:click="submit" class="btn" value="免费注册"/>
            </div>
        </form>
    <div class="long-line"></div>
    <br/>
    <div>
        <a href="login">返回登陆</a>
    </div>
</div>
</div>
.ftl:include page="/WEB-INF/includes/js.ftl"/>
<script src="/js/register.js"></script>

</body>
</html>