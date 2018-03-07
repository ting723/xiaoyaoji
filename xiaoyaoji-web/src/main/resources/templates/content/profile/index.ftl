<#include "header.ftl"/>
<div class="project-info mc">
    <#include "left.ftl"/>
    <div class="project-info-content" id="content">
        <div class="db-profile form">
            <div class="item">
                <div class="col-sm-2" style="line-height: 100px">头像</div>
                <div class="col-sm-10">
                    <div class="gitHubUser-logo">
                        <img src='${gitHubUser.avatar}' alt="">
                        <div class="logo-edit" title="修改头像"><i class="iconfont icon-edit3"></i></div>
                        <input id="imagefile" type="file" v-on:change="uploadImage">
                    </div>
                </div>
            </div>
            <div class="item">
                <div class="col-sm-2 full-text">姓名</div>
                <div class="col-sm-4"><input type="text" maxlength="20" v-on:keyup="modify=true" v-model="gitHubUser.nickname"
                                             value="${gitHubUser.nickname}" class="text" placeholder="请输入姓名"></div>
            </div>

            <div class="item">
                <div class="col-sm-2">邮箱</div>
                <div class="col-sm-6">${gitHubUser.email}</div>
            </div>
            <div class="item">
                <div class="col-sm-2">注册时间</div>
                <div class="col-sm-6">{{gitHubUser.createtime}}</div>
            </div>

            <div class="item">
                <div class="col-sm-2 label"></div>
                <div class="col-sm-6">
                    <button type="button" class="uk-button uk-button-primary uk-button-small" v-on:click="ok"
                            v-bind:disabled="!modify">确认</button>
                    </div>
            </div>
        </div>
    </div>
</div>
<#include "../../includes/js.ftl"/>
<script>
    require(['vue', 'utils'], function (Vue, utils) {
        new Vue({
            el: '#content',
            data: {
                gitHubUser: utils.toJSON('${gitHubUser}'),
                modify: false
            },
            methods: {
                uploadImage: function (e) {          //图片上传前预览
                    var self = this;
                    if (e.target.files.length === 0) {
                        return;
                    }  //未选取图片时防止报错
                    var file = e.target.files[0];       //获取用户选取的图片
                    if (!/image\/\w+/.test(file.type)) {  //图片类型筛选
                        toastr.error('请上传图片！');
                        return false;
                    }
                    var fd = new FormData();
                    fd.append('avatar', file);
                    utils.fileloader('/gitHubUser/avatar', fd,
                        function (rs) {
                            location.reload();
                        });
                },
                ok: function () {
                    var self = this;
                    utils.post('/gitHubUser/', {nickname: this.gitHubUser.nickname}, function () {
                        toastr.success('修改成功');
                    });
                }
            }
        })
    });
</script>