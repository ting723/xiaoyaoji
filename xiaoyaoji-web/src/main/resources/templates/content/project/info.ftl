<%--
  User: zhoujingjie
  Date: 17/4/8
  Time: 13:33
--%>

<!DOCTYPE html>
<html lang="zh-CN">
<head>
    <title>基本信息-${site.name}</title>
    <#include "/WEB-INF/includes/meta.ftl"/>
    <link rel="stylesheet" href="/css/home.css?v=${v}">
</head>
<body>
<#include "../dashboard/header.ftl"/>
<div class="project-info mc">
    <#include "left.ftl"/>
    <div class="project-info-content" id="projectInfo">
        <form class="uk-form-stacked form" onsubmit="return false;">
            <div class="uk-margin">
                <label class="uk-form-label" for="form-stacked-text">项目名称</label>
                <div class="uk-form-controls">
                    <input class="uk-input" name="projectName" v-validate="'required'" id="form-stacked-text" v-model="name" autofocus type="text" placeholder="请输入项目名称">
                    <p class="tip">{{errors.first('projectName')}}</p>
                </div>
            </div>

            <div class="uk-margin">
                <div class="uk-form-label">项目权限</div>
                <div class="uk-form-controls">
                    <div class="uk-margin uk-grid-small uk-child-width-auto" uk-grid>
                        <label><input class="uk-radio" v-model="permission" value="PUBLIC" type="radio" name="permission"> 公开</label>
                        <label><input class="uk-radio" v-model="permission" value="PRIVATE" type="radio" name="permission"> 私有项目</label>
                    </div>
                </div>
            </div>

            <div class="uk-margin">
                <div class="uk-form-label">项目描述</div>
                <div class="uk-form-controls">
                    <textarea class="uk-textarea" rows="6" v-model="description" placeholder="请输入项目描述" maxlength="300"></textarea>
                </div>
            </div>
            <div class="uk-margin">
                <button class="uk-button uk-button-primary" type="button" v-on:click.enter="submit">保存</button>
            </div>
        </form>
    </div>
</div>
<#include "/WEB-INF/includes/js.ftl"/>
<script>
    $(function(){
         require(['vue','utils','vueEx'],function(Vue,utils){
             new Vue({
                 el:'#projectInfo',
                 data:{
                     id:'${project.id}',
                     name:'${project.name}',
                     permission:'${project.permission}',
                     description:'${project.description}'
                 },
                 methods:{
                    submit:function(){
                        utils.post('/project/'+this.id,{name:this.name,permission:this.permission,description:this.description},function(rs){
                            toastr.success('修改成功');
                        });
                    }
                 }
             });
         });
    });
</script>
</body>
</html>