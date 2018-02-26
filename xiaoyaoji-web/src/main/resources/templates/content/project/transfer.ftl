<%@ taglib prefix="c" uri="http://java.sun.com.ftl/jstl/core" %>
<%--
  User: zhoujingjie
  Date: 17/4/8
  Time: 13:33
--%>

<!DOCTYPE html>
<html lang="zh-CN">
<head>
    <title>转移项目-${site.name}</title>
    .ftl:include page="/WEB-INF/includes/meta.ftl"/>
    <link rel="stylesheet" href="/css/home.css?v=${v}">
</head>
<body>
.ftl:include page="../dashboard/header.ftl"/>
<div class="project-info mc">
    .ftl:include page="left.ftl"/>
    <div class="project-info-content" id="transfer">
    <div class="db-members cb">
        <div class="form dvn-import-members">
            <c:if test="${users.size()>0}">
                <div class="uk-grid">
                    <div class="uk-width-1-6 label">选择成员</div>
                    <div class="uk-width-5-6">
                        <ul class="cb dbv-chose-users">
                            <c:forEach items="${users}" var="item">
                                <li v-bind:class="{'active':userId=='${item.id}'}" v-on:click="chose('${item.id}')">
                                    <div class="dbv-user-icon">
                                        <c:if test="${item.avatar.length()>0}">
                                            <img class="img" src="${item.avatar}">
                                        </c:if>
                                        <c:if test="${item.avatar.length()==0}">x
                                            <div class="img ta-c word">${item.nickname}</div>
                                        </c:if>
                                        <p class="flag"></p>
                                    </div>
                                    <p>${item.nickname}</p>
                                </li>
                            </c:forEach>
                        </ul>
                    </div>
                </div>
                <div class="uk-grid">
                    <div class="uk-width-1-6 label"></div>
                    <div class="uk-width-5-6">
                        <button class="uk-button uk-button-primary" type="button" v-bind:disabled="userId == projectUserId" v-on:click="ok">确认</button>
                    </div>
                </div>
            </c:if>
        </div>
    </div>
    </div>
</div>
.ftl:include page="/WEB-INF/includes/js.ftl"/>
<script>
    require(['vue','utils'],function(Vue,utils){
    new Vue( {
        el:'#transfer',
        data:{
            projectUserId:'${project.userId}',
            userId:'${project.userId}',
            id:'${project.id}',
        },
        methods:{
            chose:function(userId){
                if(userId==this.userId){
                    return;
                }
                this.userId = userId;
            },
            ok:function(){
                utils.post('/project/'+this.id+'/transfer',{userId:this.userId},function(rs){
                    toastr.success('操作成功');
                });
            }
        }
    }  )
    });
</script>
