<%-- 
    Document   : subcribeNewsLetterComponent
    Created on : July 5, 2024, 4:21:13 PM
    Author     : ASUS
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<c:if test="${empty sessionScope.LOGIN_USER}">
    <div class="subcribe-receive-email text-black">
        <div class="layer">
            <div class="container">
                <form id="form-subscribe" class="text-center pt-5 pb-5" onsubmit="return false">
                    <div class="text-uppercase title default-cursor">Subcribe to our Newsletter</div>
                    <div class="mt-4 mb-4 label default-cursor">Get e-mail updates to receive coupons or new update</div>
                    <div class="mb-3">
                        <input id="emailSubscribe" name="email" type="email" placeholder="Enter your email..." value="" required/>
                    </div>
                    <button onclick="subscribeNewsLetter()" id="subscribeEmail" class="btn-subs" type="submit" value="subscribeEmail" >Subscribe</button>
                </form>
            </div>
        </div>
    </div>
</c:if>