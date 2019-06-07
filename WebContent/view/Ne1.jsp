<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import="java.sql.*" %>
    
    
<%
	/* 한글 깨짐 방지 */
	request.setCharacterEncoding("UTF-8");

  // Read RDS connection information from the environment  
  String dbName = System.getProperty("EBDB");
  String userName = System.getProperty("HJS");
  String password = System.getProperty("googlerns7");
  String hostname = System.getProperty("aa1h12j2tg4nk6a.ci76um4jhgso.us-east-2.rds.amazonaws.com");
  String port = System.getProperty("1521");

  String jdbcUrl = "jdbc:oracle:thin:@//aa1h12j2tg4nk6a.ci76um4jhgso.us-east-2.rds.amazonaws.com:1521/EBDB?user=HJS&password=googlerns7";
  
  
  Connection conn = null;
  Statement setupStatement = null;
  Statement readStatement = null;
  ResultSet resultSet = null;
  
  // 데이터베이스에서 불러온 데이터를 저장 할 변수
  String title = "";
  String author = "";
  
  
  try {
	// 1. JDBC 드라이버 로딩
    System.out.println("Loading driver...");
	Class.forName("oracle.jdbc.driver.OracleDriver");
    System.out.println("Driver loaded!");
	// 2. Connection 객체 생성
	System.out.println("1111111111");
	//conn = DriverManager.getConnection("jdbc:oracle:thin:@//aa1h12j2tg4nk6a.ci76um4jhgso.us-east-2.rds.amazonaws.com:1521/EBDB?user=HJS&password=googlerns7");

  } catch (ClassNotFoundException e) {
    throw new RuntimeException("Cannot find the driver in the classpath!", e);
  }

  
  try {
	// 2. Connection 객체 생성
	System.out.println("1111111111");
	conn = DriverManager.getConnection("jdbc:oracle:thin:@//aa1h12j2tg4nk6a.ci76um4jhgso.us-east-2.rds.amazonaws.com:1521/EBDB", "HJS" , "googlerns7");
	
	System.out.println("2222222222");
	System.out.println("2222222222");
	// 3. Statement 객체 생성
    readStatement = conn.createStatement();
        
	// 4. SQL 문장을 실행하고 결과를 리턴 
	// stmt.excuteQuery(SQL) : select 
	// stmt.excuteUpdate(SQL) : insert, update, delete .. 
    resultSet = readStatement.executeQuery("SELECT * FROM book");
    
	// 5. ResultSet에 저장된 데이터 얻기 - 결과가 2개 이상 
	while (resultSet.next()) { 
		title = resultSet.getString("title"); 
		author = resultSet.getString("author"); 

	    out.println(resultSet.getString("id"));
	    out.println(title);
	    out.println(author);
	}


    resultSet.close();
    readStatement.close();
    conn.close();

  } catch (SQLException ex) {
    // Handle any errors
    System.out.println("SQLException: " + ex.getMessage());
    System.out.println("SQLState: " + ex.getSQLState());
    System.out.println("VendorError: " + ex.getErrorCode());
  } finally {
       System.out.println("Closing the connection.");
      if (conn != null) try { conn.close(); } catch (SQLException ignore) {}
  }
  

%>     
    
    
    
    
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body>

</body>
</html>