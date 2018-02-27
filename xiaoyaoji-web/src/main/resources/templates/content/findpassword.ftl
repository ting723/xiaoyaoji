<!--[if lt IE 9]> <script>location.href='unsupport.html?refer='+encodeURIComponent(location.href)</script> <![endif]-->
<!DOCTYPE html>
<html lang="zh-CN">
<head>
    <title>找回密码 - 小幺鸡</title>
    <#include "../includes/meta.ftl"/>
    <link rel="stylesheet" href="/css/index.css?v=${v}">
</head>
<body>
<div id="app">
    <div class="login-form mc" v-cloak v-if="!!id">
        <form class="form" v-on:submit.prevent>
            <div class="ta-c logo"><a href="${ctx}/"><img src="/img/logo/full.png"></a></div>
            <div class="item">{{email}}</div>
            <div class="item">
                <input type="password" name="password" class="text" tabindex="2" v-model="password"
                       v-validate="'required'" initial="off" placeholder="请输入新密码"/>
                <p class="tip">{{errors.first('password')}}</p>
            </div>
            <div class="item">
                <input type="password" name="repassword" tabindex="3" v-model="rePassword" v-validate="'required'"
                       initial="off" maxlength="20" class="text" autocomplete="off" placeholder="请确认密码"/>
                <p class="tip">请输入确认密码</p>
            </div>
            <div class="item">
                <input type="submit" id="register-btn" tabindex="4" v-on:click="submit" class="btn" value="修改新密码"/>
            </div>
        </form>
        <div class="long-line"></div>
        <br/>
        <div>
            <a href="login">返回登陆</a>
        </div>
    </div>
</div>
<#include "../includes/js.ftl"/>
<script src="/js/findpassword.js"></script>

</body>
</html>