<#if !isXHR>
    <#include "doc-header.ftl"/>
    <#include "doc-sidebar.ftl"/>
    <#include "doc-left.ftl"/>
    <div class="doc-content doc" >
    <div class="hide" id="loading">
        <div class="spinner">
            <div class="double-bounce1"></div>
            <div class="double-bounce2"></div>
        </div>
    </div>
    <div id="doc-content">

</#if>
<#if editProjectGlobal??>
    <#include "../project/global/project-global.ftl"/>
</#if>
<#if editProjectGlobal??&&!editProjectGlobal && doc!=null>
    <#if test="${pluginInfo == null}">
        <#include "../../includes/doc-type-not-support.ftl"/>
    </#if>
    <#if test="${pluginInfo != null}">
        <#include "../${pluginInfo.runtimeFolder}/web/${pluginInfo.plugin.editPage}"/>
    </#if>
</#if>
<script>
    window._edit_ = ${edit?c}, _projectName_ = '${project.name}', _projectId_ = '${project.id}', _docId_ = '${docId}';
    if(!window.requirejs){
        location.reload();
    }
</script>
<#if !isXHR>
    </div>
    </div>
    </body>
    </html>
</#if>