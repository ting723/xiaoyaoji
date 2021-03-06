<link rel="stylesheet" type="text/css" href="/simplemd/simplemde.min.css?v=${pluginInfo.version}"/>
<style>
    .editor-preview-side ul{
        padding-left:30px;
    }
    .editor-preview-side ul li{
        list-style:disc;
    }
</style>
<textarea class="hide" id="md-edit">${doc.content?string(doc.content,"")}</textarea>
<script>
    (function(){
        requirejs(['/simplemd/simplemde.min.js?v=${pluginInfo.version}'],function(SimpleMDE){
            var md = new SimpleMDE({
                element: document.getElementById("md-edit"),
                spellChecker: false,
                showIcons: ["code", "table","heading-1","heading-2","heading-3"],
            });

            window.getDoc = function(){
                return {content:md.value()}
            }
        });
    })();
</script>