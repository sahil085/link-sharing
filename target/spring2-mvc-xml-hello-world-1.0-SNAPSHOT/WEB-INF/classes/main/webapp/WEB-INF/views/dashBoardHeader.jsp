<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<div class="row well" >
    <div>
        <div class="col-md-6 col-sm-6">
            <a class="a1 rowheader" style="text-decoration: none">Link Sharing</a>
        </div>
        <div class="col-md-6 col-sm-6">
            <div class="col-md-4 col-sm-4 ">
                <div class="input-group ">
                    <a href="#"  data-toggle="modal" data-target="#searchPublicTopicModal"> <span class="input-group-addon glyphicon glyphicon-search"></span></a>
                </div>
            </div>
            <div class="col-md-4 col-sm-4" style="padding-right: 0">
                <a href="#" data-toggle="modal" data-target="#createTopicModel"><span class="glyphicon glyphicon-comment spanicons"></span></a>
                <a href="#" data-toggle="modal" data-target="#SendInvitationModel"><span class="glyphicon glyphicon-envelope spanicons"></span></a>
                <a href="#" data-toggle="modal" data-target="#linkedresourcemodel"><span class="glyphicon glyphicon-link spanicons"></span></a>
                <a href="#" data-toggle="modal" data-target="#documentresourcemodel"><span class="glyphicon glyphicon-copy spanicons"></span></a>
            </div>
            <div class="col-md-4 col-sm-4">
                <div class="col-md-3 col-sm-4">
                    <a href="/userProfilePage" class="pull-right" style="padding-right:5px;"><img class="media-object" src="/UserProfilePic?uname=<%=session.getAttribute("uname")%>" style="background-size: 100% 100%;  width:37px; height: 37px"></a>
                </div>
                <div class="col-md-9 col-sm-4 pull-right" style="padding: 0;margin-right: 0">
                    <span class="dropdown" style="float: right">
                        <button class="btn btn-primary dropdown-toggle" type="button" data-toggle="dropdown">${username}
                        <span class="caret"></span></button>
                            <ul class="dropdown-menu">
                                <li><a href="/userProfilePage?uname=<%=session.getAttribute("uname")%>">Profile</a></li>
                               <c:if test="${admin}">
                                <li><a href="logOut">Users</a></li>
                                <li><a href="logOut">Topics</a></li>
                                <li><a href="logOut">Posts</a></li>
                               </c:if>
                                <li><a href="/logout">Logout</a></li>
                            </ul>
                    </span>
                </div>
            </div>
        </div>
    </div>
</div>
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
