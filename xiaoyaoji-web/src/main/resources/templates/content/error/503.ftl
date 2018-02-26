<%@ page import="org.apache.log4j.Logger" %>

<%
    Exception exception = (Exception) request.getAttribute("exception");
    response.setStatus(503);
    String errorMsg = (String) request.getAttribute("errorMsg");
    if(exception != null){
        if(errorMsg == null && exception instanceof IllegalArgumentException){
            errorMsg = exception.getMessage();
        }else{
            Logger.getLogger("exception").error("",exception);
            errorMsg="系统错误";
        }
    }

    request.setAttribute("errorMsg",errorMsg);
%>
<!DOCTYPE html>
<html lang="zh-CN">
<head>
    <meta charset="UTF-8">
    <title>503</title>
</head>
<body>
${errorMsg}
</body>
</html>
