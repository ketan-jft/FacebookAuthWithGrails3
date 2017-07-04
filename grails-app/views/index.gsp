<!doctype html>
<html>
<head>
    <meta name="layout" content="main"/>
    <title>Social Plugin</title>
    <asset:link rel="icon" href="favicon.ico" type="image/x-ico" />
</head>
<body>
<div id="fb-root"></div>
        <section class="row colset-2-its">
            <asset:javascript src="socialJS/facebook.js" />
            <center>
                <div id="status" style="font-size: 15px" class="label label-warning">
                </div>
            </center>
            <br>
            <g:form controller="user" action="save" method="POST">
                <input type="hidden" id="emailId" name="emailId">
                <input type="hidden" id="fullName" name="fullName">
                <input type="hidden" id="userName" name="userName">
                <input type="hidden" id="homePage" name="homePage">
                <input type="hidden" id="password" name="password">
            </g:form>
            <div class="container" onload="testAPI()">
                <div class="kpx_login">
                    <h3 class="kpx_authTitle">Login</h3>
                    <div class="row kpx_row-sm-offset-3 kpx_socialButtons">
                        <center class="col-xs-12 col-sm-12">
                            <div id="f" class="fb-login-button" data-max-rows="1" data-size="large"
                                 data-button-type="continue_with" data-show-faces="false"
                                 data-auto-logout-link="false" data-use-continue-as="true"></div>

                            <a href="#" onclick="document.forms[0].submit();" id="fbimage" class="btn btn-primary">
                                <h5 id="fn">Continue With </h5> <i id="fbi" class="fa fa-facebook fa-2x"></i>
                                <span class="hidden-xs"></span>
                            </a>
                        </center>
                    </div><br>
                    <div class="row kpx_row-sm-offset-3 kpx_loginOr">
                        <div class="col-xs-12 col-sm-6">
                            <hr class="kpx_hrOr">
                            <span class="kpx_spanOr">or</span>
                        </div>
                    </div>
                </div>
            </div>
            <script>
                $(function () {
                    $('[data-toggle="tooltip"]').tooltip()
                })
            </script>

            <div class="container-fluid">
                <div class="row">
                    <div class="col-lg-6 col-lg-offset-3" style="border: thick solid #4D8618; padding: 10px">
                        <g:form controller="user" action="login" method="POST" class="kpx_loginForm form-group">
                            <div class="col-lg-12">
                            <div class="input-group">
                                <span class="input-group-addon"><span class="fa fa-user"></span></span>
                                <input type="text" class="form-control" name="userName" placeholder="Username">
                            </div><br>
                            <div class="input-group">
                                 <span class="input-group-addon"><span class="fa fa-key"></span></span>
                                 <input  type="password" class="form-control" name="password" placeholder="Password">
                            </div><br>
                            </div>
                            <div class="col-lg-6 col-lg-offset-3">
                                <button class="btn btn-primary btn-block" type="submit">
                                    <i class="fa fa-sign-in"></i> Login
                                </button>
                            </div>
                            <g:if test="${flash.message}">
                                <div class="message label label-warning" role="status">${flash.message}</div>
                            </g:if>
                        </g:form>
                    </div>
                </div>
            </div>

        </section>
    </div>
</body>
</html>