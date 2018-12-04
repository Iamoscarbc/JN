<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"
    import="org.json.JSONObject,org.json.JSONException,java.util.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<h2>JSON in JSP</h2>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body bgcolor="pink">
<%
    JSONObject object = new JSONObject();
 
    object.put("name", "Deepa");
    object.put("Reg No", new Integer(12345));
    object.put("Mark", new Double(99));
    object.put("mail", "deepa@ebullitent.com");
    object.put("City", "Chennai");
 
    int length = object.length();
    String opt = object.optString("name");
    boolean data = object.isNull("name");
    String getMark = object.getString("Mark");
    String getCity = (String) object.get("City");
    boolean mail = object.has("mail");
    //object.append("mark1","98");
%>
<%
    out.println(object);
%>
<br />
<%
    out.println("length: " + length);
%>
<br />
<%
    out.println("Name: " + opt);
%>
<br />
<%
    out.println("Is Null: " + data);
%>
<br />
 
<%
    out.println("city: " + getCity);
%>
<br />
<%
    out.println("has mail: " + mail);
%>
<br />
<%
    out.println("Mark:" + getMark);
%>
<br />
<%
    out.println("List of keys:");
%>
<br />
<%
    out.println("--------------");
%>
<br />
 
<%
    Iterator i = object.keys();
    while (i.hasNext()) {
        out.println(i.next());
    }
    object.toString();
%>
<br />
</body>
</html>