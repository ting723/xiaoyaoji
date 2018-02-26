<%--
  User: zhoujingjie
  Date: 17/4/12
  Time: 22:44
--%>

<%@ taglib prefix="c" uri="http://java.sun.com.ftl/jstl/core" %>

<c:if test="${!isXHR}">
    .ftl:include page="../doc-header.ftl"/>
    .ftl:include page="../doc-sidebar.ftl"/>
    .ftl:include page="share-doc-left.ftl">
        .ftl:param name="view" value="true"/>
    <.ftl:include>
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
</c:if>


<c:if test="${doc!=null }">
    <c:if test="${pluginInfo == null}">
        .ftl:include page="/WEB-INF/includes/doc-type-not-support.ftl"/>
    </c:if>
    <c:if test="${pluginInfo != null}">
        .ftl:include page="/WEB-INF/plugins/${pluginInfo.runtimeFolder}/web/${pluginInfo.plugin.viewPage}"/>
    </c:if>
</c:if>
<!-- loading start -->


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
    <!-- loading end -->
    </body>
    </html>
</c:if>