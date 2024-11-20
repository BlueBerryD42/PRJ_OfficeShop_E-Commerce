<%-- 
    Document   : login
    Created on : July 5, 2024, 5:42:56 PM
    Author     : ASUS
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

    <head>
        <meta charset="utf-8"/>
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
        <meta name="description" content=""/>
        <meta name="author" content=""/>
        <title>Login</title>
        <!-- Favicon -->
        <link rel="icon" type="image/x-icon" href="./images/favicon.png"/>
        <!-- Bootstrap icons-->
        <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.5.0/font/bootstrap-icons.css" rel="stylesheet" />
        <!-- Core theme CSS (includes Bootstrap)-->
        <link href="css/styles.css" rel="stylesheet" />
        <link href="css/my-styles.css" rel="stylesheet">
    </head>

    <body>
        <!-- Contact Head -->
        <%@include file="components/contactHeadComponent.jsp" %>
        <!-- Navigation -->
        <%@include file="components/loginHeaderComponent.jsp" %>
        <!-- Login Session -->
        <section class="vh-100" style="background-color: #9A616D;">
            <div class="container py-5 h-100">
                <div class="row d-flex justify-content-center align-items-center h-100">
                    <div class="col col-xl-10">
                        <div class="card" style="border-radius: 1rem;">
                            <div class="row g-0">
                                <div class="col-md-6 col-lg-5 d-none d-md-block">
                                    <img
                                        src="https://img.freepik.com/premium-vector/hand-drawn-cartoon-woman-office-worker-with-office-supplies_6997-3961.jpg?w=900"
                                        alt="login form"
                                        class="img-fluid" style="border-radius: 1rem 0 0 1rem;"
                                        />
                                </div>
                                <div class="col-md-6 col-lg-7 d-flex align-items-center">
                                    <div class="card-body p-4 p-lg-5 text-black">
                                        <form action="LoginController" method="POST" onsubmit="return checkCaptcha()">
                                            <div class="d-flex align-items-center mb-3 pb-1 default-cursor">
                                                <i class="bi bi-flower1 fa-2x fa-cubes me-3" style="color: #ff6219;"></i>
                                                <span class="h1 fw-bold mb-0">Office Supply Shop</span>
                                            </div>
                                            <h5 class="fw-normal pb-3 default-cursor" style="letter-spacing: 1px;">Sign into your account</h5>
                                            <c:if test="${not empty requestScope.ERROR_MASSEGE}">
                                                <!-- Error MSG -->
                                                <div class="alert alert-danger" role="alert">
                                                    ${requestScope.ERROR_MASSEGE}
                                                </div>
                                            </c:if>
                                            <c:if test="${not empty requestScope.MSG_SUCCESS}">
                                                <!-- Error MSG -->
                                                <div class="alert alert-success" role="alert">
                                                    ${requestScope.MSG_SUCCESS}
                                                </div>
                                            </c:if>
                                            <div class="form-outline mb-2">
                                                <label class="form-label" for="form2Example17">Email address</label>
                                                <input type="email" id="form2Example17" class="form-control form-control-lg" name="email" value="${requestScope.email}" required placeholder="example@gmail.com"/>
                                            </div>
                                            <div class="form-outline mb-2">
                                                <label class="form-label" for="form2Example27">Password</label>
                                                <input type="password" id="form2Example27" class="form-control form-control-lg" name="password" required placeholder="password"/>
                                            </div>
                                            <div class="g-recaptcha" data-sitekey="6LevpQwqAAAAALyDJ5C4wXkL6p40tH7nU16ZSCa0"></div>
                                            <div style="color:red" id="error"></div>

                                            <!-- Checkbox -->
                                            <div class="form-check d-flex justify-content-start mb-4">
                                                <input class="form-check-input me-2" type="checkbox" name="remember" value="true" id="form1Example3"/>
                                                <label class="form-check-label" for="form1Example3"> Remember me </label>
                                            </div>
                                            
                                            <div class="pt-1 mb-4">
                                                <button class="btn btn-dark btn-lg btn-block" type="submit">Login</button>
                                            </div>

                                            <p class="mb-3 pb-lg-2" style="color: #393f81;">
                                                Don't have an account?
                                                <c:url var="regisLink" value="RegistrationController"></c:url>
                                                <a href="${regisLink}" style="color: #393f81;">Register here</a>
                                            </p>
                                            <p class="mb-3 pb-lg-2" style="color: #393f81;">
                                                Or quickly sign in by
                                            <a href="https://accounts.google.com/o/oauth2/auth?scope=email%20profile%20openid&redirect_uri=http://localhost:8080/Final/LoginGoogleController&response_type=code
                           &client_id=891138375259-l274o4b3tp4apoc86k4prbkrs6dtbgrq.apps.googleusercontent.com&approval_prompt=force"
                           class="btn btn-danger text-white ms-4"><i class="bi bi-google"></i> Google</a>
                                            </p>
                                        </form>

                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </section>
        <!-- Footer -->
        <%@include file="components/footerComponent.jsp" %>
        <!-- Bootstrap core JS -->
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
        <!-- Core theme JS -->
        <script src="js/scripts.js"></script>
        <script src="https://www.google.com/recaptcha/api.js" async defer></script>
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
    </body>

</html>




