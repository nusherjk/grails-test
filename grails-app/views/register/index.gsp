<html>
<head>
    <meta name="layout" content="${gspLayout ?: 'main'}"/>
    <title>Register</title>


    <style type="text/css">
        .form-custom {
            padding: 5px 10px;

            border-radius: 5px;

        }
        .custom-group {
            display: flex;
            justify-content: space-between;
        }
    </style>
</head>

<body>

<div id="content" role="main">
    <section class="row colset-2-its">
        <h1>Registration</h1>
    </section>
<div class="row">
    <div class="col-sm-9 col-md-7 col-lg-5 mx-auto">
        <div class="card card-signin my-5">
            <div class="card-body">
                <h5 class="card-title text-center">Register Here</h5>
                <g:if test='${flash.message}'>
                    <div class="alert alert-danger" role="alert">${flash.message}</div>
                </g:if>
                <form class="form-signin" action="register" method="POST" id="loginForm" autocomplete="off">


                    <div class="form-group custom-group">
                        <label for="username">Email</label>
                        <input type="text" placeholder="Your Email" class="form-custom"  name="username" id="username" autocapitalize="none" onchange="emailcheck()"/>

                    </div>
                    <div class="custom-group">
                        <p id="warn"></p>
                    </div>

                    <div class="form-group custom-group">
                        <label for="password">Password</label>
                        <input type="password" placeholder="Your password" class="form-custom" name="password" id="password"/>
                    </div>

                    <div class="form-group custom-group">
                        <label for="password">Re-Enter Password</label>
                        <input type="password" placeholder="Re-enter password" class="form-custom" name="repassword" id="repassword"/>
                    </div>

                    <div class="form-group custom-group">
                        <label for="firstname">First Name</label>
                        <input type="text" placeholder="Your first name" class="form-custom" name="firstname" id="firstname" autocapitalize="none"/>
                    </div>
                    <div class="form-group custom-group">
                        <label for="lastname">Last Name</label>
                        <input type="text" placeholder="Your last name" class="form-custom" name="lastname" id="lastname" autocapitalize="none"  />
                    </div>
                    <div class="form-group custom-group">
                        <label for="dob">Birth date:</label>
                        <input type="date" id="dob" name="dob" class="form-custom"  autocapitalize="none"  >
                    </div>
                    <div class="form-group custom-group">
                        <label for="phone">Phone Number</label>
                        <input type="text" placeholder="Phone Number" class="form-custom" name="phone" id="phone" autocapitalize="none"/>
                    </div>
                    <div class="form-group custom-group">
                        <label for="address"> Address</label>
                        <input type="text" placeholder="Address" class="form-custom" name="address" id="address" autocapitalize="none"/>
                    </div>


                    <button id="submit" class="btn btn-lg btn-primary btn-block text-uppercase" type="submit">Register</button>
                    <hr class="my-4">
                    <p>Already have an account? <g:link controller="login" action="auth">Login</g:link></p>
                </form>
            </div>
        </div>
    </div>
</div>
</div>
<script type="text/javascript">



   function emailcheck (){

            $.ajax({
                url:"<g:createLink url="[action:'checkSameEmail',controller:'register']" />",
                dataType: "json",
                method:"post",
                data:  {value: $('#username').val()},
                success: function(data) {
                    console.log(data)
                    if(data["data"] == "invalid"){
                        $("#warn").text('Email already in use.')
                    }
                    else{
                        $("#warn").text('')
                    }
                    //$(".alert alert-danger").load(document.URL + " .alert alert-danger")

                },
                error: function(xhr, status, error){
                    console.log(error)
                    $("#warn").text("This email is already in use but dont know")
                }
                });

        }

</script>
</body>
</html>