<#if !isXHR>
    <#include "doc-header.ftl"/>
    <#include "doc-sidebar.ftl"/>
    <#include "doc-left.ftl"/>

<div class="doc doc-content">
    <div class="hide" id="loading">
        <div class="spinner">
            <div class="double-bounce1"></div>
            <div class="double-bounce2"></div>
        </div>
    </div>

    <div class="doc-full-width" id="doc-content">

    <#if editProjectGlobal!false>
        <#include "../project/global/project-global.ftl"/>
    </#if>
    <#if editProjectGlobal!true && doc?? >
        <#if pluginInfo??>
            <#include "../${pluginInfo.runtimeFolder}/${pluginInfo.plugin.viewPage}"/>
        <#else>
            <#include "../../includes/doc-type-not-support.ftl"/>
        </#if>
    </#if>

    </div>
</div>
</#if>
<script>
    window._edit_ = ${(edit!false)?string('true','false')}, _projectName_ = '${project.name}', _projectId_ = '${project.id}', _docId_ = '${docId}';
    if (!window.requirejs) {
        location.reload();
    }
</script>
