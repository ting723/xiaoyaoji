<div class="doc-left" id="docLeft">
    <div class="dl-content" id="doc-names">
        <ul class="dl-docs" v-show="!showSearch">
            <#if test="${!edit}">
                <li class="cb">
                    <div class="dl-doc dl-project-name">
                        <div class="doc-name cb ">
                            <span class="el-tree-expand is-leaf"></span>
                            ${project.name}
                        </div>
                    </div>
                </li>
                <li class="divider"></li>
            </#if>
            <c:forEach items="${docs}" var="doc">
                <c:set var="item" value="${doc}" scope="request"/>
                <#include "share-doc-left-item.ftl"/>
            </c:forEach>
        </ul>
    </div>

    <div class="dl-placehoder" v-cloak>
        本文档由<a href="http://www.xiaoyaoji.com.cn" target="_blank">小幺鸡</a>编辑
    </div>
</div>
<script>window._projectId_ = '${project.id}';
window._edit_ = '${edit}'</script>
<script src="/js/project/left.js?v=${v}"></script>