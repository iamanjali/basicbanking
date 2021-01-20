<%-- 
    Document   : Transfer
    Created on : Jan 8, 2021, 12:59:39 PM
    Author     : abc
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Transfer Form</title>
        <style>
            h1{
                font-size: 60px;
                font-family:verdana;
            }
            
            body {
               background-color:powderblue;
            }
            
            .trans{
                border-radius: 5px;
                background-color: #f2f2f2;
                padding: 20px;
            }
            
            input[type=text] {
                width: 35%;
                padding: 12px 20px;
                margin: 8px 0;
                display: inline-block;
                border: 1px solid #ccc;
                border-radius: 4px;
                box-sizing: border-box;
            }

            input[type=submit]{
                width: 10%;
                background-color: #4CAF50;
                color: white;
                padding: 14px 20px;
                margin: 8px 0;
                border: none;
                border-radius: 10px;
                cursor: pointer;
            }

            input[type=submit]:hover{
                background-color: #45a049;
            }
            
            label {
                width: 200px;
                display: inline-block;
                text-align: left;
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
        <h1 align="center">Transfer Money</h1>
        <section id="money">
            <div align="center" class="trans">
                <form name="frm" method="post" action="Transfer1.jsp">
                     <label for="nm"><strong>Name :</strong></label>
                     <input type="text" id="name" name="nm" placeholder="Sender's name here..."><br>
                     <label for="acc"><strong>Account Number :</strong></label> 
                     <input type="text" id="account" name="acc" placeholder="Sender's account number here..."><br>
                     <label for="tacc"><strong>Target Account Number :</strong></label> 
                     <input type="text" id="taccount" name="tacc" placeholder="Target account number here..."><br>
                     <label for="amt"><strong>Amount :</strong></label> 
                     <input type="text" id="amount" name="amt" placeholder="Amount to be trasfered..."><br>
                     <input type="submit" value="Transfer" onclick="alert('Transfering..\nClick on OK to continue') ">
                </form>
            </div>
        </section>
        <br>
        <a href="index.html"><button type="button" class="button1">Home</button></a>
        <a href="History.jsp"><button type="button" class="button1">View History</button></a>
        <br><br>
        <table  align="center">
            <tr><td>
                    <font color="black" size="4" face="Verdana, Geneva, sans-serif">
                    @ The Sparks Foundation
                    </font>
            </td></tr>
        </table>
    </body>
</html>
