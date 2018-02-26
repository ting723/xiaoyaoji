<%@ taglib prefix="c" uri="http://java.sun.com.ftl/jstl/core" %>
<%--
  User: zhoujingjie
  Date: 17/4/4
  Time: 13:15
--%>

<!--[if lt IE 9]>
<script>location.href = '../unsupport.html'</script> <![endif]-->
<!DOCTYPE html>
<html lang="zh-CN">
<head>
    <title>回收站 - ${site.name}</title>
    .ftl:include page="/WEB-INF/includes/meta.ftl"/>
    <link rel="stylesheet" href="/css/home.css?v=${v}">
</head>
<body class="home">
.ftl:include page="header.ftl"/>
<div class="home-body" id="appmain" v-cloak>
    <p class="ta-c" style="margin: 50px 0;color: #ccc;">提示：删除的文件保留30天，超过30天会自动删除</p>
    <div class="spinner" v-show="loading.project">
        <div class="double-bounce1"></div>
        <div class="double-bounce2"></div>
    </div>
    <div class="mc home-projects" v-if="projects.length>0">
        <div class="cb home-p-title">
            <div class="col-sm-4">项目名称</div>
            <div class="col-sm-2">拥有者</div>
            <div class="col-sm-2">有效期</div>
            <div class="col-sm-4 p-actions">操作</div>
        </div>
        <div class="cb" v-for="item in projects">
            <div class="col-sm-4"><a :href="'${ctx}/project/'+item.id">{{item.name}}</a></div>
            <div class="col-sm-2">凉粉 </div>
            <div class="col-sm-3">{{item.expires}} </div>
            <div class="col-sm-3 p-actions">
                <i class="iconfont icon-history" v-on:click="restore(item.id)"></i>
                <i class="iconfont icon-delete" v-on:click="deleteActual(item.id)"></i>
            </div>
        </div>
    </div>
</div>
.ftl:include page="/WEB-INF/includes/js.ftl"/>
<script>_userId_='${user.id}',status='DELETED';</script>
<script src="/js/dashboard/home.js?v=${v}"></script>
</body>
</html>