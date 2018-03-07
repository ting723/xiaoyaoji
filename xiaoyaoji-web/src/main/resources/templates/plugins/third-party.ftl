<!doctype html>
<html>
<head>
    <title></title>
</head>
<body>
<script>
    var data={
        'accessToken':'${accessToken}',
        'thirdpartyId':'${thirdpartyId}',
        'type':'${type}'
    };
    window.opener.postMessage(JSON.stringify(data),'*');
    window.close();
</script>
</body>
</html>