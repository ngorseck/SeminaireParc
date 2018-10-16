<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
		<title>Gestion des serveurs</title>
		<link rel="stylesheet" type="text/css" href="./public/css/bootstrap.min.css"/>
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
		<div class="container col-md-8">
			<div class="panel panel-primary">
				<div class="panel-heading">Liste des serveurs</div>
				<div class="panel-body">
					<table class="table table-bordered table-striped">
						<tr>
							<th>Identifiant du serveur</th>
							<th>Nom du serveur</th>
							<th>Adresse ip du serveur</th>
							<th>Salle du serveur</th>
							<th>Action</th>
							<th>Action</th>
						</tr>
						<c:if test="${serveurs != null }">
							<c:forEach items="${serveurs }" var="serveur">
								<tr>
									<td>${serveur.idServ }</td>
									<td>${serveur.nomServ }</td>
									<td>${serveur.adripServ }</td>
									<td>${serveur.salleServ }</td>
									<td><a href="Serveur?page=edit&idServ=${serveur.idServ }">Editer</a></td>
									<td><a href="Serveur?page=delete&idServ=${serveur.idServ }">Supprimer</a></td>
								</tr>
							</c:forEach>
						</c:if>
					</table>
				</div>
			</div>
		</div>
		<div class="container col-md-4 col-lg-4 col-sm-12 col-xs-12">
			<div class="panel panel-primary">
				<div class="panel-heading">Formulaire de gestion des serveurs</div>
				<div class="panel-body">
					<form method="POST" action="Serveur">
						<c:if test="${serveur != null }">
							<div class="form-group">
								<label class="control-label" for="id">Identifiant du serveur</label>
								<input class="form-control" type="text" name="id" id="id" readonly="readonly" value='<c:if test="${serveur != null }">${serveur.idServ}</c:if>' />
							</div>
						</c:if>
						<div class="form-group">
							<label class="control-label" for="nomServ">Nom du serveur</label>
							<input class="form-control" type="text" name="nomServ" id="nomServ" placeholder="Nom ici" value='<c:if test="${serveur != null }">${serveur.nomServ}</c:if>' />
						</div>
						<div  class="form-group">
							<label class="control-label" for="adripServ">Adresse ip du serveur</label>
							<input class="form-control" type="text" name="adripServ" id="adripServ" placeholder="adresse ip ici" value='<c:if test="${serveur != null }">${serveur.adripServ}</c:if>' />
						</div>
						<div  class="form-group">
							<label class="control-label" for="salleServ">Salle du serveur</label>
							<input class="form-control" type="text" name="salleServ" id="salleServ" placeholder="Salle ici" value='<c:if test="${serveur != null }">${serveur.salleServ}</c:if>' />
						</div>
						<div  class="form-group">
							<input class="btn btn-success" type="submit" name="valider" id="valider" value='<c:if test="${serveur != null }">Modifier</c:if><c:if test="${serveur == null }">Valider</c:if>' />
							<input class="btn btn-danger" type="reset" name="annuler" id="annuler" value="Annuler" />
						</div>
					</form>
				</div>
			</div>
		</div>
	</body>
</html>