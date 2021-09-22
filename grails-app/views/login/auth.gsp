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
        <h1>Login</h1>
    </section>
    <div class="row">
        <div class="col-sm-9 col-md-7 col-lg-5 mx-auto">
            <div class="card card-signin my-5">
                <div class="card-body">
                    <h5 class="card-title text-center">Please Login</h5>
                    <g:if test='${flash.message}'>
                        <div class="alert alert-danger" role="alert">${flash.message}</div>
                    </g:if>
                    <form class="form-signin" action="${postUrl ?: '/login/authenticate'}" method="POST" id="loginForm" autocomplete="off">
                        <div class="form-group">
                            <label for="username">Email</label>
                            <input type="text" class="form-control" name="${usernameParameter ?: 'username'}" id="username" autocapitalize="none"/>
                        </div>

                        <div class="form-group">
                            <label for="password">Password</label>
                            <input type="password" class="form-control" name="${passwordParameter ?: 'password'}" id="password"/>
                            <i id="passwordToggler" title="toggle password display" onclick="passwordDisplayToggle()">&#128065;</i>
                        </div>

                        <div class="form-group form-check">
                            <label class="form-check-label">
                                <input type="checkbox" class="form-check-input" name="${rememberMeParameter ?: 'remember-me'}" id="remember_me" <g:if test='${hasCookie}'>checked="checked"</g:if>/> Remember me
                            </label>
                        </div>
                        <button id="submit" class="btn btn-lg btn-primary btn-block text-uppercase" type="submit">Sign in</button>
                        <hr class="my-4">
                        <p>Don't have an account? <g:link controller="register">Register</g:link></p>
                    </form>
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