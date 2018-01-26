<%--
  Created by IntelliJ IDEA.
  User: ankur
  Date: 20/7/17
  Time: 11:07 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<!-- Modal -->
<div class="modal fade" id="SendInvitationModel" tabindex="-1" role="dialog"
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
                <h4 class="modal-title" id="myModalForSendInvitaion">
                    Send Invitation
                </h4>
            </div>

            <!-- Modal Body -->
            <div class="modal-body" >
                <form role="form" action="/sendSubscriptionInvitation" id="sendSubscriptionInvitaition" method="post">

                    <div class="form-group">
                        <label for="userEmail">Email *</label>
                        <input class="form-control" type="email" placeholder="Enter Email Id"  id="userEmail" name="emailofuser" required/>
                    </div>

                    <div class="form-group">
                        <label for="topicForSubscription">Topic Name *</label>
                        <input class="form-control" type="text" placeholder="Enter Topic Name"  id="topicForSubscription" name="tname" required/>
                    </div>
                    <button type="submit" class="btn btn-default" id="invite" style="border:1px solid black;">Submit</button>

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
