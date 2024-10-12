<%@page import="com.ecommerce.helper.Helper"%>
<%@page import="com.ecommerce.entities.Category"%>
<%@page import="com.ecommerce.dao.CategoryDao"%>
<%@page import="com.ecommerce.entities.Product"%>
<%@page import="java.util.List"%>
<%@page import="com.ecommerce.dao.ProductDao"%>
<%@page import="org.hibernate.SessionFactory"%>
<%@page import="com.ecommerce.helper.FactoryProvider"%>
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

    <div class="row mt-3 mx-2">
        <%
            String cat = request.getParameter("category");
            ProductDao pdao = new ProductDao(FactoryProvider.getFactory());
            List<Product> plist = null;

            if(cat == null || cat.trim().equals("all")) {
                plist = pdao.getAllData();
            } else {
                try {
                    int cid = Integer.parseInt(cat.trim());
                    plist = pdao.getAllDataById(cid);
                } catch (NumberFormatException e) {
                    plist = pdao.getAllData(); // Fallback to fetching all products
                }
            }

            CategoryDao cdao = new CategoryDao(FactoryProvider.getFactory());
            List<Category> clist = cdao.getCategoriesList();
            

        %>

        <!-- Show categories -->
        <div class="col-md-2">
            <a href="index.jsp?category=all" class="list-group-item list-group-item-action-active  text-blue">All Products</a>
            <% for (Category c : clist) { %>
                <a href="index.jsp?category=<%=c.getcId() %>" class="list-group-item list-group-item-action"><%=c.getcName()%></a>
            <% } %>
        </div>

        <!-- Show products in columns -->
        <div class="col-md-10">
            
<!--            <h1>Number of products is <%= plist.size() %></h1>-->
            
            
            <div class="row">
                <% for (Product p : plist) { %> 
                    <div class="col-md-4 mb-4">
                        <div class="card h-100">
                            <!--fetch image from database and display in index page-->
                            <div class="container text-center">
                               <img src="images/productImages/<%= p.getpPhoto() %>" style="max-height: 250px; max-width: 250px; "  class="card-img-top" alt="Product Image">
                            </div>
                            
                            <div class="card-body">
    <h5 class="card-title"><%= p.getpName() %></h5>
    <p class="card-text"><%= Helper.get10Words(p.getpDescription()) %></p>
    <p class="card-text">
        <small class="text-muted">
            Price: ₹ <strong><%= p.getPriceAfterCalculatingDiscount() %></strong>
            <del>₹ <%= p.getpPrice() %></del> 
            <span>(<%= p.getpDiscount() %>% off)</span>
        </small>
    </p>
</div>

                            <div class="card-footer">
                                <button class="btn btn-primary" onclick="add_to_cart(<%= p.getpId() %> ,'<%=p.getpName() %>', <%= p.getPriceAfterCalculatingDiscount() %>)">Add to Cart</button>
                            </div>
                        </div>
                    </div>
                <% } %>
            </div>
        </div>
    </div>
            
        <%@include file="component/common_modals.jsp" %>
</body>
</html>
