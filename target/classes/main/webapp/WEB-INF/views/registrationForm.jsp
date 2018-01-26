<%--
  Created by IntelliJ IDEA.
  User: ankur
  Date: 20/7/17
  Time: 11:59 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body onload="disablesubmit()">
<div class="dynamicDiv">
    <div class="dynamicDivHead">
        <p class="phead">Registration</p>
    </div>
    <form class="form-horizontal" style="padding:10px;" enctype="multipart/form-data" action="/registrationprocess" method="post">
        <div class="form-group">
            <label class="control-label col-sm-4" for="firstname">First Name:</label>
            <div class="col-sm-8">
                <input type="text" id="firstname" class="form-control" minlength="5" placeholder="Enter name" name="firstname" required/>
            </div>
        </div>
        <div class="form-group">
            <label class="control-label col-sm-4" for="lastname">Last Name:</label>
            <div class="col-sm-8">
                <input id="lastname" type="text" class="form-control" minlength="5" placeholder="Enter name" name="lastname" required/>
            </div>
        </div>
        <div class="form-group">
            <label class="control-label col-sm-4">Email:</label>
            <div class="col-sm-8">
                <input type="email" onkeyup="checkemail()" id="email" class="form-control" placeholder="Enter email" name="email" required/>
                <span id="emailAvailability"></span>
            </div>
        </div>
        <div class="form-group">
            <label class="control-label col-sm-4" for="username">Username:</label>
            <div class="col-sm-8">
                <input type="text" id="username" onkeyup="checkusername()" class="form-control" minlength="5" placeholder="Enter username" name="username" required/>
                <span id="usernameAvailability"></span>
            </div>
        </div>
        <div class="form-group">
            <label class="control-label col-sm-3" for="password">Password:</label>
            <div class="col-sm-9">
                <input type="password" id="password" class="form-control" minlength="5" placeholder="Enter password" name="password" required/>
            </div>
        </div>
        <div class="form-group">
            <label class="control-label col-sm-3" for="confirm_password">Confirm Password:</label>
            <div class="col-sm-9">
                <input type="password" id="confirm_password" onkeyup="confirmpassword()" class="form-control" minlength="5" placeholder="Enter password" required/>
                <span id="myspan" style="color: red;">Please enter same password</span>
            </div>
        </div>
        <div class="form-group">
            <label class="control-label col-sm-3">Photo:</label>
            <div class="col-sm-9">
                <input type="file" accept="image/*" class="form-control" name="fileupload"/>
            </div>
        </div>
        <div class="form-group">
            <div class="col-sm-5 pull-right">
                <button type="submit" id="register" class="btn btn-default">Register</button>
            </div>
        </div>
    </form>
</div>

</body>
<script>

    function disablesubmit() {

        document.getElementById("register").disabled=true;
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
                document.getElementById("register").disabled=true;
            }
            else
            {
                document.getElementById("register").disabled=false;
            }


        }
    }


    /////////////////   check for email  //////////////

    var request;
    function checkemail()
    {

        var v=document.getElementById('email').value;

        var url="uniqueemail?val="+v;

        if(window.XMLHttpRequest){
            request=new XMLHttpRequest();
        }
        else if(window.ActiveXObject){
            request=new ActiveXObject("Microsoft.XMLHTTP");
        }

        try{
            request.onreadystatechange=getInfo;
            request.open("POST",url,true);
            request.send();
        }catch(e){alert("Unable to connect to server");}
    }

    function getInfo(){
        if(request.readyState==4){
            var val=request.responseText;
            document.getElementById("emailAvailability").innerHTML=val;
            if(val==="email id not available")
            {
                document.getElementById("register").disabled=true;
            }
            else {

                document.getElementById("register").disabled=false;
            }


        }
    }

    function confirmpassword() {
        var password=document.getElementById('password').value;
        var confirmpassword=document.getElementById('confirm_password').value;

        if(password===confirmpassword) {
            document.getElementById('myspan').value = "password matched";

            document.getElementById('register').disabled = false;
        }
        else {
            document.getElementById('myspan').value = "password not matched";
            document.getElementById('register').disabled = true;
        }

    }
    $(document).ready(function () {
        $('#SendOTPForm').ajaxForm({

            success: function (msg) {
                alert(msg);
            },
            error: function (msg) {
                alert(msg);
            }
        });
        $('#updatePasswordForm').ajaxForm({

            success: function (msg) {
                alert(msg);
            },
            error: function (msg) {
                alert(msg);
            }
        });
    });
    //    $("#sendverificationcode").click(function () {
    //        $("#SendOtpModel").model('hide');
    //    });

</script>

</html>
