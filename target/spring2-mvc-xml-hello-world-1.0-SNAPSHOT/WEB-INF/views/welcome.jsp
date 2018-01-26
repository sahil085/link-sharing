<%@ page import="java.util.Iterator" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<title>Link Sharing</title>
	<script src="${pageContext.request.contextPath}/resources/js/jquery-3.2.1.min.js"></script>
	<script src="${pageContext.request.contextPath}/resources/js/JSForWelcomePage.js"></script>
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css">
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.min.js">
	</script>
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
	<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/common.css"/>
	<script src="${pageContext.request.contextPath}/resources/js/common.js"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/jqueryui/1.12.1/jquery-ui.js"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery.form/4.2.1/jquery.form.min.js"></script>
	<link href="https://cdnjs.cloudflare.com/ajax/libs/jqueryui/1.12.1/jquery-ui.css" rel="stylesheet">
</head>

<script>
    $(document).ready(function(){
        $("#viewPost").click(function(){
           if($("#resourceDiv").css("overflow")!="visible"){
               $("#resourceDiv").css("overflow","visible").css("max-height","none");
           }else{
               $("#resourceDiv").css("overflow","hidden").css("max-height","56px");
		   }
        });
    });
</script>
<body class="body" style="background:url('${pageContext.request.contextPath}/resources/backgroundimages/mybag.jpg');height:100vh;background-position: center;
		background-repeat: no-repeat;background-size:cover;width:100%;">
	<div class="container" >
		<div style="color: green;text-align: center; font-size: 25px;background-color: white">${message}</div>
<%@include file="homePageHeader.jsp"%>
	<div id="division1" class="col-md-8 col-sm-8">
		<div style="padding-left: 0;">
			<div class="dynamicDiv" style="margin-bottom:15px;">
				<div class="dynamicDivHead">
					<p class="phead">Recent Shares</p>
				</div>
				<div style="margin:10px;">
					<c:forEach items="${recentresources}" var="resource">
						<div class="media">
							<div class="media-left">
								<img src="/UserProfilePic?uname=${resource.createdBy.username}" width="120" height="120"/>
							</div>
							<div class="media-body">
								<div>
									<h4 class="media-heading col-md-8 col-sm-8" id="fullNameOfUser" style="padding-left: 0;margin-right: 5px;margin-bottom: 0px">${resource.createdBy.firstname} ${resource.createdBy.lastname}</h4>
									<a class="col-md-3 col-sm-3 pull-right" href="#" style="margin-right: 0">${resource.topic.name}</a>
								</div>
								<small style="margin-top:0px ">${resource.createdBy.username}</small>
								<div id="resourceDiv" style="margin-bottom: 5px;max-height:56px;overflow: hidden;">
										${resource.description}
								</div>
								<div>
									<div class="col-md-3 col-sm-3" style="padding-left: 0;padding-right: 0">
										<a href="#" class="fa fa-facebook"></a>
										<a href="#" class="fa fa-twitter"></a>
										<a href="#" class="fa fa-google"></a>
									</div>
									<div class="col-md-3 col-sm-3 pull-right" style="padding-right: 0;padding-right: 0">
										<a class="inboxLinks" href="#" id="viewPost">View Post</a>
									</div>
								</div>
							</div>
						</div>
					</c:forEach>
				</div>
			</div>
		</div>
	</div>

	<div id="division2" class="col-md-4 col-sm-4">
		<div style="padding-right: 0;">
			<div class="dynamicDiv" style="margin-bottom:15px;">
				<div class="dynamicDivHead">
					<p class="phead">Login</p>
				</div>
				<form class="form-horizontal" id="loginForm" style="padding:10px;" action="/loginProcess" method="post">

			    		<div class="form-group">
				      		<label class="control-label col-sm-4">Username:</label>
				      		<div class="col-sm-8">
							<input type="text" class="form-control" placeholder="Enter username" name="username" required>
			      			</div>
			    		</div>
				    	<div class="form-group">
					      <label class="control-label col-sm-4">Password:</label>
					      <div class="col-sm-8">
							<input type="password" class="form-control" placeholder="Enter password" name="password" required>
					      </div>
				    	</div>
				    	<div class="form-group">
							<a class="btn" role="button" data-toggle="modal"
							   data-target="#SendOtpModel">Forgot password</a>
						<%--<a style="text-decoration:underline;" class="control-label col-sm-5" href="/forgotpassword">Forgot Password</a>--%>
						<div class="col-sm-5 pull-right">
							<button type="submit" class="btn btn-default" form="loginForm">Login</button>
				      		</div>
				      	</div>
				</form>
			</div>
		</div>
		<div style="padding-right: 0;">
			<%@include file="registrationForm.jsp"%>
		</div>

	</div>

	</div>

	<div class="modal fade" id="SendOtpModel" tabindex="-1" role="dialog"
		 aria-labelledby="myModalLabel" aria-hidden="true">
		<div class="modal-dialog ui-front">
			<div class="modal-content">
				<!-- Modal Header -->
				<div class="modal-header">
					<button type="button" class="close"
							data-dismiss="modal">
						<span aria-hidden="true">&times;</span>
						<span class="sr-only">Close</span>
					</button>
					<h4 class="modal-title" id="Sendotp">
						OTP REQUEST
					</h4>
				</div>

				<!-- Modal Body -->
				<div class="modal-body">
					<form action="/sendverificationcode" id="SendOTPForm" method="post">
						<div class="form-group">
							<label for="EmailOfUser">Email *</label>
							<input class="form-control" placeholder="Enter Your Email To Reset Your Password "  id="EmailOfUser" name="useremailid"  required/>
						</div>
						<button type="submit" class="btn btn-default" id="sendverificationcode" style="border:1px solid black;">Submit</button>
					</form>
					<form action="/updatepassword" id="updatePasswordForm" method="post">
						<div class="form-group">
							<label for="EmailToReset">Email *</label>
							<input class="form-control" placeholder="Enter Your Email To Reset Your Password"  id="EmailToReset" name="email"  required/>
						</div>
						<div class="form-group">
							<label for="pass">New Password *</label>
							<input class="form-control" placeholder="Enter New Password"  id="pass" name="password"  required/>
						</div>
						<div class="form-group">
							<label for="confirmpass">Confirm Password *</label>
							<input class="form-control" placeholder="Enter Confirm Password"  id="confirmpass" name="confirmpassword"  required/>
						</div>
						<div class="form-group">
							<label for="verificationcode">Confirm Password *</label>
							<input class="form-control" type="text" placeholder="Enter Verification Code"  id="verificationcode" name="verificationcode"  required/>
						</div>
						<button type="submit" class="btn btn-default" id="updatePassword" style="border:1px solid black;">Submit</button>

					</form>
				</div>
				<!-- Modal Footer -->
				<div class="modal-footer">
					<button type="button" class="btn btn-default"
							data-dismiss="modal">
						Close
					</button>

				</div>
			</div>
		</div>
	</div>
</body>

</html>
