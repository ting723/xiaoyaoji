<li class="cb name-item" data-id="${item.id}" data-name="${item.name}" data-type="${item.type}"
    data-sort="${item.sort}">
    <div class="dl-doc">
        <div class="doc-name cb ${(docId == item.id)?string('active','')} _ ${(item.children.size() ==0)?string('','folder')}"
             v-on:click.stop="fold($event)">
            <span class="dl-background"></span>
            <span class="el-tree-expand ${(item.children.size() ==0)?string('is-leaf','')}"></span>
            <a class="item-name" v-on:click.stop="itemClick('/share/${share.id}/${item.id}',$event)"
               href="${ctx}/share/${share.id}/${item.id}">${item.name}</a>

        </div>
        <#if test="${item.children.size()>0}">
        <ul class="dl-docs dl-docs-sub hide" data-id="${item.id}">
            <#list item.children as item>
                <#--<c:set var="item" value="${item}" scope="request"/>-->
                <#include "share-doc-left-item.ftl"/>
            </#list>
        </ul>
        </#if>
    </div>
</li>