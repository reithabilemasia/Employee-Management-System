<%-- 
    Document   : login
    Created on : 03 Mar 2025, 17:49:05
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

        #menu-icon {
            font-size: 35px;
            color: var(--text-color);
            z-index: 10001;
            cursor: pointer;
            margin-left: 25px;
            display: none;
        }

        .home {
            position: fixed;
            height: 100vh;
            width: 100%;
            background-image: url('Screenshot 2025-02-26 110529.png');
            background-size: cover;
            align-items: center;
            justify-content: flex-start;
            display: flex;
            flex-direction: column;
            justify-content: center;
            align-items: center;
        }

        form {
            width: 350px;
            background-color: rgba(0, 0, 0, 0.25);
            border-radius: 5px;
            padding: 20px;
            text-align: center;
        }

        h1 {
            font-size: 30px;
        }

        label {
            display: block;
            margin-top: 10px;
            text-align: left;
        }

        input[type="text"], input[type="password"] {
            padding: 10px;
            margin-top: 5px;
            border: 1px solid #ccc;
            border-radius: 5px;
            width: 100%;
        }

        input[type="submit"] {
            margin-top: 20px;
            padding: 10px;
            border: none;
            border-radius: 5px;
            background-color: #007bff;
            color: #fff;
            cursor: pointer;
            transition: background-color 0.3s;
            width: 100%;
        }

        input[type="submit"]:hover {
            background-color: #0056b3;
        }
    </style>

</head>
<body>

    <!-- Header Design -->
    <header>
        <a href="index.jsp" class="logo">EMS</a>
        <div class="bx bx-menu" id="menu-icon"></div>
    </header>

    <section class="home" id="home">
        <div class="home-text">
            <form action="login" method="post">
    <h1>Employee Login</h1>
    
    <input type="text" id="empEmail" name="empEmail" placeholder="Employee Email" required>
    <br><br>
    
    <input type="password" id="empPassword" name="empPassword" placeholder="Password" required>
    <br><br>
    <input type="submit" value="Login">
</form>

        </div>
    </section>

</body>
</html>

