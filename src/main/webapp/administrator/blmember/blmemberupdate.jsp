<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page import="java.util.*"%>
<%@ page import="subject.service.*"%>
<%@ page import="subject.vo.*"%>
<%@ page import="subject.dao.*"%>
<%-- 此頁採用 EL 的寫法取值 --%>
<%
BLMemberVO blmemberVO = (BLMemberVO) request.getAttribute("blmemberVO");
%>
<!DOCTYPE html>
<!--
This is a starter template page. Use this page to start your new project from
scratch. This page gets rid of all links and provides the needed markup only.
-->
<html lang="en">
  <head>
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <title>LetItGo | 維護人員系統</title>

    <!-- Google Font: Source Sans Pro -->
    <link
      rel="stylesheet"
      href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,400i,700&display=fallback"
    />
    <!-- Font Awesome Icons -->
    <link
      rel="stylesheet"
      href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.1.1/css/all.min.css"
      integrity="sha512-KfkfwYDsLkIlwQp6LFnl8zNdLGxu9YAA1QvwINks4PhcElQSvqcyVLLD9aMhXd13uQjoXtEKNosOWaZqXgel0g=="
      crossorigin="anonymous"
      referrerpolicy="no-referrer"
    />
    <!-- Theme style -->
    <link rel="stylesheet" href="./css/adminlte.min.css"/>
<!--     <link href="https://cdn.jsdelivr.net/gh/gitbrent/bootstrap4-toggle@3.6.1/css/bootstrap4-toggle.min.css" rel="stylesheet"> -->


    <style>
      table, th, td {
      	width:300px;
        border: 2px solid #CCCCFF;
      }
      th, td {        
        padding: 5px;
        text-align: center;
      }
    </style>
  </head>
  <body class="hold-transition sidebar-mini">
    <!-- 主要開發區塊 -->
    <div class="wrapper">
      <!-- Navbar header區塊-->
      <nav
        id="navbar-header"
        class="main-header navbar navbar-expand navbar-white navbar-light"
      >
        <!-- Left navbar links -->
        <ul class="navbar-nav">
          <li class="nav-item">
            <a class="nav-link" data-widget="pushmenu" href="#" role="button"
              ><i class="fas fa-bars"></i
            ></a>
          </li>
          
          <li class="nav-item d-none d-sm-inline-block">
            <a href="<%=request.getContextPath()%>/administrator/admlogin.jsp" class="nav-link">登出</a>
          </li>
        </ul>

        <!-- Right navbar links -->
        <ul class="navbar-nav ml-auto">
          <!-- Notifications Dropdown Menu -->
          <!-- <li class="nav-item dropdown">
            <a class="nav-link" data-toggle="dropdown" href="#">
              <i class="far fa-bell"></i>
              <span class="badge badge-warning navbar-badge">3</span>
            </a>
            <div class="dropdown-menu dropdown-menu-lg dropdown-menu-right">
              <span class="dropdown-item dropdown-header">3 Notifications</span>
              <div class="dropdown-divider"></div>
              <a href="#" class="dropdown-item">
                <i class="fas fa-file mr-2"></i> 3 new reports
                <span class="float-right text-muted text-sm">2 days</span>
              </a>
              <div class="dropdown-divider"></div>
              <a href="#" class="dropdown-item dropdown-footer"
                >See All Notifications</a
              >
            </div>
          </li> -->
          <!-- <li class="nav-item">
            <a class="nav-link" data-widget="login-in" href="#" role="button">
              <i class="fas fa-arrow-right-to-bracket"></i>
            </a>
          </li> -->
          <!-- <li class="nav-item">
            <a class="nav-link" data-widget="login-out" href="#" role="button">
              <i class="fas fa-arrow-right-from-bracket"></i>
            </a>
          </li> -->
        </ul>
      </nav>
      <!-- /.navbar -->
      <!-- Main Sidebar Container 主側邊欄-->
      <aside id="sidebar" class="main-sidebar sidebar-dark-primary elevation-4">
        <!-- Brand Logo -->
		<a href="#" class="brand-link">
          <img
            src="<%=request.getContextPath()%>/administrator/images/Frame 6.svg"
            alt="LETITGO Logo"
            class="brand-image elevation-3"
            style="opacity: 0.8"
          />
         <span class="brand-text font-weight-light">樂易購</span>
       	</a>

        <!-- Sidebar -->
        <div class="sidebar">
          <!-- Sidebar user panel (optional) -->
          <div class="user-panel mt-3 pb-3 mb-3 d-flex">
            <div class="image">
              <img
                src="<%=request.getContextPath()%>/administrator/images/Adm4.svg"
                class="img-circle elevation-2"
                alt="User Image"
              />
            </div>
            <div class="info">
              <a href="<%=request.getContextPath()%>/administrator/admwelcome.jsp" class="d-block">維護人員${user.admname}</a>
            </div>
          </div>

          <!-- Sidebar Menu -->
          <nav class="mt-2">
            <ul
              class="nav nav-pills nav-sidebar flex-column"
              data-widget="treeview"
              role="menu"
              data-accordion="false"
            >
              <!-- Add icons to the links using the .nav-icon class
                 with font-awesome or any other icon font library -->
                 
              <li class="nav-item menu-open">
                <a href="#" class="nav-link">
                  <i class="fa-solid fa-address-card"></i>
                  <p>
                    會員管理
                    <i class="right fas fa-angle-left"></i>
                  </p>
                </a>
                <ul class="nav nav-treeview">
                
                  <li class="nav-item">
                    <a href="<%=request.getContextPath()%>/administrator/blmemberall.jsp" class="nav-link active">
                      <i class="far fa-circle nav-icon"></i>
                      <p>會員停權</p>
                    </a>
                   </li>
                  </ul>
                </li>
            
              <li class="nav-item ">
                <a href="#" class="nav-link">
                  <i class="fa-solid fa-hand-holding-heart"></i>
                  <p>廣告/活動管理</p>
                  <i class="right fas fa-angle-left"></i>
                </a>
                <ul class="nav nav-treeview">
                  <li class="nav-item">
                    <a href="<%=request.getContextPath()%>/administrator/advert/Advert.jsp" class="nav-link ">
                      <i class="far fa-circle nav-icon"></i>
                      <p>首頁廣告</p>
                    </a>
                  </li>
                  <li class="nav-item">
                    <a href="<%=request.getContextPath()%>/administrator/couponall.jsp" class="nav-link ">
                      <i class="far fa-circle nav-icon"></i>
                      <p>優惠劵</p>
                    </a>
                  </li>                  
                </ul>
              </li>
              <li class="nav-item menu-open">
                <a href="#" class="nav-link">
                  <i class="fa-brands fa-facebook-messenger"></i>
                  <p>公告</p>
                  <i class="right fas fa-angle-left"></i>
                </a>
                <ul class="nav nav-treeview">
                  <li class="nav-item">
                    <a href="<%=request.getContextPath()%>/administrator/froann.jsp" class="nav-link ">
                      <i class="far fa-circle nav-icon "></i>
                      <p>首頁公告</p>
                    </a>
                  </li>
