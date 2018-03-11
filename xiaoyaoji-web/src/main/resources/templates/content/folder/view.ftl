<div id="folder">
    <div style="padding: 50px 100px;font-size: 16px">
    <#if (folderDocs?size>0)>
        <ul class="uk-list uk-list-bullet">
        <#--<#list docs as item>-->
            <#--<li><a href="${fn?getDocViewURL(item.id)}">${item.name}</a></li>-->
        <#--</#list>-->

        <#list fns as fnMap>
            <#list fnMap?keys as key>
            <li><a href="${key}">${fnMap[key]}</a></li>
            </#list>
        </#list>
        </ul>
    </#if>
    </div>
</div>