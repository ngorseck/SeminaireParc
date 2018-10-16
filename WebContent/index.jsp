<!DOCTYPE html>
<html lang="en">
<head>
	<title>Login</title>
	<meta charset="UTF-8"/>
	<meta name="viewport" content="width=device-width, initial-scale=1"/>
<!--===============================================================================================-->	
	<link rel="icon" type="image/png" href="./public/images/icons/favicon.ico"/>
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="./public/vendor/bootstrap/css/bootstrap.min.css"/>
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="./public/fonts/font-awesome-4.7.0/css/font-awesome.min.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="./public/fonts/iconic/css/material-design-iconic-font.min.css"/>
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="./public/vendor/animate/animate.css"/>
<!--===============================================================================================-->	
	<link rel="stylesheet" type="text/css" href="./public/vendor/css-hamburgers/hamburgers.min.css"/>
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="./public/vendor/animsition/css/animsition.min.css"/>
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="./public/vendor/select2/select2.min.css"/>
<!--===============================================================================================-->	
	<link rel="stylesheet" type="text/css" href="./public/vendor/daterangepicker/daterangepicker.css"/>
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="./public/css/util.css"/>
	<link rel="stylesheet" type="text/css" href="./public/css/main.css"/>
	<link rel="stylesheet" type="text/css" href="./public/css/bootstrap.min.css"/>
<!--===============================================================================================-->
</head>
<body>
	
	<div class="limiter">
		<div class="container-login100">
			<div class="wrap-login100 p-t-85 p-b-20">
				<form method="POST" action="User" class="login100-form validate-form">
					<!-- span class="login100-form-title p-b-70">
						Welcome
					</span>
					<span class="login100-form-avatar">
						<img src="./public/images/avatar-01.jpg" alt="AVATAR">
					</span-->
					<%
						if(request.getAttribute("message") != null) {
							String msg = "<div class='alert alert-danger'>" +
												request.getAttribute("message") +
										  "</div>";
							out.print(msg);
						}
					%>
					<div class="wrap-input100 validate-input m-t-85 m-b-35" data-validate = "Entrer votre email">
						<input class="input100" type="email" name="email"/>
						<span class="focus-input100" data-placeholder="Email"></span>
					</div>

					<div class="wrap-input100 validate-input m-b-50" data-validate="Entrer votre mot de passe">
						<input class="input100" type="password" name="password">
						<span class="focus-input100" data-placeholder="Mot de passe"></span>
					</div>

					<div class="container-login100-form-btn">
						<input type="submit" value="Login" class="login100-form-btn"/>
					</div>

					<!-- ul class="login-more p-t-190">
						<li class="m-b-8">
							<span class="txt1">
								Forgot
							</span>

							<a href="#" class="txt2">
								Username / Password?
							</a>
						</li>

						<li>
							<span class="txt1">
								Don’t have an account?
							</span>

							<a href="#" class="txt2">
								Sign up
							</a>
						</li>
					</ul-->
				</form>
			</div>
		</div>
	</div>
	

	<div id="dropDownSelect1"></div>
	
<!--===============================================================================================-->
	<script src="./public/vendor/jquery/jquery-3.2.1.min.js"></script>
<!--===============================================================================================-->
	<script src="./public/vendor/animsition/js/animsition.min.js"></script>
<!--===============================================================================================-->
	<script src="./public/vendor/bootstrap/js/popper.js"></script>
	<script src="./public/vendor/bootstrap/js/bootstrap.min.js"></script>
<!--===============================================================================================-->
	<script src="./public/vendor/select2/select2.min.js"></script>
<!--===============================================================================================-->
	<script src="./public/vendor/daterangepicker/moment.min.js"></script>
	<script src="./public/vendor/daterangepicker/daterangepicker.js"></script>
<!--===============================================================================================-->
	<script src="./public/vendor/countdowntime/countdowntime.js"></script>
<!--===============================================================================================-->
	<script src="./public/js/main.js"></script>

</body>
</html>