<!--                   <li class="nav-item"> -->
<!--                     <a href="#" class="nav-link"> -->
<!--                       <i class="far fa-circle nav-icon"></i> -->
<!--                       <p>賣家公告</p> -->
<!--                     </a> -->
<!--                   </li> -->
              
                </ul>
              </li>
             
            </ul>
          </nav>
          <!-- /.sidebar-menu -->
        </div>
        <!-- /.sidebar -->
      </aside>
      <!-- Content Wrapper. Contains page content 主頁面欄位-->
      <div class="content-wrapper">
        <!-- Content Header (Page header) -->
        <div class="content-header">
          <div class="container-fluid">
            <div class="row mb-3">
              <div class="col-sm-4">
                <h1 class="m-0">會員停權</h1>
              </div>
              <!-- /.col -->
              <div class="col-sm-4">
                <ol class="breadcrumb float-sm-right">
<!--                   <li class="breadcrumb-item"> -->
<!--                     <a href=" ">新增</a> -->
<!--                   </li> -->
                  
                </ol>
              </div>
              <!-- /.col -->
            </div>
            <!-- /.row -->
          </div>
          <!-- /.container-fluid -->
        </div>
        <!-- /.content-header -->

        <!-- Main content -->
        <div class="content">
          <div class="container-fluid">
            <div class="row">
              <!-- left column -->
              <div class="col-md-12">
                
                <!-- <div class="card card-primary"> -->
                  <div class="card-header">
                    <!-- <h3 class="card-title">
                      
                      <small></small>
                    </h3> -->
                  <!-- </div> -->
                  <!-- /.card-header -->
                  <!-- form start -->
