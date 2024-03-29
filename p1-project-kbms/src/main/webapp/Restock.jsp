<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1" %>
<%@ page import="com.revature.config.ConnectionFactory" %>
    <%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="utf-8">
    <title>Products-Restock</title>
    <meta content="width=device-width, initial-scale=1.0" name="viewport">
    <meta content="" name="keywords">
    <meta content="" name="description">

    <!-- Favicon -->
    <link href="img/favicon.ico" rel="icon">

    <!-- Google Web Fonts -->
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Open+Sans:wght@400;500&family=Lora:wght@600;700&display=swap" rel="stylesheet"> 

    <!-- Icon Font Stylesheet -->
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.10.0/css/all.min.css" rel="stylesheet">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.4.1/font/bootstrap-icons.css" rel="stylesheet">

    <!-- Libraries Stylesheet -->
    <link href="lib/animate/animate.min.css" rel="stylesheet">
    <link href="lib/owlcarousel/assets/owl.carousel.min.css" rel="stylesheet">

    <!-- Customized Bootstrap Stylesheet -->
    <link href="css/bootstrap.min.css" rel="stylesheet">

    <!-- Template Stylesheet -->
    <link href="css/style.css" rel="stylesheet">
</head>

<body>
    <!-- Spinner Start -->
    <div id="spinner" class="show bg-white position-fixed translate-middle w-100 vh-100 top-50 start-50 d-flex align-items-center justify-content-center">
        <div class="spinner-border text-primary" role="status"></div>
    </div>
    <!-- Spinner End -->


    <!-- Navbar Start -->
    <div class="container-fluid fixed-top px-0 wow fadeIn" data-wow-delay="0.1s">
        <div class="top-bar row gx-0 align-items-center d-none d-lg-flex">
            <div class="col-lg-6 px-5 text-start">
                <small><i class="fa fa-map-marker-alt me-2"></i>123 Street, New York, USA</small>
                <small class="ms-4"><i class="fa fa-envelope me-2"></i>info@example.com</small>
            </div>
            <div class="col-lg-6 px-5 text-end">
                <small>Follow us:</small>
                <a class="text-body ms-3" href=""><i class="fab fa-facebook-f"></i></a>
                <a class="text-body ms-3" href=""><i class="fab fa-twitter"></i></a>
                <a class="text-body ms-3" href=""><i class="fab fa-linkedin-in"></i></a>
                <a class="text-body ms-3" href=""><i class="fab fa-instagram"></i></a>
            </div>
        </div>

        <nav class="navbar navbar-expand-lg navbar-light py-lg-0 px-lg-5 wow fadeIn" data-wow-delay="0.1s">
            <a href="index.jsp" class="navbar-brand ms-4 ms-lg-0">
                <h1 class="fw-bold text-primary m-0">Natures<span class="text-secondary">Best</span></h1>
            </a>
            <button type="button" class="navbar-toggler me-4" data-bs-toggle="collapse" data-bs-target="#navbarCollapse">
                <span class="navbar-toggler-icon"></span>
            </button>
            <div class="collapse navbar-collapse" id="navbarCollapse">
                <div class="navbar-nav ms-auto p-4 p-lg-0">
                    <a href="home.jsp" class="nav-item nav-link active">Home</a>
                    <a href="about.jsp" class="nav-item nav-link">About Us</a>
                    <a href="product.jsp" class="nav-item nav-link">Products</a>
                    <div class="nav-item dropdown">
                        <a href="#" class="nav-link dropdown-toggle" data-bs-toggle="dropdown">Pages</a>
                        <div class="dropdown-menu m-0">
                           <a href="Restock.jsp" class="dropdown-item">Restock</a>
                            <a href="blog.jsp" class="dropdown-item">Blog Grid</a>
                            <a href="feature.jsp" class="dropdown-item">Our Features</a>
                            <a href="testimonial.jsp" class="dropdown-item">Testimonial</a>
                         
                        </div>
                    </div>
                    <a href="contact.jsp" class="nav-item nav-link">Contact Us</a>
                </div>
                <div class="d-none d-lg-flex ms-2">
                    <a class="btn-sm-square bg-white rounded-circle ms-3" href="">
                        <small class="fa fa-search text-body"></small>
                    </a>
                    <div class="nav-item dropdown">
                      <a href="#"  data-bs-toggle="dropdown"
                     class="btn-sm-square bg-white rounded-circle ms-3">
                      <small class="fa fa-user text-body"></small>
                      </a>
                      <div class="dropdown-menu m-0">
                          <a href="index.jsp" class="dropdown-item">Logout</a>
                      </div>
                  </div>
                    <a class="btn-sm-square bg-white rounded-circle ms-3" href="">
                        <small class="fa fa-shopping-bag text-body"></small>
                    </a>
                </div>
            </div>
        </nav>
    </div>
    <!-- Navbar End -->
  <%
Connection con = ConnectionFactory.getConnection();  
Statement stmt = con.createStatement();  
ResultSet rs = stmt.executeQuery("select * from product;");
%>
    <div style="margin-top:10%" class="breadcrumbs" data-oas="fade-in">
        <div class="container">
            <h2> All Product Details</h2>
        </div>
    </div>
   <!-- <div style="text-align:center " margin-top :20%>
    <form method="get" action="Restock">
    <input style="margin-top:50px"
    type="submit" value="Show Product details" class="btn text-white btn-block btn-primary"/>
    </form>
    </div> -->
    
    <div  style="margin-top:2%">
    <div style="text-align:center">
    <input type="search" id="myInput" onkeyup="myFunction()" 
     placeholder="Search for products..">               
    </div>
    </div>
     <table style="margin-top:3%" class="table table-responsive table-borderless" id="myTable" style="text-align:center">
