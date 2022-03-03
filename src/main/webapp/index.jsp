<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en">
 <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
  
    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
<head>
<meta charset="ISO-8859-1">
<style type="text/css"></style>
<title>Login SystemIo</title>
<link rel="stylesheet" type="text/css" href="style.css" />
</head>
<body>


<form action="ServeletLogin" method="post" class="row-g-3 needs-validation" novalidate>
	<h2 class = "h1tittle">SystemIo</h2>
<input type="hidden" value="<%= request.getParameter("url") %>" name = "url">

  <div class="row mb-3">
    <label class="col-sm-2 col-form-label">Login</label>
    <input name = "login" type="text" class="form-control" id="inputEmail3" required="required">
    <div class = "invalid-feedback">
    	Obrigatório
    </div>
  </div>
  
  <div class="row mb-3">
    <label class="col-sm-2 col-form-label">Senha</label>
    <input name = "senha" type="password" class="form-control" id="inputPassword3" required="required">
    <div class = "invalid-feedback">
    	Obrigatório
    </div>
   </div>
	  <div class="row mb-3">
	
	 <input type = "submit" class="btn btn-primary" value = "enviar">
	</div>
		<h6 style="color: rgb(128, 0, 0)">${msg}</h6>
	</form>
	
	
<!-- Option 1: Bootstrap Bundle with Popper -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
	<script type="text/javascript">
	// Example starter JavaScript for disabling form submissions if there are invalid fields
(function () {
  'use strict'

  // Fetch all the forms we want to apply custom Bootstrap validation styles to
  var forms = document.querySelectorAll('.needs-validation')

  // Loop over them and prevent submission
  Array.prototype.slice.call(forms)
    .forEach(function (form) {
      form.addEventListener('submit', function (event) {
        if (!form.checkValidity()) {
          event.preventDefault()
          event.stopPropagation()
        }

        form.classList.add('was-validated')
      }, false)
    })
})()
	</script>
</body>
</html>