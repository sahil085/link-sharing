<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: ankur
  Date: 20/7/17
  Time: 12:19 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page import="java.util.List" %>
<%@ page import="java.util.Iterator" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    int subscriptioncount=0,postcount=0,flag=0;
%>
<html>
<head>
    <script src="${pageContext.request.contextPath}/resources/js/jquery-3.2.1.min.js"></script>
    <script src="${pageContext.request.contextPath}/resources/js/common.js"></script>
    <script src="${pageContext.request.contextPath}/resources/js/JSForWelcomePage.js"></script>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css">
    <script src="${pageContext.request.contextPath}/resources/js/JSForDashboardPage.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.min.js"></script>
    <link href="https://cdnjs.cloudflare.com/ajax/libs/jqueryui/1.12.1/jquery-ui.css" rel="stylesheet">
    <script type="text/javascript" src="https://code.jquery.com/jquery-2.1.1.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jqueryui/1.12.1/jquery-ui.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery.form/4.2.1/jquery.form.min.js"></script>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/dashboard.css"/>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/common.css"/>

    <style>

    </style>
</head>
<body onload="disablesubmit()" class="body" style="background:url('${pageContext.request.contextPath}/resources/assets/mybag.jpg');">
<%! static int flag;%>
<div class="container" style="width: 70%">
    <%@include file="userProfileHeader.jsp"%>

    <div id="division1" class="col-md-5 col-sm-5">
        <div style="padding-left: 0;">
            <%@include file="userData.jsp"%>
        </div>

        <div style="padding-left: 0;">
            <div class="dynamicDiv" style="margin-bottom:15px;">
                <div class="dynamicDivHead">
                    <span class="phead">Subscription</span>
                    <a style="color: #55ACEE" class="pull-right">View All</a>
                </div>
                <div style="margin-top:10px;margin-left:10px;margin-right:5px;margin-bottom:10px;">
                    <c:forEach items="${subscribedTopics}" var="st">
                        <c:if test="${st.topic.createdBy.username eq username}">
                            <%flag=1;%>
                            <div class="media">
                                <div class="media-left">
                                    <img class="media-object" src="/UserProfilePic?uname=${st.topic.createdBy.username}" style="background-size: 100% 100%;  width:70px; height: 70px">
                                </div>
                                <div class="media-body" >
                                    <small style="margin-top:0px ">${st.topic.name}</small>
                                    <div>
                                        <div class="col-md-4 col-sm-10" style="float: left;margin-bottom: 0px;margin-left: 0">
                                            <p style="margin-bottom: 0"> @${st.topic.createdBy.firstname}</p>
                                            <p>
                                                <a href="${st.topic.id}" class="unsubscribedd" ><span  style="text-decoration: underline;font-size: 15px">unsubscribe</span></a>
                                            </p>
                                        </div>
                                        <div class="col-md-4 col-sm-10" style="float: left;margin-bottom: 0px;margin-left: 0">
                                            <a href="#" style="margin-bottom: 0">Subscriptions</a>
                                            <p>
                                                <c:forEach var="no" items="${subscribedTopics}">
                                                    <c:if test="${st.topic.id == no.topic.id}">
                                                        <%subscriptioncount++;%>
                                                    </c:if>
                                                </c:forEach>
                                                <span><%=subscriptioncount%></span>
                                                <%subscriptioncount=0;%>
                                            </p>
                                        </div>
                                        <div class="col-md-4 col-sm-10" style="float: left;margin-bottom: 0px;margin-left: 0">
                                            <p style="margin-bottom: 0">Post</p>
                                            <p> <c:forEach var="re" items="${resources}">
                                                <c:if test="${st.topic.id == re.topic.id}">
                                                    <%postcount++;%>
                                                </c:if>
                                            </c:forEach>
                                                <span><%=postcount%></span>
                                                <%postcount=0;%></p>
                                        </div>
                                    </div>
                                    <div style="margin-left: 10px">
                                        <select id="subscriptionSeriousness" name="subscriptionSeriousness" class="col-md-4 selectpicker">
                                            <option class="selectpickerOptions">SERIOUS</option>
                                            <option class="selectpickerOptions">CASUAL</option>
                                            <option class="selectpickerOptions">VERY_SERIOUS</option>
                                        </select>
                                        <select id="topicVisibility" name="topicVisibility" style="margin-left: 15px;width: 80px" class="col-md-4 pull-right selectpicker">
                                            <option class="selectpickerOptions">PUBLIC</option>
                                            <option class="selectpickerOptions">PRIVATE</option>
                                        </select>
                                        <div class="col-md-4">
                                            <a data-toggle="modal" data-target="#sendInvitationFromsubscriptionmodal" onclick="sendInvitation('${st.topic.name}','${st.user.username}');return false;" href="#" ><span class="popupBox glyphicon glyphicon-envelope"></span></a>
                                                <%--<a class="btn btn-primary eedit" data-toggle="modal" data-id="${st.topic.id}" ><span class="glyphicon glyphicon-pencil" ></span></a>--%>
                                                <%--  <a href="#mymodal" data-toggle="modal" data-target="#changetopicnamemodal" id="${st.topic.id}"><span class="glyphicon glyphicon-pencil" ></span></a>--%>
                                            <a data-toggle="modal" data-target="#changetopicnamemodal" onclick="changetopicname(${st.topic.id}); return false;" href="#"><span class="glyphicon glyphicon-pencil" ></span></a>

                                            <a href="#" onclick="deletetopic(${st.topic.id})"><span class="glyphicon glyphicon-trash"></span></a>
                                        </div>
                                    </div>
                                </div>
                            </div>

                        </c:if>

                        <c:if test="${st.topic.createdBy.username ne username}">
                            <div class="media">
                                <div class="media-left">
                                    <img class="media-object" src="/UserProfilePic?uname=${st.topic.createdBy.username}" style="background-size: 100% 100%;  width:70px; height: 70px">
                                </div>
                                <div class="media-body" >
                                    <small style="margin-top:0px ">${st.topic.name}</small>
                                    <div>
                                        <div class="col-md-4 col-sm-10" style="float: left;margin-bottom: 0px;margin-left: 0">
                                            <p style="margin-bottom: 0"> @${st.topic.createdBy.firstname}</p>
                                            <p>
                                                <a href="${st.topic.id}" class="unsubscribedd" ><span  value="" style="text-decoration: underline;font-size: 15px">unsubscribe</span></a>
                                            </p>
                                        </div>
                                        <div class="col-md-4 col-sm-10" style="float: left;margin-bottom: 0px;margin-left: 0">
                                            <a href="#" style="margin-bottom: 0">Subscriptions</a>
                                            <p>
                                                <c:forEach var="no" items="${subscribedTopics}">
                                                    <c:if test="${st.topic.id == no.topic.id}">
                                                        <%subscriptioncount++;%>
                                                    </c:if>
                                                </c:forEach>
                                                <span><%=subscriptioncount%></span>
                                                <%subscriptioncount=0;%>
                                            </p>
                                        </div>
                                        <div class="col-md-4 col-sm-10" style="float: left;margin-bottom: 0px;margin-left: 0">
                                            <p style="margin-bottom: 0">Post</p>
                                            <p> <c:forEach var="re" items="${resources}">
                                                <c:if test="${st.topic.id == re.topic.id}">
                                                    <%postcount++;%>
                                                </c:if>
                                            </c:forEach>
                                                <span><%=postcount%></span>
                                                <%postcount=0;%></p>
                                        </div>
                                    </div>
                                    <div style="margin-left: 10px">
                                        <select id="subscriptionSeriousnes" name="subscriptionSeriousness" class="col-md-4 selectpicker">
                                            <option class="selectpickerOptions">SERIOUS</option>
                                            <option class="selectpickerOptions">CASUAL</option>
                                            <option class="selectpickerOptions">VERY_SERIOUS</option>
                                        </select>
                                        <div class="col-md-4">
                                            <a href="#"><span class="popupBox glyphicon glyphicon-envelope"></span></a>

                                                <%--<a href="#"><span class="glyphicon glyphicon-pencil"></span></a>--%>
                                                <%--<a href="#"><span class="glyphicon glyphicon-trash" ></span></a>--%>

                                        </div>
                                    </div>
                                </div>
                            </div>
                        </c:if>
                    </c:forEach>
                </div>
            </div>
        </div>
    </div>
    <div id="division2" class="col-md-7 col-sm-7">
        <div style="padding-right: 0;margin-bottom: 20px">
            <div class="dynamicDiv">
                <div class="dynamicDivHead">
                    <p class="phead">Profile</p>
                </div>
                <form class="form-horizontal" id="updateProfileDataForm" style="padding:10px;margin-bottom: 0" enctype="multipart/form-data" action="/updateUserProfile" method="post">
                    <div class="form-group">
                        <label class="control-label col-sm-4" for="firstname">First Name:</label>
                        <div class="col-sm-8">
                            <input type="text" id="firstname" class="form-control" minlength="5" name="firstname" placeholder="<%=session.getAttribute("fname")%>"/>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="control-label col-sm-4" for="lastname">Last Name:</label>
                        <div class="col-sm-8">
                            <input id="lastname" type="text" class="form-control" minlength="5" placeholder="<%=session.getAttribute("lname")%>" name="lastname"/>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="control-label col-sm-4" for="username">Username:</label>
                        <div class="col-sm-8">
                            <input type="text" onkeyup="checkusername()" id="username" class="form-control" minlength="5" placeholder="${username}" name="username"></input>
                            <span id="usernameAvailability"></span>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="control-label col-sm-3">Photo:</label>
                        <div class="col-sm-9">
                            <input type="file" accept="image/*" class="form-control" id="fileupload" name="fileupload"/>
                        </div>
                    </div>
                    <div class="form-group" style="margin-bottom: 5px">
                        <div class="col-sm-5 pull-right">
                            <button type="submit" id="updateProfileData" class="btn btn-default">Update</button>
                        </div>
                    </div>
                </form>
            </div>
        </div>

        <div style="padding-right: 0;">
            <div class="dynamicDiv">
                <div class="dynamicDivHead">
                    <p class="phead">Change Password</p>
                </div>
                <form id="updateUserPasswordForm" class="form-horizontal" style="padding:10px;margin-bottom: 0" action="/updatePassword" method="post">
                    <div class="form-group">
                        <label class="control-label col-sm-3" for="password">Password:</label>
                        <div class="col-sm-9">
                            <input type="password" id="password" class="form-control" minlength="5" placeholder="Enter password" name="password" required/>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="control-label col-sm-3" for="confirm_password">Confirm Password:</label>
                        <div class="col-sm-9">
                            <input type="password" id="confirm_password" class="form-control" minlength="5" placeholder="Enter password" onkeyup="confirmpassword()" required/>
                            <span id="myspan" style="color: red;">Please enter same password</span>
                        </div>
                    </div>
                    <div class="form-group" style="margin-bottom: 5px">
                        <div class="col-sm-5 pull-right">
                            <button type="submit" id="updateUserPassword" class="btn btn-default">Update</button>
                        </div>
                    </div>
                </form>
            </div>
        </div>


    </div>
