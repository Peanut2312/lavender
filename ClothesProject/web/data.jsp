<%-- 
    Document   : data
    Created on : Jul 17, 2023, 9:03:06 AM
    Author     : Pham Thang
--%>
<%@ page import="java.util.Arrays" %>
<%@ page import="java.util.stream.Collectors" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page import="java.util.LinkedHashMap" %>
<%@ page import="java.util.Map" %>
<%@ page import="model.Account" %>
<%@ page import="java.util.List" %>
<%@ page import="java.util.ArrayList" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <script
            src="https://www.gstatic.com/charts/loader.js">
        </script>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Lavender</title>
        <link href="img/flower.png" rel="icon" type="image/x-icon">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
        <style>
            /* CSS cho các thẻ select */
            body {
                background-color: #f2f2f2;
            }
           

            .chart-container {
                max-width: 700px;
                width: 100%;
                text-align: center;
            }
            /* CSS cho kiểu font chữ */
            body {
                font-family: Arial, sans-serif;
            }
            select {
                padding: 5px;
                border-radius: 3px;
                border: 1px solid #ccc;
            }

            /* CSS cho các thẻ form */
            form {
                margin-bottom: 20px;
            }

            /* CSS cho các thẻ a */
            a {
                color: #000;
                text-decoration: none;
            }

            a:hover {
                text-decoration: none;
            }

            .table-container {
                display: flex;
                justify-content: space-between;
                margin-bottom: 20px;
            }

            .left-tables {
                flex: 1;
                margin-right: 20px;
            }

            .right-tables {
                flex: 1;
            }

            .order-table {
                width: 100%;
                border-collapse: collapse;
                margin-bottom: 20px;
            }

            .order-table th, .order-table td {
                border: 1px solid #ccc;
                padding: 10px;
                text-align: center;
            }

            .order-table th {
                background-color: #f2f2f2;
                font-weight: bold;
            }

            /* CSS cho canvas */
            canvas {
                width: 100%;
                max-width: 700px;
                height: 400px;
                margin-bottom: 20px;
            }
            .my-button {
                display: inline-block;
                padding: 10px 20px;
                background-color: #007bff;
                color: #fff;
                text-decoration: none;
                border-radius: 4px;
                margin: 50px;
            }

            .my-button:hover {
                background-color: #0056b3;
            }
            .chart-container {
  display: flex;
  flex-direction: column;
  align-items: center;
  justify-content: center;
  text-align: center;
   color: #66b2ff;
  
}
        </style>

        <!--<script src="https://www.gstatic.com/charts/loader.js"></script>-->
        <script
            src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.9.4/Chart.js">
        </script>
        <script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/chartjs-plugin-annotation"></script>

    </head>

    <body>
        <a href="home" class="my-button">Home</a>
        <div class="chart-container">

            <form id="myForm1" action="data">
                <select  onchange="submitForm1()" name="year">
                    <option ${requestScope.year==2021?"selected":""} value="2021">2021</option>
                    <option ${requestScope.year==2022?"selected":""} value="2022">2022</option>
                    <option ${requestScope.year==2023?"selected":""} value="2023">2023</option>
                </select>
            </form>
            <canvas id="myChart" style="width:100%;max-width:700px"></canvas>
            <h4>Chart of the top 3 brands highest number of products sold</h4>     
        </div>
        <div class="chart-container">

            <form id="myForm2" action="data">
                <select  onchange="submitForm2()" name="year3">
                    <option ${requestScope.year3==2021?"selected":""} value="2021">2021</option>
                    <option ${requestScope.year3==2022?"selected":""} value="2022">2022</option>
                    <option ${requestScope.year3==2023?"selected":""} value="2023">2023</option>
                </select>
            </form>

            <canvas id="myChart1" style="width:100%;max-width:400px"></canvas>
            <h4>The chart of the revenue share of brands in the top 3 countries</h4> 
        </div>
        <div class="chart-container">

            <form id="myForm3" action="data">
                <select  onchange="submitForm3()" name="year4">
                    <option ${requestScope.year4==2021?"selected":""} value="2021">2021</option>
                    <option ${requestScope.year4==2022?"selected":""} value="2022">2022</option>
                    <option ${requestScope.year4==2023?"selected":""} value="2023">2023</option>
                </select>
            </form>

            <canvas id="myChart2" style="width:100%;max-width:700px"></canvas>
            <h4>The chart for the of each top 3 Brands</h4>  
        </div>
        <div class="chart-container">

            <form id="myForm4" action="data">
                <select  onchange="submitForm4()" name="year5">
                    <option ${requestScope.year5==2021?"selected":""} value="2021">2021</option>
                    <option ${requestScope.year5==2022?"selected":""} value="2022">2022</option>
                    <option ${requestScope.year5==2023?"selected":""} value="2023">2023</option>
                </select>
            </form>
            <canvas id="myChart3" style="width:100%;max-width:700px"></canvas>
            <h4>        The chart of revenue
            </h4>
        </div>
        <div class="chart-container">

            <form id="myForm5" action="data">
                <select  onchange="submitForm5()" name="productID1">
                    <c:forEach items="${list}" var="p">
                        <option ${requestScope.p1.productID==p.productID?"selected":""} value="${p.productID}">${p.name}</option>
                    </c:forEach>
                </select>
                <select  onchange="submitForm5()" name="productID2">
                    <c:forEach items="${list}" var="p">
                        <option ${requestScope.p2.productID==p.productID?"selected":""} value="${p.productID}">${p.name}</option>
                    </c:forEach>
                </select>
            </form>
            <canvas id="myChart4" style="width:100%;max-width:700px"></canvas>
            <h4>        The chart of compare 2 product
            </h4>
        </div>

        <form action="data" id="myForm">

            <!--<div id="myChart" style="max-width: 700px; height: 400px"></div>        <form id="myForm" action="data">-->
            From:
            <select name="month1" onchange="submitForm()">
                <option ${requestScope.month1==1?"selected":""} value="1">1</option>
                <option ${requestScope.month1==2?"selected":""}  value="2">2</option>
                <option ${requestScope.month1==3?"selected":""}  value="3">3</option>
                <option ${requestScope.month1==4?"selected":""}  value="4">4</option>
                <option ${requestScope.month1==5?"selected":""}  value="5">5</option>
                <option ${requestScope.month1==6?"selected":""}  value="6">6</option>
                <option ${requestScope.month1==7?"selected":""}    value="7">7</option>
                <option ${requestScope.month1==8?"selected":""}  value="8">8</option>
                <option ${requestScope.month1==9?"selected":""}  value="9">9</option>
                <option ${requestScope.month1==10?"selected":""}  value="10">10</option>
                <option ${requestScope.month1==11?"selected":""}  value="11">11</option>
                <option ${requestScope.month1==12?"selected":""}  value="12">12</option>
            </select> -
            <select name="year1" onchange="submitForm()">
                <option  ${requestScope.year1==2020?"selected":""}  value="2020">2020</option>
                <option ${requestScope.year1==2021?"selected":""}  value="2021">2021</option> 
                <option ${requestScope.year1==2022?"selected":""}  value="2022">2022</option>
                <option ${requestScope.year1==2023?"selected":""}   value="2023">2023</option>
            </select> To:
            <select name="month2" onchange="submitForm()">
                <option ${requestScope.month2==1?"selected":""} value="1">1</option>
                <option ${requestScope.month2==2?"selected":""}  value="2">2</option>
                <option ${requestScope.month2==3?"selected":""}  value="3">3</option>
                <option ${requestScope.month2==4?"selected":""}  value="4">4</option>
                <option ${requestScope.month2==5?"selected":""}  value="5">5</option>
                <option ${requestScope.month2==6?"selected":""}  value="6">6</option>
                <option ${requestScope.month2==7?"selected":""}    value="7">7</option>
                <option ${requestScope.month2==8?"selected":""}  value="8">8</option>
                <option ${requestScope.month2==9?"selected":""}  value="9">9</option>
                <option ${requestScope.month2==10?"selected":""}  value="10">10</option>
                <option ${requestScope.month2==11?"selected":""}  value="11">11</option>
                <option ${requestScope.month2==12?"selected":""}  value="12">12</option>
            </select> - 
            <select name="year2" onchange="submitForm()">
                <option  ${requestScope.year2==2020?"selected":""}  value="2020">2020</option>
                <option ${requestScope.year2==2021?"selected":""}  value="2021">2021</option> 
                <option ${requestScope.year2==2022?"selected":""}  value="2022">2022</option>
                <option ${requestScope.year2==2023?"selected":""}   value="2023">2023</option>
            </select>
        </form>
        <div class="table-container">
            <div class="left-tables">
                <table class="order-table">
                    <tr>
                        <th>Period of times</th>
                        <th>Orders</th>
                    </tr>
                    <c:set var="i" value="0"/>
                    <c:forEach items="${count}" var="c" >
                        <tr>
                            <td>${i} h - ${i+4}</td>
                            <td>${c} orders</td>
                        </tr>
                        <c:set var="i" value="${i+4}"/>
                    </c:forEach>
                </table>
                <table class="order-table">
                    <tr>
                        <th>Origin</th>
                        <th>Quantity</th>
                    </tr>
                    <c:forEach items="${country}" var="c" varStatus="i" >
                        <tr><c:if test="${i.index==0}">
                                <td>Việt Nam</td>
                            </c:if>
                            <c:if test="${i.index==1}">
                                <td>Foreign</td>
                            </c:if>
                            <td>${c} products</td>
                        </tr>
                    </c:forEach>
                </table>

                <table class="order-table">
                    <thead>
                        <tr>
                            <th>Account ID</th>
                            <th>Account Name</th>
                            <th>Number of Orders</th>
                        </tr>
                    </thead>
                    <tbody>
                        <c:forEach var="entry" items="${top}">
                            <tr>
                                <td>${entry.key.accountID}</td>
                                <td>${entry.key.username}</td>
                                <td>${entry.value}</td>
                            </tr>
                        </c:forEach>
                    </tbody>
                </table>
                <table class="order-table">
                    <thead>
                        <tr>
                            <th>Account ID</th>
                            <th>Account Name</th>
                            <th>Spending</th>
                        </tr>
                    </thead>
                    <tbody>
                        <c:forEach var="entry" items="${rich}">
                            <tr>
                                <td>${entry.key.accountID}</td>
                                <td>${entry.key.username}</td>
                                <td><fmt:formatNumber pattern="##,###,###.#" value="${entry.value}" />₫ </td>
                            </tr>
                        </c:forEach>
                    </tbody>
                </table>
            </div>
            <div id="myChart" style="max-width:700px; height:400px"></div>
        </div>
        <script>
            function submitForm1() {
                document.getElementById("myForm1").submit();
            }
            function submitForm() {
                document.getElementById("myForm").submit();
            }
            function submitForm2() {
                document.getElementById("myForm2").submit();
            }
            function submitForm3() {
                document.getElementById("myForm3").submit();
            }
            function submitForm4() {
                document.getElementById("myForm4").submit();
            }
            function submitForm5() {
                document.getElementById("myForm5").submit();
            }
        </script>
        <% int[]levent =(int[]) request.getAttribute("levent");%>
        <% int[]nike =(int[]) request.getAttribute("nike");%>
        <% int[]outer =(int[]) request.getAttribute("outer");%>
        <script>

            const xValues = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12];
            const levent = <%= Arrays.toString(levent) %>;
            const nike = <%= Arrays.toString(nike) %>;
            const outer = <%= Arrays.toString(outer) %>;
            new Chart("myChart", {
                type: "line",
                data: {
                    labels: xValues,
                    datasets: [{
                            data: levent,
                            label: "Levent",
                            borderColor: "red",
                            fill: false
                        }, {
                            data: nike,
                            label: "Nike",
                            borderColor: "green",
                            fill: false
                        }, {
                            data: outer,
                            label: "Outerity",
                            borderColor: "blue",
                            fill: false
                        }]
                },
                options: {
                    legend: {display: true}
                }
            });
        </script>
        <% int[] money = (int[]) request.getAttribute("money"); %>
        <script>
            const money = <%= Arrays.toString(money) %>;

            const data = {
                labels: ['American', 'Other', 'Viet Nam'],
                datasets: [
                    {
                        label: 'Dataset 1',
                        data: money,
                        backgroundColor: [
                            'rgba(255, 99, 132, 0.5)',
                            'rgba(54, 162, 235, 0.5)',
                            'rgba(75, 192, 192, 0.5)',
                        ],
                        borderColor: [
                            'rgba(255, 99, 132, 1)',
                            'rgba(54, 162, 235, 1)',
                            'rgba(75, 192, 192, 1)',
                        ],
                        borderWidth: 1
                    }
                ]
            };

            const options = {
                responsive: true,
                plugins: {
                    title: {
                        display: true,
                        text: 'Pie Chart'
                    },
                    legend: {
                        display: true
                    }
                }
            };

            new Chart("myChart1", {
                type: "pie",
                data: data,
                options: options
            });


        </script>

        <script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
        <% int[]l =(int[]) request.getAttribute("l");%>
        <% int[]n =(int[]) request.getAttribute("n");%>
        <% int[]o=(int[]) request.getAttribute("o");%>
        <script>
            const l = <%= Arrays.toString(l) %>;
            const n = <%= Arrays.toString(n) %>;
            const o = <%= Arrays.toString(o) %>;
            var stackedData = {
                labels: ['Levents', 'Outerity', 'Nike'],
                datasets: [
                    {
                        label: 'Product 1',
                        data: [l[0], o[0], n[0]],
                        backgroundColor: 'rgba(255, 99, 132, 0.5)',
                        borderColor: 'rgba(255, 99, 132, 1)',
                        borderWidth: 1
                    },
                    {
                        label: 'Product 2',
                        data: [l[1], o[1], n[1]],
                        backgroundColor: 'rgba(54, 162, 235, 0.5)',
                        borderColor: 'rgba(54, 162, 235, 1)',
                        borderWidth: 1
                    },
                    {
                        label: 'Product 3',
                        data: [l[2], o[2], n[2]],
                        backgroundColor: 'rgba(75, 192, 192, 0.5)',
                        borderColor: 'rgba(75, 192, 192, 1)',
                        borderWidth: 1
                    }
                ]
            };

            var stackedOptions = {
                responsive: true,
                plugins: {
                    title: {
                        display: true,
                        text: 'Stacked Chart'
                    },
                    legend: {
                        display: true
                    }
                },
                scales: {
                    x: {
                        stacked: true
                    },
                    y: {
                        stacked: true
                    }
                }
            };

            var stackedChart = new Chart("myChart2", {
                type: 'bar',
                data: stackedData,
                options: stackedOptions
            });
        </script>
        <% int[]revenue =(int[]) request.getAttribute("revenue");%>
        <script>
            var ctx = document.getElementById('myChart3').getContext('2d');
            const revenue = <%= Arrays.toString(revenue) %>;
            var chart = new Chart(ctx, {
                type: 'line', // Sử dụng kiểu biểu đồ đường
                data: {
                    labels: ['1', '2', '3', '4', '5', '6', '7', '8', '9', '10', '11', '12'],
                    datasets: [{
                            label: 'Revenue',
                            data: revenue,
                            backgroundColor: 'rgba(75, 192, 192, 0.2)', // Màu nền của đường
                            borderColor: 'rgba(75, 192, 192, 1)', // Màu viền của đường
                            borderWidth: 1 // Độ dày viền của đường
                        }]
                },
                options: {
                    scales: {
                        y: {
                            beginAtZero: true // Để trục y bắt đầu từ giá trị 0
                        }
                    }
                }
            });
        </script>

        <script>
            var ctx = document.getElementById('myChart4').getContext('2d');
            var view1 = ${requestScope.p1.viewCount};
            var sale1 = ${requestScope.sale1};
            var i1 = ${requestScope.i1};
            var buy1 = ${requestScope.buy1};
            var price1 = ${requestScope.p1.price} / 1000;
            var view2 = ${requestScope.p2.viewCount};
            var sale2 = ${requestScope.sale2};
            var i2 = ${requestScope.i2};
            var buy2 = ${requestScope.buy2};
            var price2 = ${requestScope.p2.price} / 1000;
            var chart = new Chart(ctx, {
                type: 'radar',
                data: {
                    labels: ['View Count', 'Number of Sales', 'Inventory Number', 'Price', 'Number of Buyers'],
                    datasets: [{
                            label: 'Product 1',
                            data: [view1, sale1, i1, price1, buy1],
                            backgroundColor: 'rgba(75, 192, 192, 0.2)',
                            borderColor: 'rgba(75, 192, 192, 1)',
                            borderWidth: 1
                        }, {
                            label: 'Product 2',
                            data: [view2, sale2, i2, price2, buy2],
                            backgroundColor: 'rgba(255, 99, 132, 0.2)',
                            borderColor: 'rgba(255, 99, 132, 1)',
                            borderWidth: 1
                        }]
                },
                options: {
                    scales: {
                        r: {
                            beginAtZero: true
                        }
                    }
                }
            });
        </script>

    </body>
</html>
