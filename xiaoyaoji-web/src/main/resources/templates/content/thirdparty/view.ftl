<div id="thirdparty">
    <iframe width="100%" id="iframe" height="600px" marginwidth="0" marginheight="0" allowtransparency="true" src="${doc.content}"></iframe>
    <script>
        (function(){
            var height = $(window).height()-$('#doc-header').height() - ($('.doc-content-header').height() || 0 ) - 20;
            $('#iframe').height(height);
        })();
    </script>
</div>