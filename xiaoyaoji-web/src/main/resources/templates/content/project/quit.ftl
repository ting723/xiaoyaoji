<%--
  User: zhoujingjie
  Date: 17/4/8
  Time: 13:33
--%>

<!DOCTYPE html>
<html lang="zh-CN">
<head>
    <title>退出项目-${site.name}</title>
    <#include "/WEB-INF/includes/meta.ftl"/>
    <link rel="stylesheet" href="/css/home.css?v=${v}">
</head>
<body>
<#include "../dashboard/header.ftl"/>
<div class="project-info mc">
    <#include "left.ftl"/>
    <div class="project-info-content" id="quit">
        <div class="db-view-quit">
            <button class="btn btn-danger" v-on:click="ok" style="padding: 10px 100px;">退出项目</button>
        </div>
    </div>
</div>
<#include "/WEB-INF/includes/js.ftl"/>
<script>
    require(['vue', 'utils'], function (Vue, utils) {
        new Vue({
            el: '#quit',
            data:{
                id:'${project.id}'
            },
            methods: {
                ok:function(){
                    var self= this;
                    UIkit.modal.confirm('是否确认退出?').then(function(){
                        utils.delete('/project/' +self.id + '/quit.json', function () {
                            toastr.success('操作成功');

                            setTimeout(function(){
                                location.href=x.ctx+'/dashboard';
                            },1000);
                        })
                    });
                }
            }
        })
    })
</script>
