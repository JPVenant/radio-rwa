<?php
// On active l'accès à la session
session_start();

// Formulaire de connexion
// Doit afficher en haut de page "Vous êtes connecté(e)" si le mail et le mot de passe sont bons.
// Doit afficher en haut de page "Email et/ou mot de passe invalide" si le mail et le mot de passe ne sont pas bons.

// On vérifie que $_POST existe et qu'il n'est pas vide.
if(isset($_POST) && !empty($_POST)){

    // On vérifie que tous les champs sont remplis
    if(isset($_POST['email']) && !empty($_POST['email']) && isset($_POST['pass']) && !empty($_POST['pass'])){
        // On récupère les valeurs saisies
        $mail = strip_tags($_POST['email']);
        $pass = $_POST['pass'];

        // On vérifie si l'email existe dans la base de données
        // On se connecte à la base
        require_once('inc/bdd.php');

        // On écrit la requête
        $sql = 'SELECT * FROM `users` WHERE `email` = :email;';

        // On prépare la requête
        $query = $db->prepare($sql);

        // On injecte (terme scientifique) les valeurs
        $query->bindValue(':email', $mail, PDO::PARAM_STR);

        // On exécute la requête
        $query->execute();

        // On récupère les données
        $user = $query->fetch(PDO::FETCH_ASSOC);

        // Soit on a une réponse dans $user, soit non
        // On vérifie si on a une réponse
        if(!$user){
            echo 'Email et/ou mot de passe invalide';

        }else{
            // On vérifie que le mot de passe saisi correspond à celui en base
            // password_verify($passEnClairSaisi, $passBaseDeDonnees)
            if(password_verify($pass, $user['password'])){
                // On crée la session "user"
                // On ne stocke JAMAIS de données dont on ne maîtrise pas le contenu
                $_SESSION['user'] = [
                    'id'    => $user['id'],
                    'email' => $user['email'],
                    'pseudo'  => $user['pseudo']
                ];

                header('Location: index.php');
            }else{
                echo 'Email et/ou mot de passe invalide';
            }
        }

    }else{
        echo "Veuillez remplir tous les champs...";
    }
}

include_once('inc/header.php');
?>
<div class="container-fluid">
<div class="row">
       
<div class="col-12 my-1">
    <h3>Connexion au t'chat</h3>
    <form method="post">
        <div class="form-group">
            <label for="email">E-mail :</label>
            <input class="form-control" type="email" id="email" name="email">
        </div>
        <div class="form-group">
            <label for="pass">Mot de passe :</label>
            <input class="form-control" type="password" id="pass" name="pass">
        </div>
        <div class="py-3" >
        <button class="btn btn-danger btn-lg">C'est parti pour le t'chat <svg xmlns="http://www.w3.org/2000/svg" width="18" height="18" fill="currentColor" class="bi bi-check-circle" viewBox="0 0 16 16">
  <path d="M8 15A7 7 0 1 1 8 1a7 7 0 0 1 0 14zm0 1A8 8 0 1 0 8 0a8 8 0 0 0 0 16z"/>
  <path d="M10.97 4.97a.235.235 0 0 0-.02.022L7.477 9.417 5.384 7.323a.75.75 0 0 0-1.06 1.06L6.97 11.03a.75.75 0 0 0 1.079-.02l3.992-4.99a.75.75 0 0 0-1.071-1.05z"/></button></div>
    </form>
</div>

</div>
</div>
<?php
include_once('inc/footer.php');
