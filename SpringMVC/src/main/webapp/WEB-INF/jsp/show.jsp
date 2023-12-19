<%@page import="com.bean.Student"%>
<%@page import="com.dao.StudentDao"%>
<%@page import="org.springframework.context.support.ClassPathXmlApplicationContext"%>
<%@page import="org.springframework.context.ApplicationContext"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN"
	crossorigin="anonymous">
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
	if(request.getAttribute("msg")!=null)
	{
		out.println(request.getAttribute("msg"));
	}
%>
	<h1 align="center">List of Employee</h1>
	<table width="100%" cellpadding="10px" cellspacing="10px">
		<tr>
			<th>ID</th>
			<th>Title Name</th>
			<th>Author Name</th>
			<th>Edit</th>
			<th>Delete</th>
		</tr>

		<%
		ApplicationContext a= new ClassPathXmlApplicationContext("Beans.xml");
		StudentDao studentDao=a.getBean("studentDao",StudentDao.class);
		List<Student> list=studentDao.getAllStudent();
		for(Student s:list)
		{
		%>
		<tr>
			<td><%=s.getId()%></td>
			<td><%=s.getFname()%></td>
			<td><%=s.getLname()%></td>
			<td><%=s.getEmail() %></td>
			<td><%=s.getPassword() %></td>

			<td>
				<form name="edit" method="post" action="edit">
					<input type="hidden" name="id" value="<%=a.getId()%>"> <input
						type="submit" name="action" value="edit" class="btn btn-primary">
				</form>
			</td>
			<td>
				<form name="delete" method="post" action="de">
					<input type="hidden" name="id" value="<%=a.getId()%>"> <input
						type="submit" name="action" value="delete" class="btn btn-danger">
				</form>
			</td>
		</tr>
		<%


		}

%>

	</table>
	<a href="index.jsp">Register Author</a>
	
	
</body>
</html>