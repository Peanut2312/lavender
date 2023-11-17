<%-- 
    Document   : add
    Created on : Jul 7, 2023, 6:56:54 PM
    Author     : Pham Thang
--%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
                <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">

        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Lavender</title>
         <link href="img/flower.png" rel="icon" type="image/x-icon">
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css">
      <style>
                          .breadcrumb-option {
                 
	padding-top: 35px;
}

.breadcrumb__links a {
    
	font-size: 15px;
	font-weight: 500;
	color: #111111;
	margin-right: 18px;
	display: inline-block;
	position: relative;
}

.breadcrumb__links a:after {
	position: absolute;
	right: -14px;
	top: 0;
	content: "";
	font-family: "FontAwesome";
}

.breadcrumb__links a i {
	margin-right: 5px;
}

.breadcrumb__links span {
	font-size: 15px;
	font-weight: 500;
	color: #888888;
	display: inline-block;
}
a:hover,
a:focus {
	text-decoration: none;
	outline: none;
}
        </style>
    </head>
    <body>
        <div class="breadcrumb-option">
        <div class="container">
            <div class="row">
                <div class="col-lg-12">
                    <div class="breadcrumb__links">
                        <a href="home"><i class="fa fa-home"></i> Home</a>
                        <a href="admin">Admin</a>
                        <a href="crud">Manage Products</a>
                        <span>Add Product</span>
                    </div>
                </div>
            </div>
        </div>
    </div>
        <div class="container ">

            <section class="panel panel-default">
                <div style="padding-bottom: 20px ;padding-top: 20px;" class="panel-heading"> 
                    <h3 class="panel-title">Add Product<br> </h3> 
                </div> 
                <div class="panel-body">

                    <form action="add" class="form-horizontal" method="post" >

<!--                        <div class="form-group row">
                            <label for="name" class="col-sm-3 control-label">Тип заказа</label>
                            <div class="col-sm-9">
                                <label class="radio-inline">
                                    <input type="radio" name="inlineRadioOptions" id="inlineRadio1" value="option1"> Внешный заказ
                                </label>
                                <label class="radio-inline">
                                    <input type="radio" name="inlineRadioOptions" id="inlineRadio2" value="option2"> Внутренный заказ
                                </label>
                            </div>
                        </div>  form-group // -->

                        <div class="form-group row">
                            <label for="name" class="col-sm-3 control-label">Product Name</label>
                            <div class="col-sm-9">
                                <input required type="text" class="form-control" name="name" id="name" placeholder="Enter the product name">
                            </div>
                        </div> <!-- form-group // -->
                        <div class="form-group row">
                            <label for="tech" class="col-sm-3 control-label">Brand</label>
                            <div class="col-sm-3">
                                <select name="brand" class="form-control">
                                    <c:forEach items="${requestScope.listBrand}" var="b">
                                    <option value="${b.brandID}">${b.name}</option>
                                    </c:forEach>
                                </select>
                            </div>
                            <label for="tech" class="col-sm-3 control-label">Sub Category</label>
                            <div class="col-sm-3">
                                <select name="sub" class="form-control">
                                    <c:forEach items="${requestScope.listSub}" var="s">
                                        <option value="${s.subID}">${s.name}</option>
                                    </c:forEach>
                                </select>
                            </div>
                        </div> 
                       
                        <div class="form-group row">
                            <label for="qty" class="col-sm-3 control-label">Price</label>
                            <div class="col-sm-3">
                                <input pattern="\d+" required type="text" class="form-control" name="price" id="qty" placeholder="Enter Price">
                            </div>
                             <label for="qty" class="col-sm-3 control-label">Create Date</label>
                            <div class="col-sm-3">
                                <input required type="date" class="form-control" name="date" id="qty">
                            </div>
                        </div>
                        
                        <div class="form-group row">
                            <label for="name" class="col-sm-3 control-label">Material</label>
                            <div class="col-sm-9">
                                <input required type="text" class="form-control" name="material" id="name" placeholder="Enter Material">
                            </div>
                        </div> <!-- form-group // -->
                        <div class="form-group row">
                            <label for="about" class="col-sm-3 control-label">Detail</label>
                            <div class="col-sm-9">
                                <textarea required name="detail" class="form-control"></textarea>
                            </div>
                        </div> 
                        <div class="form-group row">
                            <label for="about" class="col-sm-3 control-label">Size Guide</label>
                            <div class="col-sm-9">
                                <textarea required name="guide" class="form-control"></textarea>
                            </div>
                        </div>
                        <div class="form-group row">
                            <label for="about" class="col-sm-3 control-label">Refund Policy</label>
                            <div class="col-sm-9">
                                <textarea required name="refund" class="form-control"></textarea>
                            </div>
                        </div><!-- form-group // -->
                         <!-- form-group // -->
                        <!-- form-group // -->
<!--                        <div class="form-group row">
                            <label for="name" class="col-sm-3 control-label">Image</label>
                            <div class="col-sm-3">
                                <label class="control-label small" for="file_img">Main Image (jpg/png):</label> <input type="file" name="file_img">
                            </div>
                            <div class="col-sm-3">
                                <label class="control-label small" for="file_img">Other Images:</label>  <input type="file" name="file_archive">
                            </div>
                        </div>  form-group // -->
                         <!-- form-group // -->
                        <hr>
                        <div class="form-group row">
                            <div class="col-sm-offset-3 col-sm-9">
                                <input type="submit" class="btn btn-primary" value="Save">
                            </div>
                        </div> <!-- form-group // -->
                    </form>

                </div><!-- panel-body // -->
            </section><!-- panel// -->


        </div> <!-- container// -->
        <script>
            $(document).ready(function () {
                // jquery code here

            });
        </script>
    </body>
</html>
