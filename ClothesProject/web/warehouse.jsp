<%-- 
    Document   : warehouse
    Created on : Jul 13, 2023, 8:32:05 AM
    Author     : Pham Thang
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html >
    <head>
        <script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
        <script src="https://cdn.datatables.net/1.13.5/js/jquery.dataTables.js"></script>
        <link rel="stylesheet" href="https://cdn.datatables.net/1.13.5/css/jquery.dataTables.css" />
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Lavender</title>
        <link href="img/flower.png" rel="icon" type="image/x-icon">
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
        <link rel="stylesheet" type="text/css" href="css/editor.dataTables.min.css">
        <style>
            body {
                transition: background-color 0.3s, color 0.3s;
            }


            button {
                background-color: inherit;
                padding: 5px 10px;
                font-size: 16px;
                cursor: pointer;
                border: none;
            }
            .breadcrumb__links a {

                font-size: 15px;
                font-weight: 500;
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
                display: inline-block;
            }
            a:hover,
            a {
                text-decoration: none;
                outline: none;
            }
            .card-header {
                display: flex;
                align-items: center;
                justify-content: space-between;
            }

            .card-header h6 {
                margin: 0;
            }

            .moon-icon {
                display: inline-block;
            }

            .sun-icon {
                display: none;
            }

            .dark-mode .moon-icon {
                display: none;
            }

            .dark-mode .sun-icon {
                display: inline-block;
            }

            
/*modal*/
.modal {
    display: none;
    position: fixed;
    z-index: 1;
    left: 0;
    top: 0;
    width: 100%;
    height: 100%;
    overflow: auto;
    background-color: rgba(0, 0, 0, 0.4);
}

.modal-content {
    background-color: #fefefe;
    margin: 15% auto;
    padding: 20px;
    border: 1px solid #888;
    width: 300px;
}

/* Thay đổi màu sắc trong dark mode */
@media (prefers-color-scheme: dark) {
    .modal-content {
        background-color: #333;
        color: #fff;
        border: 1px solid #fff;
    }

    .close {
        color: #fff;
    }
}


        </style>
        <link rel="stylesheet" type="text/css" href="css/editor.dataTables.min.css">

    </head>
    <body >
        <div style="" class="breadcrumb-option">
            <div class="container">
                <div class="row">
                    <div class="col-lg-12">
                        <div class="breadcrumb__links">
                            <a href="home"><i class="fa fa-home"></i> Home</a>
                            <a href="admin">Admin</a>
                            <span>Manage Detail</span>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <div style="padding: 20px" class="site-wrap">
            <div class="site-section">
                <div class="container">
                    <div class="card shadow mb-4">
                        <div class="card-header py-3">
                            <h6 class="m-0 font-weight-bold text-primary">Warehouse</h6>
                            <div>
                                <a href="#" id="addWarehouseLink">Add into Warehouse</a>
                            </div>
                            <button onclick="toggleMode()">
                                <i class="fa fa-moon-o moon-icon"></i>
                                <i class="fa fa-sun-o sun-icon"></i>
                                Mode
                            </button>
                        </div>
<!--                        modal-->


                        <div class="card-body">
                            <div class="table-responsive">
                                <table id="myTable" class="table table-striped table-bordered" style="width:100%" cellspacing="0">
                                    <thead>
                                        <tr>
                                            <th>Product</th>
                                            <th>Size</th>
                                            <th>Color</th>
                                            <th>Quantity</th>
                                            <th>Action</th>
                                            <!--<th><a href="export">Export</a></th>-->
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <c:forEach items="${requestScope.list}" var="w">
                                            <tr data-colorid="${w.color.colorID}" data-sizeid="${w.size.sizeID}" data-productid="${w.product.productID}">
                                                <td>${w.product.name}</td>
                                                <td>${w.size.size}</td>
                                                <td>${w.color.color}</td>
                                                <td>${w.quantity}</td>
                                                <td><a href="deleteWarehouse?productID=${w.product.productID}&colorID=${w.color.colorID}&sizeID=${w.size.sizeID}">Delete</a></td>
