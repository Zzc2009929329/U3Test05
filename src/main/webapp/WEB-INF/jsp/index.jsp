
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<html>
<head>
    <title>Title</title>
</head>
<body style="margin:0 auto; width:800px" onload="chanclo()">
<div style="text-align:center; width:800px">
    <form action="${pageContext.request.contextPath}/index" method="post"  id="form1">
        &nbsp;&nbsp;帖子标题
        <input type="text" id="title" name="title" value="${requestScope.param.title}">
        <input type="hidden" id="pageIndex" name="pageIndex" value="1">
        <input type="submit" name="sub" id="sub" value="查询" />
    </form>
</div>
<div style="text-align:center; width:800px">
    <table width="100%" border="1">
        <tr>
            <td>标题</td>
            <td>发布时间</td>
            <td>内容摘要</td>
            <td>作者</td>
            <td>操作</td>
        </tr>
        <c:if test="${info.list!=null}">
            <c:forEach items="${info.list}" var="e">
                <tr>
                    <td>${e.title}</td>
                    <td> <fmt:formatDate value="${e.createdate}" pattern="yyyy-MM-dd"></fmt:formatDate></td>
                    <td>${e.summary}</td>
                    <td>${e.author}</td>
                    <td>
                        <a href="javascript:do_delete(${e.id})">删除</a>
                        <a href="${pageContext.request.contextPath}/get/${e.id}">详细</a></td>
                </tr>
            </c:forEach>
        </c:if>
        <tr>
            <td colspan="6" align="center" valign="middle">
                <a href="javascript:do_page(1)">首页</a>
                <a href="javascript:do_page(${info.pageNum-1})">上一页</a>
                <a href="javascript:do_page(${info.pageNum+1})">下一页</a>
                <a href="javascript:do_page(${info.pages})">末页</a>
                ${info.pageNum}/${info.pages}页
            </td>
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
    function do_delete(id) {
       if (confirm("确认删除吗")){
           location.href="${pageContext.request.contextPath}/delete/"+id;
       }
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
