

<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<html>
<head>
    <title>Link Sharing</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">
    <!--link rel="stylesheet" href="/resources/css/home.css"-->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">

    <link href="https://cdnjs.cloudflare.com/ajax/libs/jqueryui/1.12.1/jquery-ui.css" rel="stylesheet">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <style>
        .head-color
        {
            background: dimgray;
            color: #efefef;
        }
        .s_icon
        {
            font-size: 20px;
            margin:5px 10px;
            color:#efefef;
        }
        .ui-front{
            z-index:10000;
        }
    </style>
<script>
    $(document).ready(function () {
        $("#SearchGlobalTopic").autocomplete({
            source: function (request, response) {
                $.ajax({
                    url: '/findpublictopic',
                    data: "{ 'term': '" + request.term + "'}",
                    dataType: "json",
                    type: "POST",
                    contentType: "application/json; charset=utf-8",
                    success: function (data) {
                        response($.map(data, function (item) {
                            return {
                                label: item[0],
                                val: item[1]
                            }
                        }))

                    },

                    //define select handler
                    select: function (event, ui) {
                        if (ui.item) {
                            window.location.href = ui.item.tag_url;
//                event.preventDefault();
//                $("#selected_tags span").append('<a href=" + ui.item.tag_url + " target="_blank">'+ ui.item.label +'</a>');
//                //$("#tagQuery").value = $("#tagQuery").defaultValue
//                var defValue = $("#tagQuery").prop('defaultValue');
//                $("#tagQuery").val(defValue);
//                $("#tagQuery").blur();
                            return false;
                        }
                    }
                });
            },
    });
    });
</script>
</head>

<body>
<div class="container-fluid">

    <nav class="navbar head-color">
    <div class="container-fluid">
        <div class="navbar-header">
            <p class="navbar-brand m-0 " href="#">Link Sharing</p>
        </div>
        <div class="navbar-form navbar-right" role="search">
            <div class="input-group border-none">
                <div class="input-group-btn border-none">
                    <button  id="searchButton"class="btn btn-default border-none" style="height: 30px">
                        <i class="glyphicon glyphicon-search"></i>
                    </button>
                </div>
                <input type="text" id="SearchGlobalTopic" class="form-control border-none" style="height: 30px; width:150px;" placeholder="Search" >
                <div class="input-group-btn">
                    <button  id="clearSearch"class="btn btn-default border-none" style="height: 30px">
                        <i class="glyphicon glyphicon-remove"></i>
                    </button>
                </div>
            </div>

            <div class="dropdown" style="float: right;  " >
                <button class="btn  dropdown-toggle d-inline-block" style="background: #aaa;" type="button" data-toggle="dropdown">
                    <img class="pull-left" src="imageFetch?username=<%=session.getAttribute("username")%>" width="20" height="20"/>
                    <p class="pull-left " style="font-size:15px;margin: 0px 5px;"><%=session.getAttribute("")%></p>
                    <span class="caret pull-left" style="margin:10px 0 0 0;"></span></button>
            </div>



        </div>
    </div>
