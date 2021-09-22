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

    <title>Admin Panel</title>

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

            <li class=" wrap-item">
                <g:link controller="admin"> User List</g:link>

            </li>

        </ul>
    </nav>



    <div id="content" role="main" class=" col-md-9 pt-3 ">

        <div class="row pb-5 pt-5" style="justify-content: space-between" >
            <div class="col-md-6"> <h1>User Profile</h1></div>
            <div id="searchbox" class="col" style="padding-left: 100px; ">
                <g:form id="searchopt" class="row">
                    <g:textField class='col-7' name="fullnames" id="fullnames" placeholder="search by username" />
                    <button class="col-3" type="submit" id="mybutton" onclick="finduser()" >Search</button>
                    <!--<input class="col-2" type="button" id = "mybutton" onclick="finduser()"/>-->
                </g:form>
            </div>

        </div>








        <div id="resultDiv">

            <g:render template="searchr" model="[list:data?data:alluser]" />
        </div>
    </div>

</div>




<script>
    function finduser(){
        event.preventDefault();
        //console.log($('#fullnames').val());
        $.ajax({
            url:"<g:createLink url="[action:'searchbyname',controller:'admin']" />",
            dataType: "text",
            method:"post",
            //data:  $('#searchopt').value(),
            data:  {value: $('#fullnames').val()},
            success: function(data) {
                console.log(data);

                $("#resultDiv").html(data)


            },
            error: function(xhr, status, error) {
                console.log(xhr.responseText)
                console.log(status)

                $( "#resultDiv" ).addClass( 'alert alert-info' ).append(xhr.responseText);
            }
        });
    }
</script>

</body>
</html>