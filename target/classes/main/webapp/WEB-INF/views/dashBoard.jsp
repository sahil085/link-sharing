<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="C" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page import="com.ttn.beans.User" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    int subscriptioncount=0,postcount=0,flag=0;
%>
<html>
<head>
    <script src="${pageContext.request.contextPath}/resources/js/jquery-3.2.1.min.js"></script>
    <script src="${pageContext.request.contextPath}/resources/js/common.js"></script>

    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css">
    <script src="${pageContext.request.contextPath}/resources/js/JSForDashboardPage.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.min.js"></script>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    <link href="https://cdnjs.cloudflare.com/ajax/libs/jqueryui/1.12.1/jquery-ui.css" rel="stylesheet">
    <script type="text/javascript" src="https://code.jquery.com/jquery-2.1.1.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jqueryui/1.12.1/jquery-ui.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery.form/4.2.1/jquery.form.min.js"></script>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/dashboard.css"/>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/common.css"/>
    <script src="${pageContext.request.contextPath}/resources/jquery.twbsPagination.js"></script>
    <script src="${pageContext.request.contextPath}/resources/bootstrap3-typeahead.js"></script>
    <script src="${pageContext.request.contextPath}/resources/jquery.autocomplete.min.js"></script>
    <script>
        var pagenumber=0;
        $(document).ready(function () {

            var obj = $('#pagination').twbsPagination({
                totalPages: 10,
                visiblePages: 5,
                onPageClick: function (event, page) {
                    $("#inbox").html('');
                    $.ajax({
                        url: 'fetchinbox?index=' + page,
                        method: "get",
                        success: function (response) {
                            $('#inbox').append(response);
                            pagenumber = page;
                        }
                    })
                    console.info(page);
                }


            })
        });

        function markedasread(id) {
            alert(id);
            var ref = this;
            $.ajax({
                url: "readstatus?rid=" + id,
                method: "get",
                success: function (response) {
                    alert(response);
                    if (response == "marked as read") {
                        $(ref).remove();
                        $(function () {
                            $("#inbox").html('');
                            $.ajax({
                                url: 'fetchinbox?index=' + pagenumber,
                                method: "get",
                                success: function (response) {
                                    $('#inbox').append(response);
                                }
                            })

                        })

                    }
                }
                ,
                failure: function (response) {
                    alert(response);

                }
            })
        }


        $('#documentForm').ajaxForm({

            success: function (msg) {
                alert("Document is shared");
            },
            error: function (msg) {
                alert("Document is not shared");
                console.log(msg);
            }
        });
        $('#sendInvitationForm').ajaxForm({
            success: function (msg) {
                alert(msg);
            },
            error: function (msg) {
                alert(msg);
            }
        });
    </script>
    <style>

    </style>
</head>
<body class="body" style="background:url('${pageContext.request.contextPath}/resources/assets/mybag.jpg');height:100vh;background-position: center;
        background-repeat: no-repeat;background-size:cover;width:100%;">
<%! static int flag;%>
<div class="container" style="width: 70%">
    <%@include file="createTopic.jsp"%>
    <%@include file="shareLink.jsp" %>
    <%@include file="sendInvitation.jsp"%>
    <%@include file="shareDocument.jsp"%>
    <%@include file="dashBoardHeader.jsp"%>

    <div id="division1" class="col-md-5 col-sm-5">
        <div style="padding-left: 0;">
            <%@include file="userData.jsp"%>
        </div>

        <div style="padding-left: 0;">
            <div class="dynamicDiv" style="margin-bottom:15px;">
                <div class="dynamicDivHead">
                    <span class="phead">Subscriptions</span>
                    <a style="color: #55ACEE" class="pull-right">View All</a>
                </div>
                <% //while (blogIterator.hasNext()){ Blog userblog = blogIterator.next();%>
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

        <div style="padding-left: 0;">
            <div class="dynamicDiv" style="margin-bottom:15px;">
                <div class="dynamicDivHead">
                    <span class="phead">Trending Topics</span>
                </div>
                <% //while (blogIterator.hasNext()){ Blog userblog = blogIterator.next();%>
                <div style="margin-top:10px;margin-left:10px;margin-right:5px;margin-bottom:10px;">
                    <div class="media">
                        <div class="media-left">
                            <img class="media-object" src="/UserProfilePic?uname=${username}" style="background-size: 100% 100%;  width:70px; height: 70px">
                        </div>
                        <div class="media-body" >
                            <small style="margin-top:0px ">topic name</small>
                            <div>
                                <div class="col-md-4 col-sm-10" style="float: left;margin-bottom: 0px;margin-left: 0">
                                    <p style="margin-bottom: 0">@uday</p>
                                    <p><a>Unsubscribe</a></p>
                                </div>
                                <div class="col-md-4 col-sm-10" style="float: left;margin-bottom: 0px;margin-left: 0">
                                    <p style="margin-bottom: 0">Subscriptions</p>
                                    <p>50</p>
                                </div>
                                <div class="col-md-4 col-sm-10" style="float: left;margin-bottom: 0px;margin-left: 0">
                                    <p style="margin-bottom: 0">Post</p>
                                    <p>30</p>
                                </div>
                            </div>
                            <div style="margin-left: 10px">
                                <select class="col-md-4 selectpicker">
                                    <option>Mustard</option>
                                    <option>Ketchup</option>
                                    <option>Relish</option>
                                </select>
                                <select class="col-md-4 selectpicker" style="margin-left: 15px;width: 80px">
                                    <option>Mustard</option>
                                    <option>Ketchup</option>
                                    <option>Relish</option>
                                </select>
                                <div class="col-md-4">
                                    <a href="#"><span class="popupBox glyphicon glyphicon-envelope"></span></a>
                                    <a href="#"><span class="glyphicon glyphicon-pencil"></span></a>
                                    <a href="#"><span class="glyphicon glyphicon-trash"></span></a>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <div id="inbx" class="col-md-7 col-sm-7">
        <div style="padding-right: 0;">
            <div class="dynamicDiv" style="margin-bottom:15px;">
                <div class="dynamicDivHead" >
                    <p class="phead">Inbox</p>
                </div>
<div id="inbox">

</div>
            </div>
        </div>
        <nav aria-label="Page navigation">
            <ul class="pagination" id="pagination"></ul>
        </nav>
    </div>


</div>


<%--
 modal to change topic name
 --%>
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


<%-- ends --%>

<%-- send invitation modal from subscriptions --%>

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


<%--ends --%>

<%-- search topic modal--%>


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

<%--ends--%>
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
    $('#publicTopics').typeahead({
        hint: true,
        highlight: true,
        minLength: 1
        , source: function (request, response) {
            $.ajax({
                url: "/findpublictopic",
                data: {'term':request},
                dataType: "json",
                type: "Get",
                order: "asc",
                hint: true,
                contentType: "application/json; charset=utf-8",
                searchOnFocus: true,
                success: function (data) {
                    items = [];
                    map = {};
                    $.each(data, function (i, item) {
                        items.push("topic name : "+item[0]+",  createdBy : "+item[1]);
                    });
                    response(items);
                    $(".dropdown-menu").css("height", "auto");
                },
                error: function (response) {
                    alert(response.responseText);
                },
                failure: function (response) {
                    alert(response.responseText);
                }
            });
        }

    });

</script>
</html>