</div>

<div class="modal fade" id="changetopicnamemodal" tabindex="-1" role="dialog"
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
                <h4 class="modal-title" id="myModalToChangeTopicName">
                    Update Topic Name
                </h4>
            </div>

            <!-- Modal Body -->
            <div class="modal-body" >
                <form role="form" action="/changetopicname" id="changetopicnameform" method="get">

                    <div class="form-group">
                        <label for="tname">New Topic Name *</label>
                        <input class="form-control" type="text" placeholder="Enter New Topic Name"  id="tname" name="tname" required/>
                    </div>

                    <div class="form-group">
                        <input class="form-control" type="hidden" placeholder="Enter Topic Name"  id="topicid" name="tid"  required/>
                    </div>
                    <button type="submit" class="btn btn-default" id="update" style="border:1px solid black;">Update</button>

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


<div class="modal fade" id="sendInvitationFromsubscriptionmodal" tabindex="-1" role="dialog"
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
                <h4 class="modal-title" id="sendInvitation">
                    Send Invitation
                </h4>
            </div>

            <!-- Modal Body -->
            <div class="modal-body" >
                <form role="form" action="/sendSubscriptionInvitation" id="sendInvitationForm" method="Post">

                    <div class="form-group">
                        <label for="mail"> Enter Email Id *</label>
                        <input class="form-control" type="text" placeholder="Enter New Topic Name"  id="mail" name="emailofuser" required/>
                    </div>

                    <div class="form-group">
                        <input class="form-control" type="hidden" placeholder="Enter Topic Name"  id="topicinfo" name="tname"  required/>
                    </div>
                    <button type="submit" class="btn btn-default" id="send" style="border:1px solid black;">Update</button>

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

