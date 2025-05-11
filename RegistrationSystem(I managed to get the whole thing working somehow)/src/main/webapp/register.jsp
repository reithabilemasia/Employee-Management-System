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
        .btn {
            background-color: rgb(173, 188, 230);
            color: Black;
            border-radius: 5px;
            border-style: none;
            padding: 5px;
            font-size: 30px;
        }
        .btn:hover {
            background-color: rgb(5, 31, 101);
            color: white;
        }
        .about {
            margin-top: 150px;
            margin-left: 100px;
            display: grid;
            grid-template-columns: repeat(2, 1fr);
            align-items: center;
            gap: 7rem;
        }
        .about-img img {
            height: 100%;
            width: 100%;
            border-radius: 8px;
        }
        form {
            width: 350px;
            background-color: white;
            border-radius: 5px;
            padding: 10px;
        }
        input[type="text"], input[type="email"], input[type="password"], input[type="tel"] {
            padding: 10px;
            margin-top: 5px;
            border-style: none;
            width: 100%;
            border-bottom: solid black;
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

    <header>
        <a href="index.jsp" class="logo">EMS</a>
    </header>

    <section class="about" id="about">
        <div class="about-img">
            <img src="Screenshot 2025-02-26 110529.png">
        </div>
        <div class="about-text">
            <form action="RegServlet" method="post">
                <h1 style="font-size: 30px;">Employee Registration</h1><br>

                <input type="text" id="fullName" name="fullName" placeholder="Full Name" required><br>
                <input type="text" id="department" name="empDepartment" placeholder="Department" required><br>
                <input type="text" id="role" name="role" placeholder="Role" required><br>
                <input type="password" id="password" name="empPassword" placeholder="Password" required><br>
                <input type="text" id="email" name="empEmail" placeholder="Email" required><br>
                <input type="tel" id="phone" name="empPhone" placeholder="Phone Number" required><br>

                <input type="submit" value="Register">
            </form>
        </div>
    </section>

</body>
</html>
