<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="vn">

    <head>
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css"
              integrity="sha384-9aIt2nRpC12Uk9gS9baDl411NQApFmC26EwAOH8WgZl5MYYxFfc+NcPb1dKGj7Sk" crossorigin="anonymous">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.2/css/all.min.css"
              integrity="sha512-SnH5WK+bZxgPHs44uWIX+LLJAJ9/2PkPKZ5QiAj6Ta86w+fsb2TkcmfRyVX3pBnMFcV7oQPJkl9QevSCWr3W6A=="
              crossorigin="anonymous" referrerpolicy="no-referrer" />
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js"
                integrity="sha384-OgVRvuATP1z7JjHLkuOU7Xw704+h835Lr+6QL9UvYjZE3Ipu6Tp75j7Bh/kR0JKI"
        crossorigin="anonymous"></script>
        <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"
                integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj"
        crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js"
                integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo"
        crossorigin="anonymous"></script>
        <script src="https://kit.fontawesome.com/yourcode.js" crossorigin="anonymous"></script>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <meta name="description" content="">
        <link rel="stylesheet" type="text/css" href="view/assets/user-UI/CSS/style-login.css">
       
        <title>Login page</title>
    </head>

    <body>
        <main class="container">
            <div class="form">
                <h2>Login</h2>
                <form action="${pageContext.request.contextPath}/login" method="POST">
                     <% String msg = (String) request.getAttribute("msg"); %>
                            <% if (msg != null) {%>
                            <p style="color: red">  <%= msg%> </p>
                            <% }%>
                    <input type="text" name="email" placeholder="Your Email or username" required>
                    <input type="password" name="password" placeholder="Your Password" required>
                    <input type="submit" value="Login">
                    <a href="#">Forgot Password?</a>
                </form>
                <div> <a class="btn btn-outline-dark" href="https://accounts.google.com/o/oauth2/auth?scope=profile&redirect_uri=http://localhost:9999/Clothes-Online-Shop/login&response_type=code
                    &client_id=441705807148-2ki6n66ta23tnbe2acvstttktb0i95n0.apps.googleusercontent.com&approval_prompt=force" role="button" style="text-transform:none">
                    <img width="20px" style="margin-bottom:3px; margin-right:5px" alt="Google sign-in" src="https://img.icons8.com/?size=100&id=17949&format=png&color=000000" />
                    Login with Google
                  </a></div>
            </div>

            <div class="form">
                <h2>New member</h2>
                <form action="RegisterController" method="POST">
                    <% String msgRegister = (String) request.getAttribute("msgRegister"); %>
                            <% if (msgRegister != null) {%>
                            <p style="color: red"> <%= msgRegister%> </p>
                            <% }%>
                    <input type="text"  name="firstName" placeholder="First Name" required>
                    <input type="text" name="lastName" placeholder="Last Name" required>
                    <input type="text" name="userName" placeholder="User Name" required>
                    <input type="email" name="email" placeholder="Email" required>
                    <input type="text" name="phoneNumber" placeholder="Phone Number" required>
                    <input type="text" name="address" placeholder="Address" required>
                    <input type="password" name="password" placeholder="Password" required>
                    <input type="submit" value="Register">
                </form>
            </div>
        </main>
    </body>
</html>