<%-- search topic--%>


<div class="modal fade" id="searchPublicTopicModal" tabindex="-1" role="dialog"
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
                <h4 class="modal-title" id="search">
                    Search Public Topic
                </h4>
            </div>

            <!-- Modal Body -->
            <div class="modal-body" >
                <form role="form" action="/viewAllPublicTopics" id="s" method="Post">

                    <div class="form-group">
                        <label for="mail"> Enter Topic Name *</label>
                        <input class="form-control" type="text" placeholder="Topic Name"  id="publicTopics" name="topicname"  required/>
                    </div>
                    <button type="submit" class="btn btn-default"  style="border:1px solid black;">Search Topic</button>

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
<%--ends --%>
<%--<form action="/getTags" method="post"></form>Search:<input type="text" id="tagName"></input>--%>
</body>
<script src="${pageContext.request.contextPath}/resources/Dashboard.js"></script>
<script>

    function changetopicname(id) {
        $('#topicid').val(id);
    }
    function sendInvitation(tname,cname) {
        $("#topicinfo").val("topic name : "+tname+",  createdBy : "+cname);
    }
    $('#updateUserPasswordForm').ajaxForm({

        success: function (msg) {
            alert("Your Password is changed");
            console.log(msg);
        },
        error: function (msg) {
            console.log(msg);
            alert(msg);
        }
    });

    $('#updateProfileDataForm').ajaxForm({

        success: function (msg) {
            location.reload();
        },
        error: function (msg) {
            alert(msg);
        }
    });


    function disablesubmit() {

        document.getElementById("updateProfileData").disabled=true;
        document.getElementById("updateUserPassword").disabled = true;
    }
    var request;
    function checkusername()
    {
        var v=document.getElementById("username").value;

        var url="uniqueusername?val="+v;

        if(window.XMLHttpRequest){
            request=new XMLHttpRequest();
        }
        else if(window.ActiveXObject){
            request=new ActiveXObject("Microsoft.XMLHTTP");
        }

        try{
            request.onreadystatechange=getInf;
            request.open("POST",url,true);
            request.send();
        }catch(e){alert("Unable to connect to server");}
    }

    function getInf(){
        if(request.readyState==4){
            var val=request.responseText;
            document.getElementById("usernameAvailability").innerHTML=val;
            if(val=="user name not available")
            {
                document.getElementById("updateProfileData").disabled=true;
            }
            else
            {
                document.getElementById("updateProfileData").disabled=false;
            }


        }
    }
    function confirmpassword() {
        var password=document.getElementById('password').value;
        var confirmpassword=document.getElementById('confirm_password').value;

        if(password===confirmpassword) {
            document.getElementById('myspan').value = "password matched";

            document.getElementById('updateUserPassword').disabled = false;
        }
        else {
            document.getElementById('myspan').value = "password not matched";
            document.getElementById('updateUserPassword').disabled = true;
        }

    }
</script>
</html>