<!--                                                <td>

                                                </td>-->
                                            </tr>
                                        </c:forEach>
                                    </tbody>
                                </table>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <form id="myForm" action="editWarehouse" >
            <input type="hidden" id="colorID" name="colorID">
            <input type="hidden" id="sizeID" name="sizeID">
            <input type="hidden" id="productID" name="productID">
            <input type="hidden" id="quantity" name="quantity">
        </form>
<div id="myModal" class="modal">
    <div class="modal-content">
        <span class="close">&times;</span>
        <form id="addWarehouseForm" action="addWarehouse">
            <label for="productID">Product ID:</label>
            <input name="productID" type="number" id="productID" required>
            <br>
            <label for="sizeID">Size ID:</label>
            <input name="sizeID" type="number" id="sizeID" required>
            <br>
            <label for="colorID">Color ID:</label>
            <input name="colorID" type="number" id="colorID" required>
            <br>
            <label for="quantity">Quantity:</label>
            <input name="quantity" type="number" id="quantity" required>
            <br>
            <input type="submit" value="Submit">
        </form>
    </div>
</div>
        <script>
           function toggleMode() {
  var body = document.body;
  var currentMode = body.getAttribute('data-bs-theme') === 'dark' ? 'light' : 'dark';
  body.setAttribute('data-bs-theme', currentMode);

  var moonIcon = document.querySelector('.fa-moon-o');
  var sunIcon = document.querySelector('.fa-sun-o');

  if (currentMode === 'dark') {
    moonIcon.style.display = 'none';
    sunIcon.style.display = 'inline-block';
  } else {
    moonIcon.style.display = 'inline-block';
    sunIcon.style.display = 'none';
  }

  localStorage.setItem('theme', currentMode);
  localStorage.setItem('icon', currentMode === 'dark');
}

window.addEventListener('load', function () {
  var savedTheme = localStorage.getItem('theme');
  var savedIcon = localStorage.getItem('icon');

  if (savedTheme === 'dark') {
    document.body.setAttribute('data-bs-theme', 'dark');
  } else if (savedTheme === 'light') {
    document.body.setAttribute('data-bs-theme', 'light');
  }

  var moonIcon = document.querySelector('.fa-moon-o');
  var sunIcon = document.querySelector('.fa-sun-o');

  if (savedIcon === 'true') {
    moonIcon.style.display = 'inline-block';
    sunIcon.style.display = 'none';
  } else {
    moonIcon.style.display = 'none';
    sunIcon.style.display = 'inline-block';
  }
});





            $(document).ready(function () {
                var table = $('#myTable').DataTable();

                var tempData = {};

                $('#myTable').on('click', 'td', function () {
                    var cell = $(this);
                    var isQuantityCell = cell.index() === 3;

                    if (isQuantityCell) {
                        var colorID = cell.closest('tr').data('colorid');
                        var sizeID = cell.closest('tr').data('sizeid');
                        var productID = cell.closest('tr').data('productid');
                        var currentQuantity = cell.text();

                        var input = $('<input type="number">');
                        input.val(currentQuantity);

                        cell.html(input);

                        input.focus();

                        tempData = {
                            colorID: colorID,
                            sizeID: sizeID,
                            productID: productID
                        };
                    }
                });

                $('#myTable').on('blur', 'td input[type="number"]', function () {
                    var input = $(this);
                    var cell = input.closest('td');

                    var newQuantity = input.val();

                    cell.text(newQuantity);

                    $('#colorID').val(tempData.colorID);
                    $('#sizeID').val(tempData.sizeID);
                    $('#productID').val(tempData.productID);
                    $('#quantity').val(newQuantity);

                    $('#myForm').submit();
                });

                $('#myTable').DataTable();
            });


var modal = document.getElementById("myModal");

var link = document.getElementById("addWarehouseLink");

var closeBtn = document.getElementsByClassName("close")[0];

link.onclick = function() {
    modal.style.display = "block";
}

closeBtn.onclick = function() {
    modal.style.display = "none";
}

window.onclick = function(event) {
    if (event.target == modal) {
        modal.style.display = "none";
    }
}

document.getElementById("addWarehouseForm").addEventListener("submit", function(event) {



    modal.style.display = "none";
});


        </script>
    </body>
</html>
