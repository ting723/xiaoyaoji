<%
    Doc doc = (Doc) request.getAttribute("doc");
    List
<Doc> docs = DocService.instance().getDocsByParentId(doc.getProjectId(),doc.getId());
    request.setAttribute("docs",docs);
    %>
    <div id="folder">
        <div style="padding: 50px 100px;font-size: 16px">
    <#if (docs?size>0)>
        <ul class="uk-list uk-list-bullet"> ${root.getDocPath()}
        <#list docs as item>
            <li><a href="${fn.getDocViewURL(item.id)}">${item.name}</a></li>
        </#list>
        </ul>
    </#if>
        </div>
    </div>