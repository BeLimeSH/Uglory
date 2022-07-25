<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="utf-8">
    <title>Uglory</title>
    <meta content="width=device-width, initial-scale=1.0" name="viewport">
    <meta content="" name="keywords">
    <meta content="" name="description">

    <!-- Favicon -->
    <link href="${contextPath}/resources/img/favicon.ico" rel="icon">
    
    <!-- Icon Font Stylesheet -->
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.10.0/css/all.min.css" rel="stylesheet">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.4.1/font/bootstrap-icons.css" rel="stylesheet">
    
    <!-- Libraries Stylesheet -->
    <link href="${contextPath}/resources/lib/owlcarousel/assets/owl.carousel.min.css" rel="stylesheet">
    <link href="${contextPath}/resources/lib/tempusdominus/css/tempusdominus-bootstrap-4.min.css" rel="stylesheet" />

    <!-- Customized Bootstrap Stylesheet -->
    <link href="${contextPath}/resources/css/bootstrap.min.css" rel="stylesheet">
    
    <!-- Template Stylesheet -->
    <link href="${contextPath}/resources/css/style.css" rel="stylesheet">
    
    <!-- Product Style sheet -->
    <link href="${contextPath}/resources/css/adminproduct-style.css" rel="stylesheet">

    <!-- Fontawesome cdn 링크 -->
    <script src="https://kit.fontawesome.com/1ef9913073.js" crossorigin="anonymous"></script>

</head>

<body>
    <div class="container-xxl position-relative bg-white d-flex p-0">
        <!-- Spinner include -->
        <jsp:include page="/WEB-INF/views/common/spinner.jsp"/>

        <!-- Sidebar include -->
        <jsp:include page="/WEB-INF/views/common/sidebar.jsp"/>

        <!-- Content Start -->
        <div class="content">

            <!-- Header include -->
            <jsp:include page="/WEB-INF/views/common/header.jsp"/>

            <!-- 상품 등록 form태그 -->
            <main class="container-fluid pt-4 px-4">
                <section class="row justify-content-center mx-0">
                    <article class="col-xl-6 col-md-8 bg-light rounded product-margin p-4">
                        <h2 class="text-start">배송 상품 목록</h2>
                        <hr>
                        <%-- form X ajax로 --%>
                        <div class="product-row">
                            <div class="w-100 text-center exdelDate p-1">
                                <span class="text-center fw-bold">배송 예정일</span>
                                <span class="rounded bg-white delDate">${weeklyList.deliveryDate}</span>
                            </div>
                        </div>

                        <div class="rounded p-2 m-2 bg-white">
                            <table class="table table-hover text-center">
                                <thead>
                                    <tr>
                                        <th>상품명</th>
                                        <th>Standard / Jumbo</th>
                                        <th>삭제</th>
                                    </tr>
                                </thead>
                                <tbody id="del-p-list"></tbody>
                            </table>
                        </div>

                        <div class="product-row text-secondary mb-2">
                            <div class="standard text-end">가격</div>
                            <div>
                                <span id="del-price"></span>
                                <span>/ 20000</span>
                            </div>
                        </div>

                        <!-- ajax로 만들어야 하는 부분 -->
                        <div class="product-row m-2 mb-4 bg-white rounded p-2">
                            <select id="pList" class="pListItem">
                                <option value="0">상품</option>
                                <c:if test="${!empty productList}">
                                    <c:forEach var="product" items="${productList}">
                                        <option value="${product.productCode}">${product.productName}</option>
                                    </c:forEach>
                                </c:if>
                            </select>
                            <select id="opList" class="pListItem">
                                <option value="0">옵션</option>
                            </select>
                            <button id="addListBtn" class="btn btn-primary productBtn">추가</button>
                        </div>

                        <div class="product-row">
                            <button type="button" class="btn btn-lg btn-primary w-100" onclick="location.href='list'">저장</button>
                        </div>
                    </article>
                </section>
            </main>

            <!-- Footer include -->
            <jsp:include page="/WEB-INF/views/common/footer.jsp"/>
            
        </div>
        <!-- Content End -->
    </div>

    <script>
        const productListNo = '${weeklyList.productListNo}'
    </script>

    <!-- JavaScript Libraries -->
    <script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0/dist/js/bootstrap.bundle.min.js"></script>
    <script src="${contextPath}/resources/lib/easing/easing.min.js"></script>
    <script src="${contextPath}/resources/lib/waypoints/waypoints.min.js"></script>
    <script src="${contextPath}/resources/lib/owlcarousel/owl.carousel.min.js"></script>
    <script src="${contextPath}/resources/lib/tempusdominus/js/moment.min.js"></script>
    <script src="${contextPath}/resources/lib/tempusdominus/js/moment-timezone.min.js"></script>
    <script src="${contextPath}/resources/lib/tempusdominus/js/tempusdominus-bootstrap-4.min.js"></script>

    <!-- Template Javascript -->
    <script src="${contextPath}/resources/js/main.js"></script>
    <script src="${contextPath}/resources/js/weeklyList.js"></script>
</body>

</html>