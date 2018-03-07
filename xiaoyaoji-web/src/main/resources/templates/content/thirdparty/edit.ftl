<style>
    .tp-content{
        padding: 10px;
        width: 100%;
        height: 50px;
    }
</style>
<div id="thirdparty">
    <textarea class="tp-content" placeholder="请输入第三方链接地址">${doc.content}</textarea>
</div>
<script>
    window.getDoc = function(){
        return {content:$('.tp-content').val()}
    }
</script>