<%@page import="com.ecommerce.dao.ProductDao"%>
<%@page import="com.ecommerce.dao.UserDao"%>
<%@page import="com.ecommerce.entities.Category"%>
<%@page import="java.util.List"%>
<%@page import="com.ecommerce.helper.FactoryProvider"%>
<%@page import="com.ecommerce.dao.CategoryDao"%>
<%@page import="com.ecommerce.entities.User"%>
<%
    User user =(User) session.getAttribute("current-user");
    
    UserDao userdao = new UserDao(FactoryProvider.getFactory());
    long usercount = userdao.getUserCount();
    
    
    ProductDao pdao = new ProductDao(FactoryProvider.getFactory());
    long productcount = pdao.getProductCount();
    
    CategoryDao cdao = new CategoryDao(FactoryProvider.getFactory());
    long categorycount = cdao.getCategoriesCount();
    
    if(user == null){
       session.setAttribute("message", "you are not loggend in !!! please try again");
       response.sendRedirect("login.jsp");
       return;
    }else{
    
         if(user.getUserType().equals("normal")){
         session.setAttribute("message", "You are not access this page because you are not admin");
         response.sendRedirect("login.jsp");
         return;
    }
    }
 




%>
    
    
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Admin page</title>
        
        <%@include file="component/common_css_js.jsp" %>
        
       <style>
            
            .admin .card{                
    border: 1px solid #673ab7;
}
.admin .card:hover {
    background-color: #e2e2e2 !important;
    cursor: pointer;
}

        </style>
        
    </head>
    <body>
        
        <%@include file="component/navbar.jsp" %>
        
        <div class="container admin">
            
            <%@include file="component/message.jsp" %>

            <div class="row mt-2">
                
                <div class="col-md-4">
                     <div class="card text-center">
                         <div class="card-body">
                             <div class="container">
                                 <img style="max-width: 125px" src="images/teamwork.png" alt="users_icon"/>
                             </div>
                             <h1><%= usercount %> </h1>
                             <h2>Users</h2>
                         </div>                         
                     </div>
                     
                </div>
                
                
                <!-- this is second box -->
                 <div class="col-md-4">
                     <div class="card text-center">
                         <div class="card-body">
                             <div class="container">
                                 <img style="max-width: 125px" src="images/category.png" alt="users_icon"/>
                             </div>
                             <h1><%= categorycount %> </h1>
                             <h2>Categories</h2>
                         </div>                         
                     </div>
                     
                </div>
                
                
                <!-- this is third box -->
                 <div class="col-md-4">
                     <div class="card text-center">
                         <div class="card-body">
                             <div class="container">
                                 <img style="max-width: 125px" src="images/products.png" alt="users_icon"/>
                             </div>
                             <h1><%= productcount %> </h1>
                             <h2>Products</h2>
                         </div>                         
                     </div>
                     
                </div>
                
            </div>
            
            
            <!-- create annother row in same container -->
            
            <div class="row mt-2">
                
                <!-- this is fourth box -->
                 <div class="col-md-6" data-bs-toggle="modal" data-bs-target="#add-category"> 
                     <div class="card text-center">
                         <div class="card-body">
                             <div class="container">
                                 <img style="max-width: 125px" src="images/calculator.png" alt="users_icon"/>
                             </div>
                             <h1>123</h1>
                             <h2>Add Categories</h2>
                         </div>                         
                     </div>
                     
                </div>
                
                
                <!-- this is fifth box -->
                 <div class="col-md-6"data-bs-toggle="modal" data-bs-target="#add-product"> 
                     <div class="card text-center">
                         <div class="card-body">
                             <div class="container">
                                 <img style="max-width: 125px" src="images/plus.png" alt="users_icon"/>
                             </div>
                             <h1>123</h1>
                             <h2>Add Produts</h2>
                         </div>                         
                     </div>
                     
                </div>
                
            </div>
                        
        </div>
            
        
        <!--start of category modal--> 
        
        
<!-- Category Modal -->
<div class="modal fade" id="add-category" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLabel">Add Catergory Details</h5>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
      <div class="modal-body">
        
          <form action="ProductOperationServlet" method="post">
              
             <input type="hidden" name="operation" value="addCategory">
              
              <div class="form-group">
              <input class="form-control" type="text" name="categoryTitle" placeholder="Enter Category Title" required>
              </div>
        
              <div class="form-group mt-2">
               <textarea style="height: 150px;" class="form-control" name="categoryDescription" placeholder="Enter Category Description" required></textarea>
              </div>
              
          
          
        
          
          <div class="container text-center mt-2">
              <button class="btn btn-primary">Add Category</button>
              <button class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
          </div>
             
             </form>
          
      </div>
        
    </div>
  </div>
</div>
        
        
        <!--end of category modal-->
        
        
        
        
        
        <!--start of product modal-->
        
        
        <!--*************************************************-->
        
<!-- product Modal -->
<div class="modal fade" id="add-product" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLabel">Add Product Details</h5>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
      <div class="modal-body">
        
          <form action="ProductOperationServlet" method="post" enctype="multipart/form-data">
              
            <input type="hidden" name="operation" value="addProduct">
          
          
        <div class="form-group">
            <input class="form-control" type="text" name="productName" placeholder="Enter Product Title" required>
        </div>
        
        <div class="form-group mt-2">
            <textarea style="height: 150px;" class="form-control" name="productDescription" placeholder="Enter Product Description" required></textarea>
        </div>
          
          <div class="form-group mt-2">
           <input class="form-control" type="number" name="productPrice" placeholder="Enter Product Price" required>
          </div>

          <div class="form-group mt-2">
           <input class="form-control" type="number" name="productDiscount" placeholder="Enter Product Discount" required>
          </div>

          <div class="form-group mt-2">
           <input class="form-control" type="number" name="productQuantity" placeholder="Enter Product Quantity" required>
          </div>

            <!--categories field-->
            <% 
            //CategoryDao cdao = new CategoryDao(FactoryProvider.getFactory());
            List<Category> list = cdao.getCategoriesList();            %>
            
            <div class="form-group mt-2">
                <select name="categoryId" class="form-control">
                    
                    <% for (Category c : list) {   %>
                    
                    <option value="<%= c.getcId()%>" > <%= c.getcName()%></option>
                    
                    <% }%>
     
                </select>
            </div>
            
            
            <!--product field-->
            <div class="form-group mt-2">
                
                <!--E:\JAVA DEVELOPER\Ecommerce\E-Commerce\target\E-Commerce-1.0-SNAPSHOT\images\productImages-->
                
                
                
                <label for="productPicture">Select Product Image</label>
                <br>
                <input type="file" name="productPicture" id="productPicture" required>
            </div>
          
          <div class="container text-center mt-2">
              <button class="btn btn-primary">Add Product</button>
              <button class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
          </div>
              
              </form>
          
      </div>
        
    </div>
  </div>
</div>  
        
        <!--end of product form modal-->
        
        
        
    </body>
</html>