<!--                   <form id="quickForm"> -->
                 
                    <!-- /.card-body -->
 
 <%-- 錯誤表列 --%>
<c:if test="${not empty errorMsgs}">
	<font style="color:red">請修正以下錯誤:</font>
	<ul>
		<c:forEach var="message" items="${errorMsgs}">
			<li style="color:red">${message}</li>
		</c:forEach>
	</ul>
</c:if>            

   <FORM METHOD="post" ACTION="${pageContext.request.contextPath}/administrator/blmember.do" name="form1">
<table>
	<tr>
		<td>黑名單編號<font color=red><b></b></font></td>
		<td><%=blmemberVO.getBlacklistid()%></td>
	</tr>
	<tr>
		<td>賣家帳號<font color=red><b></b></font></td>
		<td><%=blmemberVO.getSellername()%></td>
	</tr>
	<tr>
		<td>會員帳號<font color=red><b></b></font></td>
		<td><%=blmemberVO.getMembername()%></td>
	</tr>	
	<tr>
		<td><font color=red><b>會員狀態</b></font></td>
		<td>
		<label><input style="WIDTH: 13px; HEIGHT: 13px" name="memberstatus" type="radio" value="0" ${blmemberVO.memberstatus eq 0 ? "checked='checked'": ""}><font  size="5"> off</font></label>
		<span>&nbsp&nbsp</span>
		<label><input style="WIDTH: 13px; HEIGHT: 13px" name="memberstatus" type="radio" value="1" ${blmemberVO.memberstatus eq 1 ? "checked='checked'": ""}><font size="5"> on</font></label>
<%-- 		   <input type="TEXT" name="froannstatus"  size="45" value="<%=froannVO.getFroannstatus()%>" /> --%>
		</td>
		
	</tr>
	
        </table>
 <br>
<input type="hidden" name="action" value="update">
<input type="hidden" name="blacklistid" value="<%=blmemberVO.getBlacklistid()%>">
<%-- <input type="hidden" name="sellername" value="<%=blmemberVO.getSellername()%>"> --%>
<%-- <input type="hidden" name="membername" value="<%=blmemberVO.getMembername()%>"> --%>
<input type="submit" value="送出修改"></FORM>

           
                  </form>
                </div>
                <!-- /.card -->
              </div>
              <!--/.col (left) -->
              <!-- right column -->
              <div class="col-md-6"></div>
              <!--/.col (right) -->
            </div>
            <!-- /.row -->
          </div>
          <!-- /.container-fluid -->
        </div>
        <!-- /.content -->
      </div>
      <!-- ============ Footer段落 ============ -->
      <footer class="main-footer">
        <!-- 讓footer維持滿的 -->
		<div class="col-12">
        <!-- To the right -->
        <div class="float-right d-none d-sm-inline"></div>
       
        <strong
          >2022 Tibame TGA102 第三組
          <a href="#"></a></strong
        >
      </footer>
      <!-- Control Sidebar -->
      <aside class="control-sidebar control-sidebar-dark">
        <!-- Control sidebar content goes here -->
      </aside>
      <!-- /.control-sidebar -->
      <!-- ============ Footer段落 ============ -->
      <!-- /.content-wrapper -->
    </div>
    <!-- jQuery -->
    <script src="./plugins/jquery/jquery.min.js"></script>
    <script src="./vendors/jquery/jquery-3.6.0.min.js"></script>
    <!-- Bootstrap 4 -->
    <script src="./plugins/bootstrap/js/bootstrap.bundle.min.js"></script>
    <!-- AdminLTE App -->
    <script src="./js/adminlte.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.13.0/js/all.min.js"></script>
<!--     <script src="https://cdn.jsdelivr.net/gh/gitbrent/bootstrap4-toggle@3.6.1/js/bootstrap4-toggle.min.js"></script> -->
  </body>

<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/administrator/datetimepicker/jquery.datetimepicker.css" />
<script src="<%=request.getContextPath()%>/administrator/datetimepicker/jquery.js"></script>
<script src="<%=request.getContextPath()%>/administrator/datetimepicker/jquery.datetimepicker.full.js"></script>

<style>
  .xdsoft_datetimepicker .xdsoft_datepicker {
           width:  300px;   /* width:  300px; */
  }
  .xdsoft_datetimepicker .xdsoft_timepicker .xdsoft_time_box {
           height: 151px;   /* height:  151px; */
  }
</style>

	
</html>
