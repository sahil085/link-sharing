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
<div class="modal fade" id="linkedresourcemodel" tabindex="-1" role="dialog"
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
                <h4 class="modal-title" id="myModaforlinkedresource">
                    Create Linked Resource
                </h4>
            </div>

            <!-- Modal Body -->
            <div class="modal-body" >

                <form role="form" action="/createLinkedResource" id="createlinkedresourceform" method="post">
                    <div class="form-group">
                        <label for="desc1">Description *</label>
                        <textarea class="form-control" rows="5" id="desc1" name="description" placeholder="Enter Description" required></textarea>
                    </div>
                    <div class="form-group">
                        <label for="topicsearchforlinkedresource">Topic Name *</label>
                        <input class="form-control" placeholder="Enter Topic Name"  id="topicsearchforlinkedresource" name="topicnameforlinkedresource" required/>
                    </div>
                    <div class="form-group">
                        <label for="url">File Path / Link  *</label>
                        <input class="form-control" placeholder="Enter File Path" id="url" name="url" required/>
                    </div>
                    <button type="submit" class="btn btn-default" id="createlinkedresource" style="border:1px solid black;">Submit</button>
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
