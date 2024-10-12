<%-- 
    Document   : checkout
    Created on : 2 Sept 2024, 12:50:33 pm
    Author     : Rushikesh
--%>

<%
    User user =(User) session.getAttribute("current-user");
    
    if(user == null){
       session.setAttribute("message", "you are not loggend in !!! please try again");
       response.sendRedirect("login.jsp");
       return;
    }    

%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        
        <%@include file="component/common_css_js.jsp" %>

    </head>
    <body>
        
        <%@include file="component/navbar.jsp" %>

        <div class="container">
            <div class="row">
                
                <div class="col-md-6">
                    <!--card-->
                    <div class="card">
                        <div class="card-body">
                            <h3>Your Selected Items</h3>
                            <div class="cart-body">
                                
                            </div>
                            
                        </div>
                        
                    </div>
                </div>
                
                
                <div class="col-md-6">
                    <!--form details-->
                    <div class="card">
                        <div class="card-body">
                            <h3>Your details for order</h3>
                            
                            <form action="#!">
                                <div class="mb-3">
                                <label for="username" class="form-label">Username</label>
                                <input value="<%= user.getUserName() %>" name="user_name" type="text" class="form-control" id="username" required>
                            </div>
                                
                            <div class="mb-3">
                                <label for="email" class="form-label">Email</label>
                                <input value="<%= user.getUserEmail() %>" name="user_email" type="email" class="form-control" id="email" required>
                            </div>
                            
                            <div class="mb-3">
                                <label for="phone" class="form-label">Phone Number</label>
                                <input value="<%= user.getUserPhone() %>" name="user_phone" type="tel" class="form-control" id="phone" required>
                            </div>
                                
                            <div class="mb-3">
                                <label for="address" class="form-label">Address</label>
                                <textarea value="<%= user.getUserAddress() %>" name="user_address" class="form-control" id="address"  rows="3" required></textarea>
                            </div>
                                
<!--                            <div class="container text-center">
                                <button class="btn btn-outline-success"><a href="#!">Order Now</a></button> 
                                <button class="btn btn-outline-primary"><a href="index.jsp">Continue Shopping</a></button>
                            </div>-->
                            
                            <div class="container text-center">
    <button type="submit" class="btn btn-outline-success">Order Now</button>
    <button class="btn btn-outline-primary"><a href="index.jsp" style="text-decoration:none; color:inherit;">Continue Shopping</a></button>
</div>

                                
                            </form>
                        </div>
                    </div>
                </div>
                
            </div>
        </div>
        
        <%@include file="component/common_modals.jsp" %>
    </body>
</html>
