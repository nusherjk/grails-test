<%--
  Created by IntelliJ IDEA.
  User: Strix
  Date: 9/21/2021
  Time: 10:20 AM
--%>

<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <meta name="layout" content="${gspLayout ?: 'main'}"/>

    <title>Portal</title>



    <style type="text/css">
    .wrapper {

        width: 100%;


    }


    .wrap-item{

        padding: 8px;
        margin: 2px auto;
        text-align: center;
    }

    .wrap-item > a {
        color: #1b1e21;

        text-decoration: none;
    }

    .wrap-item:hover{
        background-color: gray;
        color: white;
    }
    #sidebar {

        min-width: 250px;
        max-width: 250px;
        min-height: 100vh;

    }

    #sidebar.active {
        margin-left: -250px;
    }
    </style>

</head>

<body>


<div class="row ml-0 wrapper pl-0 pr-0 pt-2">
    <nav id="sidebar" class="col-md-3 pt-3">
        <div class="sidebar-header" style="text-align: center; list-style-type: none;">
            <h3>Sidebar</h3>
        </div>

        <ul  style="text-align: center; list-style-type: none;">

            <li class=" wrap-item"><g:link controller="profile"> User Profile</g:link></li>
            <li class=" wrap-item"><button type="button" class="btn btn-info btn-lg" data-toggle="modal" data-target="#myModal"> Change Password</button></li>
        </ul>
    </nav>

    <div id="content" role="main"  class=" col-md-9 pt-3 ">
        <div class="row pb-5 pt-5" style="justify-content: space-between" >
            <section class="row colset-2-its">
                <h1>User Profile</h1>
                <g:if test='${flash.message}'>
                    <div class="alert alert-danger" role="alert">${flash.message}</div>
                </g:if>

            </section>
        </div>



        <div class="centered border border-secondary">


            <div class=" row p-3 border-bottom border-secondary" style="margin: auto">
                <div class="col-md-4"> Firstname : </div>
                <div class="col-md-6"> ${user.firstname}</div>
            </div>
            <div class=" row p-3 border-bottom border-secondary" style="margin: auto">
                <div class="col-md-4"> Lastname : </div>
                <div class="col-md-6"> ${user.lastname}</div>
            </div>
            <div class=" row p-3 border-bottom border-secondary" style="margin: auto">
                <div class="col-md-4"> Email : </div>
                <div class="col-md-6"> ${user.username}</div>
            </div>
            <div class=" row p-3 border-bottom border-secondary" style="margin: auto">
                <div class="col-md-4"> Date of Birth : </div>
                <div class="col-md-6"> ${user.dob}</div>
            </div>
            <div class=" row p-3 border-bottom border-secondary" style="margin: auto">
                <div class="col-md-4"> Phone : </div>
                <div class="col-md-6"> ${user.phone}</div>
            </div>
            <div class=" row p-3 border-bottom border-secondary" style="margin: auto">
                <div class="col-md-4"> Address : </div>
                <div class="col-md-6"> ${user.address}</div>
            </div>
        </div>




</div>

</div>



<div id="myModal" class="modal fade" role="dialog">
    <div class="modal-dialog">

        <!-- Modal content-->
        <div class="modal-content">
            <div class="modal-header">

                <h4 class="modal-title">Modal Header</h4>
                <button type="button" class="close" data-dismiss="modal">&times;</button>
            </div>
            <div class="modal-body">
                <g:form class="row rounded" method="POST" controller="profile" action="changePassword">
                    <g:textField name="currpass" id="currpass" placeholder="current password" type="password" /><br>
                    <g:textField name="newpass" id="newpass" placeholder="new password" type="password" /><br>
                    <g:submitButton name="Submit" type="submit"/>
                </g:form>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
            </div>
        </div>

    </div>
</div>

</body>
</html>