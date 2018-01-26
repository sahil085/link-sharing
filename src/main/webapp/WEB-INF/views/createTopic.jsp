<%--
  Created by IntelliJ IDEA.
  User: ankur
  Date: 20/7/17
  Time: 11:12 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<!-- Modal -->
<div class="modal fade" id="createTopicModel" tabindex="-1" role="dialog"
     aria-labelledby="myModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <!-- Modal Header -->
            <div class="modal-header">
                <button type="button" class="close"
                        data-dismiss="modal">
                    <span aria-hidden="true">&times;</span>
                    <span class="sr-only">Close</span>
                </button>
                <h4 class="modal-title" id="myModalLabel">
                    Modal title
                </h4>
            </div>

            <!-- Modal Body -->
            <div class="modal-body" id="modelbox">

                <form role="form" action="/createtopic" id="createtopicform" method="post">
                    <div class="form-group">
                        <label for="TopicName" id="uniqueTopicname"></label>
                        <label for="TopicName">Topic Name</label>
                        <input type="text" class="form-control"
                               id="TopicName" placeholder="Enter Topic Name" name="name" required/>
                    </div>
                    <div class="form-group">

                        <label for="vis">Visibility</label>
                        <select class="form-control" name="visibililty" id="vis" required>
                            <option value="Private">Private</option>
                            <option value="Public">Public</option>
                        </select>
                    </div>
                    <button type="submit" class="btn btn-default" id="createtopic" style="border:1px solid black;">Submit</button>
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
