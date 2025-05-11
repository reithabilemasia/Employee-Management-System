<%-- 
    Document   : index
    Created on : 03 Mar 2025, 17:41:25
    Author     : reith
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>PRG361 Project</title>

    <style>
        * {
            padding: 0;
            margin: 0;
            box-sizing: border-box;
            font-family: 'Poppins', sans-serif;
            text-decoration: none;
            list-style: none;
            scroll-behavior: smooth;
            transition: all ease .55s;
        }
        
        body {
            background-color: white;
            color: black;
        }
        
        header {
            position: fixed;
            width: 100%;
            top: 0;
            right: 0;
            z-index: 1000;
            display: flex;
            align-items: center;
            justify-content: space-between;
            background: transparent;
            padding: 22px 15%;
            border-bottom: 1px solid transparent;
            transition: all 0.45s ease;
        }
        
        .logo {
            color: rgb(173, 188, 230);
            font-size: 35px;
            font-weight: 700;
            letter-spacing: 1px;
        }
        
        .navlist {
            display: flex;
        }
        
        .navlist a {
            color: black;
            font-size: 17px;
            font-weight: 500;
            margin: 0 25px;
            transition: all 0.45s ease;
        }
        
        .navlist a:hover {
            color: rgb(173, 188, 230);
        }
        
        .navlist a.active {
            color: rgb(173, 188, 230);
        }
        
        #menu-icon {
            font-size: 35px;
            color: var(--text-color);
            z-index: 10001;
            cursor: pointer;
            margin-left: 25px;
            display: none;
        }
    </style>

</head>
<body>
  
    <header>
        <a href="" class="logo">EMS</a>

        <ul class="navlist">
            <li><a href="login.jsp">Login</a></li> |
            <li><a href="register.jsp">Register</a></li>
        </ul>

        <div class="bx bx-menu" id="menu-icon"></div>
    </header>

    <center><img src="Screenshot 2025-02-26 110529.png" alt=""></center>

</body>
</html>
