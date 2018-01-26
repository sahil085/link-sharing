<%--
  Created by IntelliJ IDEA.
  User: ankur
  Date: 20/7/17
  Time: 11:11 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<!-- Modal -->
<div class="modal fade" id="documentresourcemodel" tabindex="-1" role="dialog"
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
                <h4 class="modal-title" id="myModal">
                    Create Documented Resource
                </h4>
            </div>

            <!-- Modal Body -->
            <div class="modal-body" >

                <form role="form" action="/createDocumentResource" id="createdocumentedresourceform" method="post">
                    <div class="form-group">
                        <label for="desc">Description *</label>
                        <textarea class="form-control" rows="5" id="desc" name="description" placeholder="Enter Description" required></textarea>
                    </div>
                    <div class="form-group">
                        <label for="topicsearchfordocumentresource">Topic Name *</label>
                        <input class="form-control" placeholder="Enter Topic Name" id="topicsearchfordocumentresource" name="topicnamefordocumentresource"/>
                    </div>
                    <label for="filepath">Browse attachments*</label>
                    <span class="btn btn-default btn-file">
                         <input type="file" name="file" id="filepath" required>
                        </span>
                    <button type="submit" class="btn btn-default" id="createdocumentresource" style="border:1px solid black;">Submit</button>
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
