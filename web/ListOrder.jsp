<%-- 
    Document   : ListOrder
    Created on : Oct 24, 2023, 3:20:15 PM
    Author     : Dac Dat
--%>
<%@page import="model.User"%>

<%
    response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");
    User user = (User) session.getAttribute("account");
        if(user == null) {
        response.sendRedirect("login");
        return;
    }
    if(user.getRole() != 0 && user.getRole() != 1) {
        request.getRequestDispatcher("NoPermission.jsp").forward(request, response);
        return;
    }
%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css" />
        <style>
            .nav-link {
                color: white
            }
            .nav-link:hover {
                background-color: #ccc;
                color: #17a2b8
            }
        </style>
    </head>
    <body>
        <c:set var="orders" value="${requestScope.list}"></c:set>
            <div class="d-flex">
                <div>
                <%@include file="SideBarAdmin.jsp" %>
            </div>
            <div class="container">
                <div>
                    <div class="container mt-5">
                        <form id="searchForm">
                            <div class="d-flex align-items-center">
                                <div class="form-group col-md-2 ">
                                    <input type="text" class="form-control" id="priceFrom" placeholder="Price From" value="${requestScope.priceFrom != null ? requestScope.priceFrom : ''}" name="priceFrom">
                                </div>
                                <div class="form-group col-md-2">
                                    <input type="text" class="form-control" id="priceTo" placeholder="Price To" value="${requestScope.priceTo != null ? requestScope.priceTo : ''}" name="priceTo" >
                                </div>
                                <div class="form-group col-md-2">
                                    <input type="date" class="form-control" id="dateFrom" placeholder="Date From" value="${requestScope.dateFrom != null ? requestScope.dateFrom : ''}" name="dateFrom">
                                </div>
                                <div class="form-group col-md-2">
                                    <input type="date" class="form-control" id="dateTo" placeholder="Date To" value="${requestScope.dateTo != null ? requestScope.dateTo : ''}" name="dateTo">
                                </div>
                                <div class="form-group col-md-2">
                                    <button type="submit" class="btn btn-primary submitBtn">Search</button>
                                </div>
                            </div>  
                        </form>
                    </div>
                </div>
                <div class="container"> 
                    <a href="list-order" style="text-decoration: none; color: inherit"><h1 style="color: chocolate">List Orders</h1></a>
                    <table class="table table-hover table-bordered">
                        <thead>
                            <tr>
                                <th class="col-1">OrderID</th>
                                <th class="col-1">Name</th>
                                <th class="col-1">Phone</th>
                                <th class="col-3">Address</th>                           
                                <th class="col-1">Total Money</th>
                                <th class="col-2">Message</th>
                                <th class="col-2">Date</th>
                                <th class="col-3">Action</th>
                            </tr>
                        </thead>
                        <tbody>                     
                            <c:if test="${orders == null}">
                            <h2>No order was found</h2>
                        </c:if>
                        <c:if test="${requestScope.list != null}">
                            <c:forEach var="order" items="${orders}">
                                <tr id="table-${order.order_id}">
                                    <th>${order.order_id}</th>
                                    <td>${order.name}</td>
                                    <td>${order.phone}</td>
                                    <td>${order.address}</td>
                                    <th>$${order.total_money}</th>
                                    <td>${order.message}</td>
                                    <td>${order.create_at}</td>
                                    <td>
                                        <a href="view-order?id=${order.order_id}" class="btn btn-info mr-2">Change</a>
                                    </td>
                                </tr>
                            </c:forEach>
                        </c:if>   
                        </tbody>
                    </table>
                    <c:if test="${ orders != null}">
                        <nav aria-label="Page navigation example">
                            <ul class="pagination  justify-content-end">
                                <li class="page-item ${requestScope.page == 1 ? "disabled" :""}"><a class="page-link" href="list-order?page=${requestScope.page-1}&priceFrom=${requestScope.priceFrom}&priceTo=${requestScope.priceTo}&dateFrom=${requestScope.dateFrom}&dateTo=${requestScope.dateTo}">Previous</a></li>
                                    <c:forEach begin="1" end="${requestScope.endPage}" var="i">
                                    <li class="page-item ${requestScope.page == i ?"active" :""}" ><a href="list-order?page=${i}&priceFrom=${requestScope.priceFrom}&priceTo=${requestScope.priceTo}&dateFrom=${requestScope.dateFrom}&dateTo=${requestScope.dateTo}" class="page-link" >${i}</a></li>
                                    </c:forEach>
                                <li class="page-item ${requestScope.page == requestScope.endPage ? "disabled" :""} ${requestScope.endPage == 0 ? "disabled" :""}"><a class="page-link" href="list-order?page=${requestScope.page+1}&priceFrom=${requestScope.priceFrom}&priceTo=${requestScope.priceTo}&dateFrom=${requestScope.dateFrom}&dateTo=${requestScope.dateTo}">Next</a></li>
                            </ul>
                        </nav>
                    </c:if>
                </div>
            </div>
        </div>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js" integrity="sha384-IQsoLXl5PILFhosVNubq5LC7Qb9DXgDA9i+tQ8Zj3iwWAwPtgFTxbJ8NT4GN1R8p" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.min.js" integrity="sha384-cVKIPhGWiC2Al4u+LWgxfKTRIcfu0JTxR+EQDz/bgldoEyl4H0zUF0QKbrJ0EcQF" crossorigin="anonymous"></script>
    </body>
</html>