</nav>


    <div class="modal fade" id="addTopic" role="dialog">
        <div class="modal-dialog">

            <!-- Modal content-->
            <div class="modal-content">
                <div class="modal-header head-color" style="border-radius:6px 6px 0 0;">
                    <button type="button" class="close" style="color:#efefef !important;" data-dismiss="modal">X</button>
                    <h3 >Add Topic</h3>
                </div>
                <div class="modal-body">
                    <ul class="list-group">

                        <li class="list-group-item">
                            <form method="post" action="/topic"  id="createTopic">
                                <div class="form-group">
                                    <label for="name">Topic Name*</label>
                                    <input type="text" class="form-control"  id="name" name="topicname" placeholder="Enter Topic Name" required>
                                </div>
                                <div class="form-group">
                                    <label for="visibility">Visibility*</label>
                                    <select class="form-control" id="visibility" name="visibility">
                                        <option value="PUBLIC" selected>PUBLIC</option>
                                        <option value="PUBLIC">PRIVATE</option>
                                    </select>
                                </div>
                                <button type="submit" id="addingTopic" class="btn btn-primary"  style="margin-left: 83%;">Add Topic</button>
                            </form>
                        </li>
                    </ul>

                </div>

            </div>

        </div>
    </div>


    <div class="modal fade" id="sendInvite" role="dialog">
        <div class="modal-dialog ui-front">

            <!-- Modal content-->
            <div class="modal-content">
                <div class="modal-header head-color" style="border-radius:6px 6px 0 0;">
                    <button type="button" class="close" style="color:#efefef !important;" data-dismiss="modal">X</button>
                    <h3 >Send Invite</h3>
                </div>
                <div class="modal-body">
                    <ul class="list-group">

                        <li class="list-group-item">
                            <form method="post" action="javascript:void(0)"  id="inviteForm">
                                <div class="form-group">
                                    <label for="email">Email Id*</label>
                                    <input type="email" class="form-control"  id="email" name="email" placeholder="Enter Email" required>
                                </div>
                                <div class="form-group">
                                    <label for="inviteTopic">Topic*</label>
                                    <input type="text" class="form-control "  id="inviteTopic" name="topicname" placeholder="Enter Topic Name" required>
                                </div>
                                <button type="submit" id="sendingInvite" class="btn btn-primary" data-dismiss="#sendInvite"style="margin-left: 83%;">Send Invite</button>
                            </form>
                        </li>
                    </ul>
                </div>

            </div>

        </div>
    </div>

    <div class="modal fade" id="addLink" role="dialog">
        <div class="modal-dialog ui-front">

            <!-- Modal content-->
            <div class="modal-content">
                <div class="modal-header head-color" style="border-radius:6px 6px 0 0;">
                    <button type="button" class="close" style="color:#efefef !important;" data-dismiss="modal">X</button>
                    <h3 >Add Link Resource</h3>
                </div>
                <div class="modal-body">
                    <ul class="list-group">

                        <li class="list-group-item">
                            <form method="post" action="/linksave"  id="linkForm">
                                <div class="form-group">
                                    <label for="link">Link*</label>
                                    <input type="url" class="form-control"  id="link" name="url" placeholder="Enter Link" required>
                                </div>
                                <div class="form-group">
                                    <label for="desc">Description*</label>
                                    <textarea class="form-control"  id="descp" name="description"  required></textarea>
                                </div>
                                <div class="form-group">
                                    <label for="linkTopic">Topic*</label>
                                    <input type="text" class="form-control "  id="linkTopic" name=search placeholder="Enter Topic Name" required>
                                </div>
                                <button type="submit" id="addingLink" class="btn btn-primary" data-dismiss="#addLink" style="margin-left: 83%;">Add Link</button>
                            </form>
                        </li>
                    </ul>
                </div>
            </div>

        </div>
    </div>

    <div class="modal fade" id="addDocument" role="dialog">
        <div class="modal-dialog ui-front">

            <!-- Modal content-->
            <div class="modal-content">
                <div class="modal-header head-color" style="border-radius:6px 6px 0 0;">
                    <button type="button" class="close" style="color:#efefef !important;" data-dismiss="modal">X</button>
                    <h3 >Add Document Resource</h3>
                </div>
                <div class="modal-body">
                    <ul class="list-group">

                        <li class="list-group-item">
                            <form method="post" action="/documentsave" enctype="multipart/form-data" id="documentForm">
                                <div class="form-group">
                                    <label for="file">Document*</label>
                                    <input type="file" class="form-control"  id="file" name="filepath" placeholder="Browse" required>
                                </div>
                                <div class="form-group">
                                    <label for="desc">Description*</label>
                                    <textarea class="form-control"  id="desc" name="description1"  required></textarea>
                                </div>
                                <div class="form-group">
                                    <label for="linkTopic">Topic*</label>
                                    <input type="text" class="form-control "  id="documentTopic" name="search1" placeholder="Enter Topic Name" required>
                                </div>
                                <button type="submit" id="addingDocument" class="btn btn-primary" data-dismiss="#addDocument" style="margin-left: 78%;">Add Document</button>
                            </form>
                        </li>
                    </ul>

                </div>
            </div>

        </div>
    </div>
</div>







<script type="text/javascript">
    $(document).ready(function() {
        $(function() {
            $("#tagsName1,#linkTopic,#documentTopic").autocomplete({
                source: function(request, response) {
                    $.ajax({
                        url: "/get_topic_list",
                        type: "POST",
                        data: { term: request.term },

                        dataType: "json",

                        success: function(data) {
                            console.log(data);
                            response($.map(data, function(v){
                                return {
                                    label: v,
                                    value: v
                                };
                            }));
                        }
                    });
                },
//                        select:function () {
//                            window.location.href="http://www.google.com";
//                        }

            });
        });
    });

</script>


    </body>
</html>
