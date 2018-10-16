<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
		<title>Gestion des services</title>
		<link rel="stylesheet" type="text/css" href="./public/css/bootstrap.min.css" />
	</head>
	<body>
		<div class="navbar navbar-default">
			<ul class="nav navbar-nav">
				<li>
					<a href="Serveur?page=liste">Gestion des serveurs</a>
				</li>
				<li>
					<a href="Service?page=liste">Gestion des services</a>
				</li>
				<li>
					<a href="Recherche">Recherche</a>
				</li>
			</ul>
		</div>
		
		<div class="container col-lg-8 col-md-8 col-sm-12 col-xs-12">
				<div class="panel panel-primary">
					<div class="panel-heading">Liste des services</div>
						<div class="panel-body">
							<table class="table table-bordered table-striped">
								<tr> 
									<th>Identifiant du service</th>
									<th>Nom du service</th>
									<th>Numéro de port du service</th>
									<th>Identifiant du serveur</th>
									<th>Action</th>
									<th>Action</th>
								</tr>
								<c:if test="${services != null }">
									<c:forEach items="${services }" var="service">
									<tr> 
										<td>${service.idS }</td>
										<td>${service.nomS }</td>
										<td>${service.port }</td>
										<td>${service.serveur.idServ }</td>
										<td><a href="Service?page=edit&idS=${service.idS }">Editer</a></td>
										<td><a href="Service?page=delete&idS=${service.idS }">Supprimer</a></td>
									</tr>
									</c:forEach>
								</c:if>
							</table>
						</div>
				</div>
			</div>
			<div class="container col-lg-4 col-md-4 col-sm-12 col-xs-12">
				<div class="panel panel-primary">
					<div class="panel-heading">Formulaire de gestion des services</div>
						<div class="panel-body">
						<form method="post" action="Service">
						<c:if test="${service !=null }">
					    <div class="form-group">
							<label class="control-label" for="nomS">Identifiant du service</label>
							<input class="form-control" type="text" name="id" id="id" readonly="readonly" value='<c:if test="${service != null}">${service.idS}</c:if>' />
						</div>
					    </c:if>
						<div class="form-group">
							<label class="control-label" for="nomS">Nom du service</label>
							<input class="form-control" type="text" name="nomS" id="nomS" placeholder="Nom ici" value='<c:if test="${service != null}">${service.nomS}</c:if>' />
						</div>
						<div class="form-group">
							<label class="control-label" for="port">Numéro de port du service</label>
							<input class="form-control" type="text" name="port" id="port" placeholder="Port ici" value='<c:if test="${service != null}">${service.port}</c:if>' />
						</div>
						<div class="form-group">
							<label class="control-label" for="serveur">Selectionnez un serveur</label>
							<select class="form-control" name="serveur" id="serveur">
								<option value="">Faites votre choix</option>
								<c:forEach items="${serveurs }" var="serveur">
									<option value="${serveur.idServ }">${serveur.nomServ }</option>
								</c:forEach>
							</select>
						</div>
						<div class="form-group">
							<input class="btn btn-success" type="submit" name="valider" id="valider" value='<c:if test="${service != null}">Modifier</c:if><c:if test="${service == null}">Valider</c:if>' />
							<input class="btn btn-danger" type="reset" name="annuler" id="annuler" value="Annuler" />
						</div> 
						</form>
					</div>
				</div>
			</div>
	</body>
</html>