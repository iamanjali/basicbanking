<%-- 
    Document   : History
    Created on : Jan 18, 2021, 10:14:04 AM
    Author     : abc
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Transfer History</title>
        <style>
            th, td {
               padding: 15px;
               font-size:30px;
               font-family:arial;
            }
            
            #t01 {
                width: 100%;    
                background-color: #FFE4E1;
            }
            
            h1{
                font-size: 60px;
                font-family:verdana;
            }
            
           button {
            border: none;
            //color: white;
            padding: 15px 32px;
            text-align: center;
            text-decoration: none;
            display: inline-block;
            font-size: 20px;
            margin: 4px 2px;
            cursor: pointer;
            position: relative;
            top: 50%;
            left: 45%;
            font-family:verdana;
          }
            
           .button1 {
            background-color: royalblue; 
            color: white; 
            border: 2px solid #4CAF50;
            }

           .button1:hover {
           background-color: #4CAF50;
           color: white;
           }
           
           body {
               background-color:powderblue;
           }
        </style>
    </head>
    <body>
         <h1 align="center">Transfer History</h1>
         <table width="100%" cellspacing="0" border="1" bordercolor="black" id="t01">
            <tr>
                <th>Sender</th>
                <th>Receiver</th>
                <th>Amount</th>
            </tr>
            <%
                Connection con=null;
                Statement st;
                ResultSet rs;
                
                try{
                    Class.forName("com.mysql.jdbc.Driver");
                    
                    con = DriverManager.getConnection("jdbc:mysql://localhost:3306/banking?user=root");
                    st = con.createStatement();
                    rs = st.executeQuery("select * from banking.transfer");
                    while(rs.next()){
            %>    
            <tr>
                <td><%=rs.getString("name")%></td>
                <td><%=rs.getString("transfer")%></td>
                <td><%=rs.getInt("amount")%></td>
            </tr>
            <%
                    }
                    con.close();
                }
                catch(Exception e){
                    out.println(e);
                }
            %>
        </table><br>
        <a href="index.html"><button type="button" class="button1">Home</button></a>
        <br>
        <table  align="center">
            <tr><td>
                    <font color="black" size="4" face="Verdana, Geneva, sans-serif">
                    @ The Sparks Foundation
                    </font>
            </td></tr>
        </table>
    </body>
</html>
