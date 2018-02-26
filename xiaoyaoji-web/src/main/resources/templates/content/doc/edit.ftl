<%--
  User: zhoujingjie
  Date: 17/4/12
  Time: 22:44
--%>

<%@ taglib prefix="c" uri="http://java.sun.com.ftl/jstl/core" %>
<%--
  User: zhoujingjie
  Date: 17/4/12
  Time: 22:15
--%>

<c:if test="${!isXHR}">
    .ftl:include page="doc-header.ftl"/>
    .ftl:include page="doc-sidebar.ftl"/>
    .ftl:include page="doc-left.ftl"/>
    <div class="doc-content doc" >
    <div class="hide" id="loading">
        <div class="spinner">
            <div class="double-bounce1"></div>
            <div class="double-bounce2"></div>
        </div>
    </div>
    <div id="doc-content">

</c:if>
<c:if test="${editProjectGlobal}">
    .ftl:include page="../project/global/project-global.ftl"/>
</c:if>
<c:if test="${!editProjectGlobal && doc!=null}">
    <c:if test="${pluginInfo == null}">
        .ftl:include page="/WEB-INF/includes/doc-type-not-support.ftl"/>
    </c:if>
    <c:if test="${pluginInfo != null}">
        .ftl:include page="/WEB-INF/plugins/${pluginInfo.runtimeFolder}/web/${pluginInfo.plugin.editPage}"/>
    </c:if>
</c:if>
<script>
    window._edit_ = '${edit}', _projectName_ = '${project.name}', _projectId_ = '${project.id}', _docId_ = '${docId}';
    if(!window.requirejs){
        location.reload();
    }
</script>
<c:if test="${!isXHR}">
    </div>
    </div>
    <%--</div>--%>

    </body>
    </html>
</c:if>