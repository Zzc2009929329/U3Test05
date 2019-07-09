<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<html>
<head>
    <title>Title</title>
</head>
<body style="margin:0 auto; width: 800px">
<div style="text-align:center; width:800px">
    <h2>添加回复</h2>
    <form action="" method="post" id="form1" enctype="multipart/form-data">
        <table width="100%" border="1">
            <tr>
                <td>回复内容</td>
                <input type="hidden" id="invid" name="invid" value="${requestScope.invid}">
                 <td><textarea name="content" id="content" cols="45" rows="5"></textarea></td>
            </tr>
            <tr>
                <td>回复昵称</td>
                <td><input type="text" name="author" id="author" /></td>
            </tr>
            <tr>
                <td>时间</td>
                <td>
                    <input type="date" name="ontime" id="ontime" /></td>
            </tr>

            <tr>
                <td colspan="2" align="center" valign="middle"><input type="submit" name="sub" id="sub" value="产品上架" />&nbsp;&nbsp;&nbsp;
                    <input type="submit" name="reset" id="reset" value="取消" /></td>
            </tr>
        </table>

    </form>
</div>
</body>
<script type="application/javascript" src="${pageContext.request.contextPath}/js/jquery-1.8.0.min.js"></script>
<script type="application/javascript" src="${pageContext.request.contextPath}/js/jquery.form.js"></script>
</html>
