<%--
  Created by IntelliJ IDEA.
  User: zr
  Date: 2019/6/17
  Time: 9:48
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<html>
<head>
    <title>Title</title>
</head>
<body style="margin:0 auto; width:800px" onload="chanclo()">
<div style="text-align:center; width:800px">
   回复信息列表
</div>
<form action="${pageContext.request.contextPath}/get" method="post">
    <input type="hidden" id="id" name="id" value="${requestScope.id}">
    <input type="hidden" id="pageIndex" name="pageIndex" value="1">
</form>
<div style="text-align:right; width:770px; padding-right:30px; height:25px; line-height:25px">
    <a href="${pageContext.request.contextPath}/add">添加</a>
</div>

<div style="text-align:center; width:800px">
    <table width="100%" border="1">
        <tr>
            <td>回复内容</td>
            <td>发布时间</td>
            <td>回复昵称</td>

        </tr>
        <c:if test="${info1.list!=null}">
            <c:forEach items="${info1.list}" var="e">
                <tr>
                    <td>${e.content}</td>
                    <td> <fmt:formatDate value="${e.createdate}" pattern="yyyy-MM-dd"></fmt:formatDate></td>
                    <td>${e.author}</td>
                </tr>
            </c:forEach>
        </c:if>
        <tr>
            <td colspan="6" align="center" valign="middle">
                <a href="javascript:do_page(1)">首页</a>
                <a href="javascript:do_page(${info1.pageNum-1})">上一页</a>
                <a href="javascript:do_page(${info1.pageNum+1})">下一页</a>
                <a href="javascript:do_page(${info1.pages})">末页</a>
                ${info.pageNum}/${info1.pages}页
            </td>
        </tr>
        <tr>
            <td colspan="3" align="center" valign="middle">
                <input type="submit" name="sub" id="sub" value="返回" />
                &nbsp;&nbsp;&nbsp;
        </tr>
    </table>

</div>

</body>
<script type="application/javascript" src="${pageContext.request.contextPath}/js/jquery-1.8.0.min.js"></script>
<script type="application/javascript" src="${pageContext.request.contextPath}/js/jquery.form.js"></script>
<script>
    function do_page(pn) {
        $("#pageIndex").val(pn)
        $("#form1").submit();
    }

    function chanclo() {
//获取标签
        var arr = document.getElementsByTagName("tr");
//for循环实现换色
        for (i = 1; i< arr.length ; i++) {
//如果行数为偶数，背景颜色变为X色
            if (i % 2 == 0) {
                arr[i].style.backgroundColor = "White";
            }
//如果行数为奇数，背景颜色变为Y色
            else {
                arr[i].style.backgroundColor = "red";
            }
        }
    }

</script>
</html>
