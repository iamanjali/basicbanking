<%--
    Document   : Transfer1
    Created on : Jan 8, 2021, 6:02:59 PM
    Author     : abc
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.io.*"%>
<%@page import="javax.servlet.*"%>
<%@page import="javax.servlet.http.*"%>
<%@page import="java.sql.*"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Transfer</title>
        <style>
             h1{
                font-size: 50px;
                font-family:verdana;
            }
            
            body {
               background-color:powderblue;
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
            left: 40%;
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
        </style>
    </head>
    <body>
        <table>
            <br>
            <%    
        
        String name;
        int amount, account, taccount;
        int count = 0;
        
        name=request.getParameter("nm");
        String amt1=request.getParameter("amt");
        amount=Integer.parseInt(amt1);
        String acc1=request.getParameter("acc");
        account=Integer.parseInt(acc1);
        String tacc1=request.getParameter("tacc");
        taccount=Integer.parseInt(tacc1);
        Connection con=null;
        Statement st1,st2;
        ResultSet rs1,rs2;
        try{
            String sql1 = "select * from banking.customer where accountno=?";
            Class.forName("com.mysql.jdbc.Driver");
                    
            con = DriverManager.getConnection("jdbc:mysql://localhost:3306/banking?user=root");
            st1 = con.createStatement();
            PreparedStatement ps1 = con.prepareStatement(sql1);
            ps1.setInt(1,taccount);
            rs1 = ps1.executeQuery();
         
            String sql2 = "select * from banking.customer where accountno=?";
            st2 = con.createStatement();
            PreparedStatement ps2 = con.prepareStatement(sql2);
            ps2.setInt(1,account);
            rs2 = ps2.executeQuery();
         
            if(rs1.next()){
                if(rs2.next()){
                int account1=rs1.getInt("accountno");
                int account2=rs2.getInt("accountno");
                
                String rec=rs1.getString("name");
                
                if(account1==taccount && account2==account){
                    int balance = rs1.getInt("balance");
                    int balance1 = rs2.getInt("balance");
                    
                     balance += amount;
                     PreparedStatement ps12=con.prepareStatement("update banking.customer set balance=? where accountno='"+taccount+"'");
	             ps12.setInt(1,balance);
	             ps12.executeUpdate();
                   
                     balance1 -= amount;
                     PreparedStatement ps22=con.prepareStatement("update banking.customer set balance=? where accountno='"+account+"'");
	             ps22.setInt(1,balance1);
	             ps22.executeUpdate();  
                     count=1;
                    
                     String sql3 = "insert into banking.transfer (name, transfer, amount) values (?, ?, ?)";
                     PreparedStatement ps3 = con.prepareStatement(sql3);
                     ps3.setString(1,name);
                     ps3.setString(2,rec);
                     ps3.setInt(3,amount);
                     ps3.executeUpdate();
                   
                }
               }
           }
            else{
                %>
           <h1>Your Information is Incorrect.</h1>
           <h1>Please Fill the Information again.</h1>
           <%
            }
            
            if(count==1){
                %>
           
           <h1 align="center">Amount is Transfered.</h1>
           <%   
            }
            else{
                  %>
           <br>
           <h1>Amount is not Transfered. Try again.</h1>
           <%
            }
             con.close();
            %>
            <a href="index.html"><button type="button" class="button button1">Home</button></a>
            <a href="History.jsp"><button type="button" class="button button1">View History</button></a>
           <%
             
         }
         catch(Exception e){
             out.println(e);
         }
            %>
        </table>
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
