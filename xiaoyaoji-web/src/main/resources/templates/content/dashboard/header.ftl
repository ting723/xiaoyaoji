<div class="home-header">
    <div class="mc cb ta-c">
        <a href="${ctx}/" class="fl"><img src="/img/logo/full.png" alt="logo"></a>
        <span class="header-titles">
                <a href="${ctx}/dashboard" class="${(pageName??&&pageName=='default')?string('active','')}">我的</a>
                <a href="${ctx}/dashboard/recycle" class="${(pageName??&&pageName=='recycle')?string('active','')}">回收站</a>
                <a href="${ctx}/dashboard/archive" class="${(pageName??&&pageName=='archive')?string('active','')}">归档项目</a>
                <a href="${ctx}/help">常见问题</a>
            </span>
        <div class="gitHubUser-account fr">
            <a href=""><img src="${Session.gitHubUser.avatar}" class="gitHubUser-account-logo" alt=""><span>${Session.gitHubUser.nickname}</span></a>
        </div>
        <div v-cloak uk-dropdown="pos: top-right" style="text-align: left">
            <ul class="uk-nav uk-dropdown-nav">
                <li class="uk-active"><a href="${ctx}/dashboard">控制台</a></li>
                <li class="uk-nav-divider"></li>
                <li><a href="${ctx}/profile">个人中心</a></li>
                <li><a href="${ctx}/profile/security">安全设置</a></li>
                <li><a href="${ctx}/help">帮助中心</a></li>
                <li><a href="http://www.xiaoyaoji.cn/donate" target="_blank">请作者喝咖啡</a></li>
                <li class="uk-nav-divider"></li>
                <li><a href="${ctx}/logout">退出登录</a></li>
            </ul>
        </div>
    </div>
</div>
<div class="line"></div>