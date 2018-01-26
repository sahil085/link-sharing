<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="java.util.List" %>
<%@ page import="java.util.Iterator" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
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
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/rating.css"/>
    <script src="${pageContext.request.contextPath}/resources/bootstrap3-typeahead.js"></script>
    <script>
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
//        $(function(){                   // Start when document ready
//            $('#star-rating').rating(); // Call the rating plugin
//        });
//
//        $(function(){
//            $('#star-rating').rating(function(vote, event){
//                // we have vote and event variables now, lets send vote to server.
//                $.ajax({
//                    url: "getRatings?vote="+vote,
//                    type: "POST",
//                    data: {rate: vote},
//                });
//            });
//        });
    </script>
    <style>
        .star-rating {
            direction: rtl;
            display: inline-block;
            padding: 20px
        }

        .star-rating input[type=radio] {
            display: none
        }

        .star-rating label {
            color: #bbb;
            font-size: 18px;
            padding: 0;
            cursor: pointer;
            -webkit-transition: all .3s ease-in-out;
            transition: all .3s ease-in-out
        }

        .star-rating label:hover,
        .star-rating label:hover ~ label,
        .star-rating input[type=radio]:checked ~ label {
            color: #f2b600
        }
    </style>
</head>
<body class="body" style="background:url('${pageContext.request.contextPath}/resources/assets/mybag.jpg');height:100vh;background-position: center;
        background-repeat: no-repeat;background-size:cover;width:100%;">
<div class="container" style="width: 70%">
    <%--<%@include file="createTopic.jsp"%>--%>
    <%--<%@include file="shareLink.jsp" %>--%>
    <%--<%@include file="sendInvitation.jsp"%>--%>
    <%--<%@include file="shareDocument.jsp"%>--%>
    <%@include file="dashBoardHeader.jsp"%>

    <%--<div id="division1" class="col-md-5 col-sm-5">--%>
        <%--<div style="padding-left: 0;">--%>
            <%--<%@include file="userData.jsp"%>--%>
        <%--</div>--%>
    <%--</div>--%>

    <div id="division2" class="col-md-12 col-sm-12">
        <div style="padding-right: 0;">
            <div class="dynamicDiv" style="margin-bottom:15px;">
                <div class="dynamicDivHead">
                    <p class="phead" style="text-align: center">Resources</p>
                </div>
                <div style="margin:10px;">
                    ${message}
                    <c:forEach items="${Resources}" var="item">
                        <div class="media">
                            <div class="media-left">
                                <img src="/UserProfilePic?uname=${item.createdBy.username}" style="background-size: 100% 100%;  width:90px; height: 90px">
                            </div>
                            <div class="media-body">
                                <div>
                                    <h4 class="media-heading col-md-8 col-sm-8" id="fullNameOfUser" style="padding-left: 0;margin-right: 5px;margin-bottom: 0px">${item.createdBy.firstname} ${item.createdBy.lastname}</h4>
                                    <a class="col-md-3 col-sm-3 pull-right" href="#" style="margin-right: 0">${item.topic.name}</a>
                                </div>
                                <small style="margin-top:0px ">${item.createdBy.username}</small>
                                <div style="margin-bottom: 5px">
                                        ${item.description}
                                </div>
                                <div>
                                    <div class="col-md-3 col-sm-3" style="padding-left: 0;padding-right: 0">
                                        <a href="#" class="fa fa-facebook"></a>
                                        <a href="#" class="fa fa-twitter"></a>
                                        <a href="#" class="fa fa-google"></a>
                                    </div>
                                    <div class="col-md-9 col-sm-9 pull-right" style="padding-right: 0;padding-right: 0">
                                        <c:choose>
                                            <c:when test="${item.resourceType =='DocumentResource'}">
                                                <a class="inboxLinks" href='/download?fileName=${item.resourcePath}' download>Download</a>
                                            </c:when>
                                            <c:otherwise>
                                                <a class="inboxLinks" href="${item.resourcePath}" target="_blank">View Link</a>
                                            </c:otherwise>
                                        </c:choose>
                                        <a class="inboxLinks" href="#">View Post</a>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </c:forEach>
                </div>
            </div>
        </div>

    </div>
</div>

<%--search topic --%>
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
                        <label for="publicTopics"> Enter Topic Name *</label>
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
</body>
<script>
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
