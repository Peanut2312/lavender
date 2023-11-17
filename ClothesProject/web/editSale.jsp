<%-- 
    Document   : editSale
    Created on : Jul 12, 2023, 4:47:09 PM
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
         <link href="img/flower.png" rel="icon" type="image/x-icon">
    </head>
    <body>
         <div class="breadcrumb-option">
        <div class="container">
            <div class="row">
                <div class="col-lg-12">
                    <div class="breadcrumb__links">
                        <a href="home"><i class="fa fa-home"></i> Home</a>
                        <a href="admin">Admin</a>
                        <a href="sale">Manage Sale</a>
                        <span>Edit Sale</span>
                    </div>
                </div>
            </div>
        </div>
    </div>
        <div class="container ">

            <section class="panel panel-default">
                <div style="padding-bottom: 20px ;padding-top: 20px;" class="panel-heading"> 
                    <h3 class="panel-title">Edit Sale<br> </h3> 
                </div> 
                <div class="panel-body">

                    <form action="editSale" class="form-horizontal" method="post" >
                        <c:set value="${requestScope.sale}" var="s"/>
                        <div class="form-group row">
                            <label for="name" class="col-sm-3 control-label">Sale Name</label>
                            <div class="col-sm-3">
                                <input value="${s.name}" required type="text" class="form-control" name="name" id="name" placeholder="Enter the sale name">
                            </div>
                            <label for="tech" class="col-sm-3 control-label">Apply</label>
                            <div class="col-sm-3">
                                <select name="apply" class="form-control">
                                        <option ${!s.apply ? "selected" : ""} value="0">Not Apply</option>
                                        <option ${s.apply ? "selected" : ""} value="1">Apply</option>
                                </select>
                            </div>
                        </div> <!-- form-group // -->
                        <div class="form-group row">
                            <label for="tech" class="col-sm-3 control-label">Brand</label>
                            <div class="col-sm-3">
                                <select name="brandID" class="form-control">
                                    <option ${s.brand==null ? "selected" : ""} selected value="0">All</option>
                                    <c:forEach items="${requestScope.listBrand}" var="b">
                                        <option ${b.brandID == s.brand.brandID ? "selected" : ""} value="${b.brandID}">${b.name}</option>
                                    </c:forEach>
                                </select>
                            </div>
                            <label for="qty" class="col-sm-3 control-label">Sale</label>
                            <div class="col-sm-3">
                                <input value="${s.sale}"  required type="number" step="any" class="form-control" name="sale" id="qty" placeholder="Enter Sale">
                            </div>
                        </div> 

                        <div class="form-group row">
                            <label for="qty" class="col-sm-3 control-label">From Date</label>
                            <div class="col-sm-3">
                                <input value="${s.fromTime}" required type="datetime-local" class="form-control" name="from" id="qty">
                            </div>
                            <label for="qty" class="col-sm-3 control-label">To Date</label>
                            <div class="col-sm-3">
                                <input value="${s.toTime}" required type="datetime-local" class="form-control" name="to" id="qty">
                            </div>
                        </div>
                            
                        <input value="${s.saleID}"  type="hidden" name="saleID" >
                      
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