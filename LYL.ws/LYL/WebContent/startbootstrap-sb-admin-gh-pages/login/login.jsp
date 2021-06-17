<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
Cookie[] ckArr = request.getCookies();

String ck_value = "";
if (ckArr != null) {
	for (int i = 0; i < ckArr.length; i++) {
		String name = ckArr[i].getName();
		if (name.equals("ck_userid")) {
	ck_value = ckArr[i].getValue();
	break;
		}
	}
}
%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no" />
<meta name="description" content="" />
<meta name="author" content="" />
<title>Login</title>
<link href="../css/styles.css" rel="stylesheet" />
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/js/all.min.js"
	crossorigin="anonymous"></script>
<script type="text/javascript" src="../js/jquery-3.6.0.min.js"></script>
<script type="text/javascript">
	$(function() {
		$('form[name=frmlogin]').submit(function() {
			$('.inte').find('input').each(function(idx, item) {
				if ($(this).val().length < 1) {
					alert($(this).next().text() + '을(를)입력하세요');
					$(item).focus();
					event.preventDefault();
					return false;
				}
				;
			});
		});
	});
</script>
</head>
<body class="bg-primary">
	<div id="layoutAuthentication">
		<div id="layoutAuthentication_content">
			<main>
				<div class="container">
					<div class="row justify-content-center">
						<div class="col-lg-5">
							<div class="card shadow-lg border-0 rounded-lg mt-5">
								<div class="card-header">
									<h3 class="text-center font-weight-light my-4">Login</h3>
								</div>
								<div class="card-body">
									<form name="frmlogin" method="post" action="login_ok.jsp">
										<div class="form-floating mb-3 inte">
											<input class="form-control " id="inputid" type="text"
												placeholder="userid" name="userid" value="<%=ck_value%>"/> <label for="inputid">ID</label>
										</div>
										<div class="form-floating mb-3 inte">
											<input class="form-control" id="inputPassword"
												type="password" placeholder="Password" name="pwd" /> <label
												for="inputPassword">Password</label>
										</div>
										<div class="form-check mb-3">
											<input class="form-check-input" id="inputRememberPassword"
												type="checkbox" value="" name="chkbox"
												<%if (ck_value != null && !ck_value.isEmpty()) {%>
												checked="checked" 
												<%};%> /> 
												<label class="form-check-label" for="inputRememberPassword">Remember
												Password</label>
										</div>
										<div
											class="d-flex align-items-center justify-content-between mt-4 mb-0">
											<a class="small" href="password.html">Forgot Password?</a> <input
												type="submit" class="btn btn-primary" value="Login">
										</div>
									</form>
								</div>
								<div class="card-footer text-center py-3">
									<div class="small">
										<a href="register.jsp">Need an account? Sign up!</a>
										<br>
										<a href="../main/main.jsp">go main</a>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</main>
		</div>
		<div id="layoutAuthentication_footer">
			<footer class="py-4 bg-light mt-auto">
				<div class="container-fluid px-4">
					<div
						class="d-flex align-items-center justify-content-between small">
						<div class="text-muted">Copyright &copy; Your Website 2021</div>
						<div>
							<a href="#">Privacy Policy</a> &middot; <a href="#">Terms
								&amp; Conditions</a>
						</div>
					</div>
				</div>
			</footer>
		</div>
	</div>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/js/bootstrap.bundle.min.js"
		crossorigin="anonymous"></script>
	<script src="js/scripts.js"></script>
</body>
</html>
