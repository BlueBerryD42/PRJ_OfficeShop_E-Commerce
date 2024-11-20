<%-- 
    Document   : loginBarComponent
    Created on : July 5, 2024, 4:21:13 PM
    Author     : ASUS
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<div class="wrap-header-cart js-panel-login">
    <div class="s-full js-hide-cart"></div>
    <c:choose>
        <c:when test="${not empty sessionScope.LOGIN_USER}">
            <!-- Logged in -->
            <div class="header-cart flex-col-l p-l-35 p-r-25">
                <div class="header-login-title flex-w flex-sb-m p-b-8">
                    <span class="mtext-103 cl2">
                        User
                    </span>
                    <div class="fs-35 lh-10 cl2 p-lr-5 pointer hov-cl1 trans-04 js-hide-cart">
                        <i class="zmdi zmdi-close"></i>
                    </div>
                </div>
                <h1 class="text-black">Welcome,</h1>
                <h1>
                    <span class="nametxt text-warning">${sessionScope.LOGIN_USER.fullName}</span>!
                </h1>
                <div class="dropdown-divider"></div>
                <div class="header-login-title pt-4" style="height: 400px;">
                    <span class="mtext-103 cl2 w-full">
                        <a class="dropdown-item p-0 pt-2 pb-2 ps-2" href="UserHomeController"><i class="bi bi-gear-fill"></i> Profile</a>
                    </span>
                    <span class="mtext-103 cl2 w-full">
                        <a class="dropdown-item p-0 pt-2 pb-2 ps-2 mt-3 mb-3" href="UserViewOrderController"><i class="bi bi-kanban"></i> Orders</a>
                    </span>
                    <span class="mtext-103 cl2 w-full">
                        <a class="dropdown-item p-0 pt-2 pb-2 ps-2" href="LogoutController"><i class="bi bi-box-arrow-right"></i> Logout</a>
                    </span>
                </div>
            </div>
        </c:when>
        <c:otherwise>
            <!-- UnLogin -->
            <div class="header-cart flex-col-l p-l-35 p-r-25">
                <div class="header-login-title flex-w flex-sb-m p-b-8">
                    <span class="mtext-103 cl2">
                        Login
                    </span>

                    <div class="fs-35 lh-10 cl2 p-lr-5 pointer hov-cl1 trans-04 js-hide-cart">
                        <i class="zmdi zmdi-close"></i>
                    </div>
                </div>

                <div class="header-login-content js-pscroll">
                    <!-- Unlog in -->
                    <form action="MainController" method="POST" class="w-100 p-l-10 p-r-30" onsubmit="return checkCaptcha()">
                        <div class="mb-3">
                            <label for="exampleDropdownFormEmail1" class="form-label">Email address</label>
                            <input name="email" type="email" class="form-control" id="exampleDropdownFormEmail1"
                                   placeholder="email@example.com">
                        </div>
                        <div class="mb-3">
                            <label for="exampleDropdownFormPassword1" class="form-label">Password</label>
                            <input name="password" type="password" class="form-control" id="exampleDropdownFormPassword1"
                                   placeholder="Password">
                        </div>
                        <div class="mb-3">
                            <input name="remember" value="true" type="checkbox" class="d-inline"> Remember me
                        </div>
                                    <div class="g-recaptcha" data-sitekey="6Lf_IAwqAAAAAHaHRi5WTCaNrwSWU3LvZJmn8wnc"></div>
                                    <div style="color:red" id="error"></div>
                        <button type="submit" class="btn btn-primary">Sign in</button>
                    </form>
                    <!-- Login Google Button -->
                    <div class="mt-3">
                        Or quickly sign in by
                        <a href="https://accounts.google.com/o/oauth2/auth?scope=email%20profile%20openid&redirect_uri=http://localhost:8080/Final/LoginGoogleController&response_type=code
                           &client_id=891138375259-l274o4b3tp4apoc86k4prbkrs6dtbgrq.apps.googleusercontent.com&approval_prompt=force"
                           class="btn btn-danger text-white ms-4"><i class="bi bi-google"></i> Google</a>
                    </div>

                    <div class="dropdown-divider"></div>
                    <a class="dropdown-item" href="RegistrationController">New around here? Sign up</a>
                    <a class="dropdown-item" href="#">Forgot password?</a>
                </div>
            </div>
        </c:otherwise>
    </c:choose>
</div>
<script type="text/javascript">
        function checkCaptcha() {
            var error = document.getElementById("error");
            var response = grecaptcha.getResponse();
            if (response.length === 0) {
                error.textContent = "Please verify that you are not a robot";
                return false; 
            } else {
                error.textContent = "";
                return true; 
            }
        }

   
    </script>
    <script src="https://www.google.com/recaptcha/api.js" async defer></script>