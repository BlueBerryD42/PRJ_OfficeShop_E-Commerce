<%-- 
    Document   : about
    Created on : July 5, 2024, 4:21:13 PM
    Author     : ASUS
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

    <head>
        <meta charset="utf-8"/>
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
        <title>About us</title>
        <!-- Favicon -->
        <link rel="icon" type="image/x-icon" href="./images/favicon.png"/>
        <!-- Bootstrap icons-->
        <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.5.0/font/bootstrap-icons.css" rel="stylesheet" />
        <!-- Core theme CSS (includes Bootstrap)-->
        <link href="css/styles.css" rel="stylesheet" />
        <link href="css/my-styles.css" rel="stylesheet">
        <!--===============================================================================================-->
        <link rel="stylesheet" type="text/css" href="fonts/iconic/css/material-design-iconic-font.min.css">
        <!--===============================================================================================-->
        <link rel="stylesheet" type="text/css" href="vendor/animate/animate.css">
        <!--===============================================================================================-->
        <link rel="stylesheet" type="text/css" href="vendor/css-hamburgers/hamburgers.min.css">
        <!--===============================================================================================-->
        <link rel="stylesheet" type="text/css" href="vendor/animsition/css/animsition.min.css">
        <!--===============================================================================================-->
        <link rel="stylesheet" type="text/css" href="vendor/slick/slick.css">
        <!--===============================================================================================-->
        <link rel="stylesheet" type="text/css" href="css/util.css">
        <link rel="stylesheet" type="text/css" href="css/main.css">
    </head>

    <body class="animsition">
        <!-- Home Menu -->
        <%@include file="components/headerComponent.jsp" %>
        <!-- About -->
        <div class="bg-white">
            <div class="container py-3">
                <div class="row align-items-center">
                    <div class="col-lg-5 px-5 mx-auto"><img src="https://bootstrapious.com/i/snippets/sn-about/img-2.jpg" alt="" class="img-fluid mb-4 mb-lg-0"></div>
                    <div class="col-lg-6"><i class="fa fa-leaf fa-2x mb-3 text-primary"></i>
                        <h2 class="text-black"></h2>
                        <p class="font-italic text-muted mt-3 mb-4">OfficeSupply was founded in 2024 in Ho Chi Minh City. Our goal is to offer online customers a large product selection of top brand products, low discount prices, and top notch customer service. We strive every day to make sure we consistently hit these goals for our customers.

We're more than just office supplies! We are proud to be one of the largest online retailers of products for: schools, furniture, electronics, janitorial, cleaning, food service, restaurants, technology, industrial, safety, warehouse and human resources. Our knowledgable team is ready to answer your questions and complete your order. Whether you are buying for your office, business workspace, school, manufacturing facility, restaurant or your home, we want you to enjoy your shopping experience. We have continued to grow each year thanks to our loyal customers!</p><a href="#" class="btn btn-light px-5 rounded-pill shadow-sm"></a>
                    </div>
                </div>
                <div class="row align-items-center mb-5">
                    <div class="col-lg-6 order-2 order-lg-1"><i class="fa fa-bar-chart fa-2x mb-3 text-primary"></i>
                        <h2 class="text-black">Contact Office Supply Today</h2>
                        <p class="font-italic text-muted mt-3 mb-4">Whatever you need, we are at your service!</p>
                        <a href="https://hcmuni.fpt.edu.vn/" class="btn btn-light px-5 rounded-pill shadow-sm">Learn More</a>
                    </div>
                    <div class="col-lg-5 px-5 mx-auto order-1 order-lg-2"><iframe src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3918.605334621169!2d106.80785771483009!3d10.841484592277386!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x31752731176b07b1%3A0xb752b24b379bae5e!2sFPT%20University%20HCMC!5e0!3m2!1sen!2s!4v1646899026195!5m2!1sen!2s" width="400" height="300" style="border:0;" allowfullscreen="" loading="lazy"></iframe></div>
                </div>
            </div>
        </div>
        <div class="bg-light">
            <div class="container py-3">
                <div class="row mb-4">
                    <div class="col-lg-5">
                        <h2 class="display-4 text-black">Still need Help?</h2>
                        <p class="font-italic text-muted">Then that's a YOU problem :/.</p>
                    </div>
                </div>
                <div class="row text-center">
                    <!-- Team item-->
                    <div class="col-xl-3 col-sm-6 mb-5">
                        <div class="bg-white rounded shadow-sm py-5 px-4"><img src="https://scontent.fsgn8-4.fna.fbcdn.net/v/t39.30808-1/308581596_760370421934428_2316027501676036736_n.jpg?stp=dst-jpg_p200x200&_nc_cat=100&ccb=1-7&_nc_sid=0ecb9b&_nc_eui2=AeGveUzyoj178__savcrHZwfyM8BlosCSCzIzwGWiwJILNfbDeuHvMnA3_WkCcKuqvsNU4Wqgaz_d59DZqfqeurq&_nc_ohc=NZL3h91GlLoQ7kNvgHXI53d&_nc_ht=scontent.fsgn8-4.fna&oh=00_AYD2LkPW_RWIQwojsCtkmHG7RdF91PgJiBrwja5hJjJPsA&oe=66938FB3" alt="" width="150" class="img-fluid rounded-circle mb-3 img-thumbnail shadow-sm">
                            <h5 class="mb-0 text-black">Nguyen Anh Quan</h5><span class="small text-uppercase text-muted">Blub - blub</span>
                            <ul class="social mb-0 list-inline mt-3">
                                <li class="list-inline-item"><a href="https://www.facebook.com/jonhwick.bertha/" class="social-link"><i class="bi bi-facebook"></i></a></li>
                                <li class="list-inline-item"><a href="#" class="social-link"><i class="bi bi-github"></i></a></li>
                                <li class="list-inline-item"><a href="#" class="social-link"><i class="bi bi-instagram"></i></a></li>
                            </ul>
                        </div>
                    </div>
                    <!-- End-->
                </div>
            </div>
        </div>
        <!-- Subscribe News Letter -->
        <%@include file="components/subscribeNewsLetterComponent.jsp" %>
        <!-- Footer -->
        <%@include file="components/footerComponent.jsp" %>
        <!-- Bootstrap core JS -->
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
        <!-- Jquery -->
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
        <!-- Toast Alert script -->
        <script src="js/toast-alert.js"></script>
        <script src="js/subscribe-newsletter.js"></script>
        <!-- Home Slider JS -->
        <script src="vendor/slick/slick.min.js"></script>
        <script src="js/slick-custom.js"></script>
        <!--===============================================================================================-->
        <script src="vendor/animsition/js/animsition.min.js"></script>
        <!--===============================================================================================-->
        <script src="vendor/perfect-scrollbar/perfect-scrollbar.min.js"></script>
        <script>
                                                    $('.js-pscroll').each(function () {
                                                        $(this).css('position', 'relative');
                                                        $(this).css('overflow', 'hidden');
                                                        var ps = new PerfectScrollbar(this, {
                                                            wheelSpeed: 1,
                                                            scrollingThreshold: 1000,
                                                            wheelPropagation: false,
                                                        });

                                                        $(window).on('resize', function () {
                                                            ps.update();
                                                        })
                                                    });
        </script>
        <!-- Main -->
        <script src="js/main.js"></script>
    </body>
</html>

