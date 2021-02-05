<%--
    Document   : index
    Created on : 03 Fev. 2021, 19:14:21
    Author     : KOUASSI GILDAS BIENVENU
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
    "http://www.w3.org/TR/html4/loose.dtd">

<!-- Ne pas oublier cette ligne sinon tous les tags de la JSTL seront ignorés ! -->
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Gestionnaire d'utilisateurs</title>
      
        
    </head>
    <body>
        <h1>Gestionnaire d'utilisateurs</h1>


        <!-- Message qui s'affiche lorsque la page est appelé avec un paramètre http message -->
        <c:if test="${!empty param['message']}">
            <h2>Reçu message : ${param.message}</h2>
        </c:if>


        <h2>Menu de gestion des utilisateurs</h2>
        
        <ul class="navbar-nav">
            <li class="nav-item"><a class="nav-link" href="ServletUsers?action=listerLesUtilisateurs">Afficher/raffraichir la liste de tous les utilisateurs</a></li>
            <p>
        </ul>
            <h2>Liste des fonctionnalités à implémenter dans la Servlet (note : après chaque action cette page sera
                rappelée par la servlet avec la liste des utilisateurs raffraichie et un message de confirmation)</h2>
        <ol class="navbar-nav">
            <li class="nav-item dropdown"><a class="nav-link" href="ServletUsers?action=creerUtilisateursDeTest">Créer 4 utilisateurs de test</a></li>

            <li class="nav-item">Créer un utilisateur</li>
            <form action="ServletUsers" method="post">
                Nom : <input type="text" name="nom" class="col-md-6"/><br>
                Prénom : <input type="text" name="prenom" class="col-md-6"/><br>
                Login : <input type="text" name="login" class="col-md-6"/><br>
                <!-- Astuce pour passer des paramètres à une servlet depuis un formulaire JSP !-->
                <input type="hidden" name="action" value="creerUnUtilisateur"/>
                <input class="btn btn-primary" color="red" type="submit" value="Créer l'utilisateur" name="submit"/>
            </form>
<br><br><br>
            <li class="nav-item">Afficher les détails d'un utilisateur</li>
            <form action="ServletUsers" method="get">
                login : <input class="col-md-6" type="text" name="login"/><br>
                <input type="hidden" name="action" value="chercherParLogin"/>
                <input class="btn btn-primary" type="submit" value="Chercher" name="submit"/>
            </form>

<br><br><br>
            <li class="nav-item">Modifier les détails d'un utilisateur :</li>
            <form action="ServletUsers" method="post">
                Login : <input class="col-md-6" type="text" name="login"/><br>
                Nom : <input class="col-md-6" type="text" name="nom"/><br>
                Prénom : <input class="col-md-6" type="text" name="prenom"/><br>
                <input type="hidden" name="action" value="updateUtilisateur"/>
                <input class="btn btn-primary" type="submit" value="Mettre à jour" name="submit"/>
            </form>
            <br><br><br><br>
            <li class="nav-item">Supprimer les détails d'un utilisateur</li>
            <form action="ServletUsers" method="get">
                login : <input class="col-md-6" type="text" name="login"/><br>
                <input type="hidden" name="action" value="supprimerUtilisateur"/>
                <input class="btn btn-primary" type="submit" value="Supprimer" name="submit"/>
            </form>
        </ol>

        <!-- Fin du menu -->

        <!-- Zone qui affiche les utilisateurs si le paramètre action vaut listerComptes -->
        <c:if test="${param['action'] == 'listerLesUtilisateurs'}" >
            <br><br><br><h2>Liste des utilisateurs</h2>

            <table class="table">
                <!-- La ligne de titre du tableau des comptes -->
                <tr>
                    <th scope="col"><b>Login</b></th>
                    <th scope="col"><b>Nom</b></th>
                    <th scope="col"><b>Prénom</b></th>
                </tr>

                <!-- Ici on affiche les lignes, une par utilisateur -->
                <!-- cette variable montre comment on peut utiliser JSTL et EL pour calculer -->
                <c:set var="total" value="0"/>

                <c:forEach var="u" items="${requestScope['listeDesUsers']}">
                    <tr>
                        <td>${u.login}</td>
                        <td>${u.firstName}</td>
                        <td>${u.lastName}</td>
                        <!-- On compte le nombre de users -->
                        <c:set var="total" value="${total+1}"/>
                    </tr>
                </c:forEach>

                <!-- Affichage du solde total dans la dernière ligne du tableau -->
                <tr><td><b>TOTAL</b></td><td></td><td><b>${total}</b></td><td></td></tr>
            </table>

        </c:if>
    </body>
</html>
