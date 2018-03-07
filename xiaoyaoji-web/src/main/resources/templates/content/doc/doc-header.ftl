<!DOCTYPE html>
<html lang="zh-Hans">
<head>
    <title>${doc.name}-${project.name}</title>
    <link rel="stylesheet" href="/css/doc.css?v=${v}"/>
    <link rel="stylesheet" href="/css/icons.css?v=${v}"/>
    <#include "../../includes/meta.ftl"/>
    <#include "../../includes/js.ftl"/>
</head>
<body>

<div class="xd-header cb" id="xd-header">
    <#if (Session.user?? && editPermission)>
    <div class="fl">
        <ul class="x-ul horiz">
            <li>
                <div class="x-li"><a>全局设置</a></div>
                <div class="x-sub-ul">
                    <ul>
                        <li v-on:click="sidebar('loadGlobal','http')"><div class="x-li"><a>全局参数</a></div></li>
                        <li v-on:click="sidebar('loadGlobal','env')"><div class="x-li"><a>环境变量</a></div></li>
                        <li v-on:click="sidebar('loadGlobal','status')"><div class="x-li"><a>全局状态</a></div></li>
                    </ul>
                </div>
            </li>
            <li>
                <div class="x-li"><a>项目设置</a></div>
                <div class="x-sub-ul">
                    <ul>
                        <li v-on:click="sidebar('loadShares')"><div class="x-li"><a >项目分享</a></div></li>
                        <li><div class="x-li"><a href="${ctx}/project/${project.id}/info">项目信息</a></div></li>
                        <li><div class="x-li"><a href="${ctx}/project/${project.id}/transfer">项目转让</a></div></li>
                        <li><div class="x-li"><a href="${ctx}/project/${project.id}/member">项目成员</a></div></li>
                        <li><div class="x-li"><a href="${ctx}/project/${project.id}/export">导出项目</a></div></li>
                        <li><div class="x-li"><a href="${ctx}/project/${project.id}/quit">退出项目</a></div></li>
                    </ul>
                </div>
            </li>
            <li v-on:click="sidebar('loadHistory')">
                <div class="x-li"><a >历史记录</a></div>
            </li>
            <li>
                <div class="x-li">|</div>
            </li>

            <#if edit!true && editPermission!false >
                <li v-on:click="sidebar('editpage')">
                    <div class="x-li"><a><i class="iconfont icon-edit1"></i>编辑项目</a></div>
                </li>
            </#if>
            <#if docId?? && edit!false>
                <li v-on:click="sidebar('viewpage')">
                    <div class="x-li"><a><i class="iconfont icon-eye"></i>预览项目</a></div>
                </li>
                <li uk-toggle="target: #save-modal">
                    <div class="x-li"><a style="color: #1e87f0"><i class="iconfont icon-save"></i>保存</a></div>
                </li>
            </#if>
        </ul>
    </div>
    </#if>
    <div class="fr">
        <ul class="x-ul horiz">
            <li><div class="x-li"><a href="${ctx}/">主页</a></div></li>
            <li><div class="x-li"><a href="${ctx}/dashboard">控制台</a></div></li>
            <li><div class="x-li"><a href="http://www.xiaoyaoji.cn/donate" target="_blank">赞助作者</a></div></li>
            <#if Session.user?? >
            <li>
                <div class="x-li"><a><img src="${Session.user.avatar}" class="user-account-logo">&nbsp;${Session.user.nickname}</a></div>
                <div class="x-sub-ul" style="right:0px;">
                    <ul>
                        <li><div class="x-li"><a href="${ctx}/profile">个人中心</a></div></li>
                        <li><div class="x-li"><a href="${ctx}/profile/security">安全设置</a></div></li>
                        <li><div class="x-li"><a href="${ctx}/help">帮助中心</a></div></li>
                        <li><div class="x-li"><a href="http://www.xiaoyaoji.cn/donate" target="_blank">请作者喝咖啡</a></div></li>
                        <li class="uk-nav-divider"></li>
                        <li><div class="x-li"><a href="${ctx}/logout">退出登录</a></div></li>
                    </ul>
                </div>
            </li>
            <#else>
                <li><div class="x-li"><a href="${ctx}/login">登录</a></div></li>
                <li><div class="x-li"><a href="${ctx}/register">注册</a></div></li>
            </#if>
        </ul>
    </div>
</div>
<div class="xd-header-placeholder"></div>
<script src="/js/project/doc/header.js?v=${v}"></script>
<#if editProjectGlobal??>
<script>window._isGlobal_ = ${editProjectGlobal}</script>
</#if>

