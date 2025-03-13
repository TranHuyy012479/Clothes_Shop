<%-- 
    Document   : index
    Created on : Oct 17, 2024, 8:30:43 PM
    Author     : tranh
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="en">

    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css">
        <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/view/assets/css/login_style.css">
        <title>Login</title>
    </head>

    <body>

        <div class="container" id="container">

            <div class="form-container sign-up">
                <form action="register" method="post">
                    <h1>Create Account</h1>
                    <div class="social-icons">
                        <a href="https://accounts.google.com/o/oauth2/auth?scope=email profile openid
                           &redirect_uri=http://localhost:9999/assignmentPRJ301/logingoogle
                           &response_type=code
                           &client_id=424559642998-j5karejb29komm1f3cufvbvac7c87pot.apps.googleusercontent.com
                           &approval_prompt=force" 
                           class="icon"><i class="fa-brands fa-google-plus-g"></i></a>
                        <a href="#" class="icon"><i class="fa-brands fa-facebook-f"></i></a>
                        <a href="#" class="icon"><i class="fa-brands fa-github"></i></a>
                        <a href="#" class="icon"><i class="fa-brands fa-linkedin-in"></i></a>
                    </div>
                    <span>or use your information for registeration</span>
                    <input type="text" placeholder="Username" name="username" >
                    <input type="password" placeholder="Password" name="password" >
                    <h3 style="color: red; font-size: 12px" >${requestScope.error}</h3>
                    <button>Sign Up</button>
                </form>
                
            </div>

            <div class="form-container sign-in">
                
                <form action="login" method="post">
                    <h1>Sign In</h1>
                    <div class="social-icons">
                        <a href="https://accounts.google.com/o/oauth2/auth?scope=email profile openid&redirect_uri=http://localhost:9999/assignmentPRJ301/logingoogle&response_type=code&client_id=424559642998-j5karejb29komm1f3cufvbvac7c87pot.apps.googleusercontent.com&approval_prompt=force" 
                           class="icon"><i class="fa-brands fa-google-plus-g"></i></a>
                        <a href="#" class="icon"><i class="fa-brands fa-facebook-f"></i></a>
                        <a href="#" class="icon"><i class="fa-brands fa-github"></i></a>
                        <a href="#" class="icon"><i class="fa-brands fa-linkedin-in"></i></a>
                    </div>
                    <span>or use your username password</span>
                    <input type="text" placeholder="Username" name="username" value="${cookie.login.value}">
                    <input type="password" placeholder="Password" name="password" value="${cookie.password.value}">
                    <h3 style="color: red; font-size: 12px" >${requestScope.error}</h3>
                    <input style="font-size: 12px" type="checkbox" name="remember" value="yes">Remember me
                    <a href="#">Forget Your Password?</a>
                    <button>Sign In</button>
                </form>
            </div>
            
            
            
            <div class="toggle-container">
                <div class="toggle">
                    <div class="toggle-panel toggle-left">
                        <h1>Welcome Back!</h1>
                        <p>Enter your personal details to use all of site features</p>
                        <button class="hidden" id="login">Sign In</button>
                    </div>
                    <div class="toggle-panel toggle-right">
                        <h1>Hello, Friend!</h1>
                        <p>Register with your personal details to use all of site features</p>
                        <button class="hidden" id="register">Sign Up</button>
                    </div>
                </div>
            </div>
        </div>

        <script>
            const container = document.getElementById('container');
            const registerBtn = document.getElementById('register');
            const loginBtn = document.getElementById('login');

            registerBtn.addEventListener('click', () => {
                container.classList.add("active");
            });

            loginBtn.addEventListener('click', () => {
                container.classList.remove("active");
            });
        </script>
    </body>

</html>
