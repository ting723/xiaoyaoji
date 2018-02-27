<!--[if lt IE 9]>
<script>location.href = '../unsupport.html'</script> <![endif]-->
<!DOCTYPE html>
<html lang="zh-CN">
<head>
    <title>回收站 - ${site.name}</title>
    <#include "../../includes/meta.ftl">
    <link rel="stylesheet" href="/css/home.css?v=${v}">
</head>
<body class="home">
    <#include "header.ftl">
<div class="home-body" id="appmain" v-cloak>
    <div class="spinner" v-show="loading.project">
        <div class="double-bounce1"></div>
        <div class="double-bounce2"></div>
    </div>
    <div class="mc home-projects" v-if="projects.length>0">
        <div class="cb home-p-title">
            <div class="col-sm-4">项目名称</div>
            <div class="col-sm-2">拥有者</div>
            <div class="col-sm-6 p-actions">操作</div>
        </div>
        <div class="cb" v-for="item in projects">
            <div class="col-sm-4"><a :href="'${ctx}/project/'+item.id">&nbsp;{{item.name}} </a></div>
            <div class="col-sm-2">凉粉</div>
            <div class="col-sm-6 p-actions">
                <i class="iconfont icon-history" v-on:click="restore(item.id)"></i>
            </div>
        </div>
    </div>
</div>
    <#include "../../includes/js.ftl">
<script>_userId_ = '${user.id}', status = 'ARCHIVE';</script>
<script src="/js/dashboard/home.js?v=${v}"></script>
</body>
</html>