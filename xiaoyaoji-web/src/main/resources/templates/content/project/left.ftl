<div class="project-left">
    <ul class="project-menus">
        <#if project.userId == Session.user.id>
            <li>
                <a href="${ctx}/project/${project.id}/info" class="${(pageName=='info')?string('active','')}">项目信息</a>
            </li>
            <li>
                <a href="${ctx}/project/${project.id}/transfer" class="${(pageName=='transfer')?string('active','')}">项目转让</a>
            </li>
        </#if>
        <li>
            <a href="${ctx}/project/${project.id}/member" class="${(pageName=='member')?string('active','')}">项目成员</a>
        </li>
        <li>
            <a href="${ctx}/project/${project.id}/export" class="${(pageName=='export')?string('active','')}">导出</a>
        </li>
        <li>
            <a href="${ctx}/project/${project.id}/quit" class="${(pageName=='quit')?string('active','')}">退出项目</a>
        </li>
    </ul>
</div>