<#if test="${!isXHR}">
    <#include "../doc-header.ftl">
    <#include "../doc-sidebar.ftl">
    <#include "share-doc-left.ftl">
<style>
    .xd-header-placeholder,.xd-header{
        display: none;
    }
</style>
<div class="doc doc-content">
    <div class="hide" id="loading">
        <div class="spinner">
            <div class="double-bounce1"></div>
            <div class="double-bounce2"></div>
        </div>
    </div>

    <div class="doc-full-width" id="doc-content">
</#if>


<#if test="${doc!=null }">
    <#if test="${pluginInfo == null}">
        <#include "../../../includes/doc-type-not-support.ftl"/>
    </#if>
    <#if test="${pluginInfo != null}">
        <#include "../../../plugins/${pluginInfo.runtimeFolder}/web/${pluginInfo.plugin.viewPage}"/>
    </#if>
</#if>
<!-- loading start -->


<script>
    window._edit_ = '${edit}', _projectName_ = '${project.name}', _projectId_ = '${project.id}', _docId_ = '${docId}';
    if(!window.requirejs){
        location.reload();
    }
</script>

<#if test="${!isXHR}">
    </div>
    </div>
    <%--</div>--%>
    <!-- loading end -->
    </body>
    </html>
</#if>