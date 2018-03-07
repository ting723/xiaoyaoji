<header>
    <div class="top">
        <div class="cb mc">
            <#if Session??&&Session.gitHubUser??>
                <div class="gitHubUser-action logged fr">
                    <a class="item" href="${ctx}/dashboard?v=${v}">进入工作台</a>
                    <a class="item" href="${ctx}/logout?t=<%=System.currentTimeMillis()%>">退出</a>
                </div>
            <#else >
                <div class="gitHubUser-action fr">
                    <a class="item" href="${ctx}/login">登陆</a>
                    <a class="item" href="${ctx}/register">注册</a>
                </div>
            </#if>
        </div>
    </div>

    <div class="header mc cb">
        <a href="${ctx}/" class="logo fl"><img alt="小幺鸡" src="/img/logo/full.png"></a>
        <nav class="fl">
            <ul class="cb">
                <li><a href="${ctx}/">主页</a> </li>
                <li><a href="http://www.xiaoyaoji.cn/project/demo" target="_blank">在线演示</a> </li>
                <li><a href="http://www.xiaoyaoji.cn/donate">捐赠支持</a></li>
                <li><a href="http://git.oschina.net/zhoujingjie/apiManager" rel="nofollow" target="_blank">下载源码</a></li>
                <li><a href="${ctx}/help">帮助&amp;说明</a> </li>
            </ul>
        </nav>
    </div>
</header>