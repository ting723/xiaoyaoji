<!DOCTYPE html>
<html lang="zh-CN">
<head>
    <title>导出-${site.name}</title>
    <#include "../../includes/meta.ftl"/>
    <link rel="stylesheet" href="/css/home.css?v=${v}">
</head>
<body>
<#include "../dashboard/header.ftl"/>
<div class="project-info mc">
    <#include "left.ftl"/>
    <div class="project-info-content">
        <div class="db-export">
            <ul class="cb">
                <#list exportPlugins as item>
                    <li onclick="window.open('${ctx}/project/${project.id}/export/${item.id}/do')">
                        <img src="${ctx}/proxy/${item.id}/${item.icon.icon32x32}?v=${item.version}">
                        <p>${item.name}</p>
                    </li>
                </#list>

            </ul>
        </div>
    </div>
</div>
