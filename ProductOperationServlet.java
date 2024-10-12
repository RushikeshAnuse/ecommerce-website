/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package com.ecommerce.servlets;

import com.ecommerce.dao.CategoryDao;
import com.ecommerce.dao.ProductDao;
import com.ecommerce.entities.Category;
import com.ecommerce.entities.Product;
import com.ecommerce.helper.FactoryProvider;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import jakarta.servlet.http.Part;

@MultipartConfig
public class ProductOperationServlet extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
          
            //fetch data from admin page
            
          
            String op = request.getParameter("operation");
            
            //select the operation using op field
            if(op.trim().equals("addCategory")){
                
                String cattitle = request.getParameter("categoryTitle");
                String catdesc = request.getParameter("categoryDescription");
                
                Category cat = new Category();
                cat.setcName(cattitle);
                cat.setcDescription(catdesc);
                
                CategoryDao catDao = new CategoryDao(FactoryProvider.getFactory());
                int cid = catDao.saveCategoryData(cat);
                
                HttpSession httpSession = request.getSession();
                httpSession.setAttribute("message","Add Category Datails Successfully !!! "+cid);
                response.sendRedirect("admin.jsp");
                return;
                
                
                
            }else if(op.trim().equals("addProduct")){
                
                String producttitle = request.getParameter("productName");
                String productdesc = request.getParameter("productDescription");
                int productprice = Integer.parseInt(request.getParameter("productPrice"));
                int productdiscount = Integer.parseInt(request.getParameter("productDiscount"));
                int productquantity = Integer.parseInt(request.getParameter("productQuantity"));
                
                int categoryid = Integer.parseInt(request.getParameter("categoryId"));
                Part part = request.getPart("productPicture");
                

                         
                
                Product product = new Product();
                product.setpName(producttitle);
                product.setpDescription(productdesc);
                product.setpPrice(productprice);
                product.setpDiscount(productdiscount);
                product.setpQuantity(productquantity);
                product.setpPhoto(part.getSubmittedFileName());
                

                CategoryDao cdao = new CategoryDao(FactoryProvider.getFactory());
                Category category = cdao.getCategoryById(categoryid);
                
                product.setCategory(category);
                
                
                //save product code
                ProductDao pdao = new ProductDao(FactoryProvider.getFactory());
                pdao.saveProduct(product);
                
//                //upload images 
//                // Save the uploaded file on the server
//                // Construct the path for the uploaded image
//                //E:\JAVA DEVELOPER\Ecommerce\E-Commerce\target\E-Commerce-1.0-SNAPSHOT\images\productImages
//                // Store images outside the project directory
//                String uploadPath = "E:" + File.separator + "ecommerce" + File.separator + "productImages";
//
//                //String uploadPath = getServletContext().getRealPath("images") + File.separator + "productImages";
//
//                // Create the directory if it doesn't exist
//                File uploadDir = new File(uploadPath);
//                if (!uploadDir.exists()) {
//                   uploadDir.mkdirs(); // Creates the directory, including any necessary but nonexistent parent directories
//                }
//
//                // Full path including the file name
//                String filePath = uploadPath + File.separator + part.getSubmittedFileName();
//
//                // Save the file
//                FileOutputStream fos = new FileOutputStream(filePath);
//                InputStream is = part.getInputStream();
//                byte[] buffer = new byte[1024];
//                int bytesRead = 0;
//                while ((bytesRead = is.read(buffer)) != -1) {
//                    fos.write(buffer, 0, bytesRead);
//                }
//                fos.close();
//                is.close();

                //String path = "E:\\ecommerce\\productImages"+File.separator+part.getSubmittedFileName(); 
                String path = request.getServletContext().getRealPath("images")+File.separator+"productImages"+File.separator+part.getSubmittedFileName();
                System.out.println(path);
                
                
                try {
                    
                    FileOutputStream fos = new FileOutputStream(path);
                    InputStream is = part.getInputStream();
                    
                    byte [] data = new byte[is.available()];
                    is.read(data);
                    
                    fos.write(data);
                    fos.close();
                    
                } catch (Exception e) {
                    e.printStackTrace();
                }
                
                HttpSession httpSession = request.getSession();
                httpSession.setAttribute("message","Product Added Successfully !!! ");
                response.sendRedirect("admin.jsp");
                return;
                
                
            }
            
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
