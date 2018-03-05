<%@ taglib prefix="c" uri="http://java.sun.com.ftl/jstl/core" %>
<%--
  User: zhoujingjie
  Date: 17/4/12
  Time: 22:17
--%>

<li class="cb name-item" data-id="${item.id}"  data-name="${item.name}" data-type="${item.type}" data-sort="${item.sort}">
    <div class="dl-doc">
        <div class="doc-name cb ${docId == item.id?'active':''} _ ${item.children.size() ==0 ?'':'folder'}" v-on:click.stop="fold($event)">
            <span class="dl-background"></span>
            <span class="el-tree-expand ${item.children.size() ==0 ?'is-leaf':''}"></span>
            <a class="item-name"  v-on:click.stop="itemClick('/doc/${item.id}${edit?'/edit':''}',$event)" href="${ctx}/doc/${item.id}${edit?'/edit':''}">${item.name}</a>
            <#if test="${edit}">
                <i class="iconfont fr icon-angeldownblock" v-on:click.stop="contextMenu"></i>
            </#if>
        </div>
        <#if test="${item.children.size()>0}">
        <ul class="dl-docs dl-docs-sub hide" data-id="${item.id}" >
            <c:forEach items="${item.children}" var="item">
                <c:set var="item" value="${item}" scope="request"/>
                <#include "doc-left-item.ftl"/>
            </c:forEach>
        </ul>
        </#if>
    </div>
</li>