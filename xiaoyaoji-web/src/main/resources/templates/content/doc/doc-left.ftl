<div class="doc-left" id="docLeft">
    <#if edit!false >
        <div class="dl-doc-actions cb">
            <div class="fl dl-doc-action">
                <a><i class="el-icon-plus"></i>新建</a>
                <ul class="dl-menus hide">
                    <#list docEvPluginInfos as item>
                        <li uk-toggle="target: #docCreateModal" v-on:click="createFn('${item.id}',0)">
                            <div data-type="${item.id}" class="dl-menu-name">${item.name}</div>
                        </li>
                    </#list>
                </ul>
            </div>
        </div>
    </#if>

    <input type="text" class="doc-search" v-model="searchText" v-on:keyup.enter="search" placeholder="搜索...">
    <div class="dl-content" id="doc-names">
        <ul class="dl-docs" v-on:contextmenu.prevent="contextMenu($event)" v-show="!showSearch">
            <#if edit!true >
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
            <#if docs??>
                <#list docs as item>
                    <#include "doc-left-item.ftl"/>
                </#list>
            </#if>
        </ul>
        <ul class="dl-docs doc-search-result" v-cloak v-show="showSearch">
            <li class="cb" v-for="item in searchResults">
                <div class="dl-doc">
                    <div class="doc-name cb ">
                        <span class="dl-background"></span>
                        <a class="item-name" v-on:click="itemClick('/doc/'+(item.id)+(edit?'/edit':''),$event)"
                           :href="ctx+'/doc/'+(item.id)+(edit?'/edit':'')">{{item.name}}</a>
                    </div>
                </div>
            </li>
            <div v-show="searchResults.length == 0" class="searh-no-results">
                没有找到对应的结果
            </div>
        </ul>
    </div>

    <ul class="dl-menus" id="dl-menus" v-on:click.stop v-cloak v-show="menu.show"
        v-bind:style="{top:menu.top+'px',left:menu.left+'px'}">
        <li>
            <div class="dl-menu-name folder">新建</div>
            <ul class="dl-menus sub">
                <#if docEvPluginInfos??>
                    <#list docEvPluginInfos as item>
                        <li uk-toggle="target: #docCreateModal" v-on:click="createFn('${item.id}')">
                            <div data-type="${item.id}" class="dl-menu-name">${item.name}</div>
                        </li>
                    </#list>
                </#if>
            </ul>
        </li>
        <li class="line" v-if="menu.isFolder"></li>

        <li uk-toggle="target:#docCopyModal">
            <div class="dl-menu-name">复制</div>
        </li>
        <li v-on:click="updateName($event)" uk-toggle="target: #docCreateModal">
            <div class="dl-menu-name">重命名</div>
        </li>
        <li v-on:click="deleteDoc">
            <div class="dl-menu-name">删除</div>
        </li>
    </ul>

    <div uk-modal id="docCreateModal" v-cloak>
        <div class="uk-modal-dialog">
            <div class="uk-modal-body">
                <div>
                    <label>请输入名称:</label>
                    <input class="uk-input" v-model="createModal.value" v-on:keyup.enter="createSubmit"
                           :value="createModal.value" type="text"
                           autofocus="">
                </div>
            </div>
            <div class="uk-modal-footer uk-text-right">
                <button class="uk-button uk-button-default uk-modal-close" type="button">取消</button>
                <button class="uk-button uk-button-primary" v-on:click="createSubmit">{{createModal.id?'更新':'创建'}}
                </button>
            </div>
        </div>
    </div>

    <div uk-modal id="docCopyModal" v-cloak>
        <div class="uk-modal-dialog">
            <div class="uk-modal-body">
                <form class="uk-form-stacked">
                    <div class="uk-margin">
                        <label class="uk-form-label" for="form-stacked-select">选择一个项目(destination)</label>
                        <div class="uk-form-controls">
                            <select class="uk-select" id="form-stacked-select" v-model="copiesProjectId">
                                <option v-for="item in projects" v-bind:value="item.id">{{item.name}}</option>
                            </select>
                        </div>
                    </div>

                </form>
            </div>
            <div class="uk-modal-footer uk-text-right">
                <button class="uk-button uk-button-default uk-modal-close" type="button">取消</button>
                <button class="uk-button uk-button-primary" v-on:click="copyDoc">复制</button>
            </div>
        </div>
    </div>



    <div class="dl-placehoder" v-cloak>
        本文档由<a href="http://www.xiaoyaoji.cn" target="_blank">小幺鸡</a>编辑
    </div>
</div>
<script>window._projectId_ = '${project.id}';
<#if edit!false>
window._edit_ = ${edit?c}
</#if>
</script>
<script src="/js/project/left.js"></script>