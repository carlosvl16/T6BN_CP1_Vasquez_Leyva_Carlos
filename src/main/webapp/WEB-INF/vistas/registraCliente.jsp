<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c" %>
<!DOCTYPE html>
<html lang="esS" >
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no">
<script type="text/javascript" src="js/jquery.min.js"></script>
<script type="text/javascript" src="js/bootstrap.min.js"></script>
<script type="text/javascript" src="js/bootstrapValidator.js"></script>
<link rel="stylesheet" href="css/bootstrap.css"/>
<link rel="stylesheet" href="css/bootstrapValidator.css"/>

<title>Registra Cliente</title>
</head>
<body>

<div class="container">
<h1>Registra Cliente</h1>

	<c:if test="${sessionScope.MENSAJE != null}">
		<div class="alert alert-success fade in" id="success-alert">
		 <a href="#" class="close" data-dismiss="alert">&times;</a>
		 <strong>${sessionScope.MENSAJE}</strong>
		</div>
	</c:if>
	<c:remove var="MENSAJE" />

	<form action="registraCliente" id="id_form" method="post"> 
			<input type="hidden" name="metodo" value="registra">	
			<div class="form-group">
				<label class="control-label" for="nom_cliente">Nombre</label>
				<input class="form-control" type="text" id="nom_cliente" name="nom_cliente" placeholder="Ingrese el nombre">
			</div>
			<div class="form-group">
				<label class="control-label" for="ape_cliente">Apellido</label>
				<input class="form-control" id="ape_cliente" name="ape_cliente" placeholder="Ingrese el apellido" type="text"/>
			</div>
			<div class="form-group">
				<label class="control-label" for="dni_docente">DNI</label>
				<input class="form-control" id="dni_docente" name="dni_docente" placeholder="Ingrese el DNI" maxlength="8"/>
			</div>
			<div class="form-group">
				<label class="control-label" for="fec_nac_cliente">Fecha de Nacimiento</label>
				<input class="form-control" id="fec_nac_cliente" name="fec_nac_cliente" placeholder="Ingrese la fecha de nacimiento" type="date"/>
			</div>
			<div class="form-group">
				<label class="control-label" for="cod_tipo">Tipo</label>
				<select id="cod_tipo" name="tipo.cod_tipo" class='form-control'>
					<option value=" ">[Seleccione]</option>    
				</select>
		    </div>
			<div class="form-group">
				<button type="submit" class="btn btn-primary" >Crea Cliente</button>
			</div>
	</form>
</div>

<script type="text/javascript">
console.log("inicio");
$.getJSON("cargaTipo", {}, function(data){
	console.log("inicio2");
	$.each(data, function(index,item){
		$("#cod_tipo").append("<option value="+item.cod_tipo +">"+ item.nom_tipo +"</option>");
	});
});
</script>

<script type="text/javascript">
$("#success-alert").fadeTo(1000, 500).slideUp(500, function(){
    $("#success-alert").slideUp(500);
});
</script>

<script type="text/javascript">

$('#id_form').bootstrapValidator({
    message: 'This value is not valid',
    feedbackIcons: {
        valid: 'glyphicon glyphicon-ok',
        invalid: 'glyphicon glyphicon-remove',
        validating: 'glyphicon glyphicon-refresh'
    },
    fields: {
    	nom_cliente: {
    		selector : '#nom_cliente',
            validators: {
                notEmpty: {
                    message: 'El nombre es un campo obligatorio'
                },
                stringLength :{
                	message:'El nombre es de 3 a 40 caracteres',
                	min : 3,
                	max : 40
                }
            }
        },
        ape_cliente: {
    		selector : '#ape_cliente',
            validators: {
                notEmpty: {
                    message: 'El apellido es un campo obligatorio'
                },
                stringLength :{
                	message:'El nombre es de 3 a 40 caracteres',
                	min : 3,
                	max : 40
                }
            }
        },
        dni_docente: {
    		selector : '#dni_docente',
            validators: {
            	notEmpty: {
                    message: 'El DNI un campo obligatorio'
                },
                regexp: {
					regexp: /^[0-8]+$/,
					message: 'El DNI solo puede contener números'
                    }
            }
        },
        fec_nac_cliente: {
    		selector : '#fec_nac_cliente',
            validators: {
            	notEmpty: {
                    message: 'La fecha un campo obligatorio'
                },
                date: {
					formato: 'YYYY-MM-DD',
                    }
            }
        },
        tipo: {
    		selector : '#cod_tipo',
            validators: {
            	notEmpty: {
                    message: 'El tipo un campo obligatorio'
                },
            }
        },
    	
    }   
});
</script>

<script type="text/javascript">
$("#success-alert").fadeTo(2000, 500).slideUp(500, function(){
    $("#success-alert").slideUp(500);
});
</script>

</body>
</html>