<thead>
<tr class="bg-light"><th scope='col' width='10%'>PRODUCT_ID</th>
            		<th scope='col' width='10%'>PRODUCT_NAME</th>
            		<th scope='col' width='10%'>STOCK_AVAILABLE</th>
            		<th scope='col' width='10%'>TOTAL_STOCK</th>
            		<th scope='col' width='10%'>THRESHOLD_LEVEL</th>
            		<th scope='col' width='10%'>BEST_BEFORE</th>
            		<th scope='col' width='10%'>PRICE_PER_UNIT</th>
            		<th scope='col' width='10%'>TYPE_OF_PRODUCT</th></tr>
            		</thead>
            		<tbody>
              		<% while (rs.next()) { %>
            		<tr>
            		<td> <%= rs.getInt("PRODUCT_ID") %></td>
            		<td> <%= rs.getString("PRODUCT_NAME") %></td>
            		<td> <%= rs.getInt("PRODUCT_COUNT") %></td>
            		<td> <%= rs.getInt("TOTAL_STOCK") %></td>
            		<td> <%= rs.getInt("THRESHOLD_LEVEL") %></td>
            		<td> <%= rs.getString("BEST_BEFORE")%></td>
            		<td> <%= rs.getInt("PRICE_PER_UNIT")%></td>
            		<td> <%= rs.getString("TYPE_OF_PRODUCT")%></td>
            		</tr>
            		<% } %>
            		</tbody>
</table>
    <div style= "text-align:center" "margin-top:5%">
    <form method="get" action="Restock" >
    <input type="submit" value="Restock" class="btn text-white btn-block btn-primary">
    </form>
    </div>
    
  
    <!-- Footer Start -->
    <div class="container-fluid bg-dark footer mt-5 pt-5 wow fadeIn" data-wow-delay="0.1s">
        <div class="container py-5">
            <div class="row g-5">
                <div class="col-lg-3 col-md-6">
                    <h1 class="fw-bold text-primary mb-4">Natures<span class="text-secondary">Best</span></h1>
                    <p>Organic farming is the production of food without the use of synthetic chemicals or genetically modified components.</p>
                    <div class="d-flex pt-2">
                        <a class="btn btn-square btn-outline-light rounded-circle me-1" href=""><i class="fab fa-twitter"></i></a>
                        <a class="btn btn-square btn-outline-light rounded-circle me-1" href=""><i class="fab fa-facebook-f"></i></a>
                        <a class="btn btn-square btn-outline-light rounded-circle me-1" href=""><i class="fab fa-youtube"></i></a>
                        <a class="btn btn-square btn-outline-light rounded-circle me-0" href=""><i class="fab fa-linkedin-in"></i></a>
                    </div>
                </div>
                <div class="col-lg-3 col-md-6">
                    <h4 class="text-light mb-4">Address</h4>
                    <p><i class="fa fa-map-marker-alt me-3"></i>123 Street, New York, USA</p>
                    <p><i class="fa fa-phone-alt me-3"></i>+012 345 67890</p>
                    <p><i class="fa fa-envelope me-3"></i>info@example.com</p>
                </div>
                <div class="col-lg-3 col-md-6">
                    <h4 class="text-light mb-4">Quick Links</h4>
                    <a class="btn btn-link" href="">About Us</a>
                    <a class="btn btn-link" href="">Contact Us</a>
                    <a class="btn btn-link" href="">Our Services</a>
                    <a class="btn btn-link" href="">Terms & Condition</a>
                    <a class="btn btn-link" href="">Support</a>
                </div>
                <div class="col-lg-3 col-md-6">
                    <h4 class="text-light mb-4">Newsletter</h4>
                    <p>Dolor amet sit justo amet elitr clita ipsum elitr est.</p>
                    <div class="position-relative mx-auto" style="max-width: 400px;">
                        <input class="form-control bg-transparent w-100 py-3 ps-4 pe-5" type="text" placeholder="Your email">
                        <button type="button" class="btn btn-primary py-2 position-absolute top-0 end-0 mt-2 me-2">SignUp</button>
                    </div>
                </div>
            </div>
        </div>
        <div class="container-fluid copyright">
            <div class="container">
                <div class="row">
                    <div class="col-md-6 text-center text-md-start mb-3 mb-md-0">
                        &copy; <a href="#">Natures Best</a>, All Right Reserved.
                    </div>
                    <div class="col-md-6 text-center text-md-end">
                        <!--/*** This template is free as long as you keep the footer author�s credit link/attribution link/backlink. If you'd like to use the template without the footer author’s credit link/attribution link/backlink, you can purchase the Credit Removal License from "https://htmlcodex.com/credit-removal". Thank you for your support. ***/-->
                        Designed By <a href="https://htmlcodex.com">Veera Swapna Raga</a>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- Footer End -->


    <!-- Back to Top -->
    <a href="#" class="btn btn-lg btn-primary btn-lg-square rounded-circle back-to-top"><i class="bi bi-arrow-up"></i></a>


    <!-- JavaScript Libraries -->
    <script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0/dist/js/bootstrap.bundle.min.js"></script>
    <script src="lib/wow/wow.min.js"></script>
    <script src="lib/easing/easing.min.js"></script>
    <script src="lib/waypoints/waypoints.min.js"></script>
    <script src="lib/owlcarousel/owl.carousel.min.js"></script>

    <!-- Template Javascript -->
    <script src="js/main.js"></script>
    <script src="sorting.js"></script>
    <script src="searching.js"></script>
</body>

</html>