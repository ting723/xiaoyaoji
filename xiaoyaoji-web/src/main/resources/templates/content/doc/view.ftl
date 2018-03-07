<#if !isXHR>
    <#include "doc-header.ftl"/>
    <#include "doc-sidebar.ftl"/>
    <#include "doc-left.ftl">
<div class="doc doc-content">
    <div class="hide" id="loading">
        <div class="spinner">
            <div class="double-bounce1"></div>
            <div class="double-bounce2"></div>
        </div>
    </div>

    <div class="doc-full-width" id="doc-content">


</#if>

<#if editProjectGlobal!false>
    <#include "../project/global/project-global.ftl"/>
</#if>
<#if editProjectGlobal!true && doc?? >
    <#if pluginInfo??>
        <#include "../../includes/doc-type-not-support.ftl"/>
    </#if>
    <#if pluginInfo??>
        <#include "../../plugins/${pluginInfo.runtimeFolder}/web/${pluginInfo.plugin.viewPage}"/>
    </#if>
</#if>
<!-- loading start -->


<script>
    window._edit_ = ${(edit!false)?string('true','false')}, _projectName_ = '${project.name}', _projectId_ = '${project.id}', _docId_ = '${docId}';
    if (!window.requirejs) {
        location.reload();
    }
</script>

<#if !isXHR>
    </div>
    </div>
    </body>
    </html>
</#if>