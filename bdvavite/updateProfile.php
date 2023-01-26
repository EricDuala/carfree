<?php
include 'connexion.php';
	
$mail= $_POST['mail'];
$nom = $_POST['nom'];
$prenom = $_POST['prenom'];
$type_role = $_POST['type_role'];
$tel = $_POST['tel'];
$pass = $_POST['password'];

$requete="UPDATE utilisateur\n"

. "SET nomUser = \"".$nom."\", prenUser = \"".$prenom."\", telUser=\"".$tel."\", type_role=\"".$type_role."\", passUser = \"".$pass."\" WHERE mailUser = \"".$mail."\"";



$result=mysqli_query($db,$requete);
$nbLignes=mysqli_num_rows($result);

if ($nbLignes)
    echo json_encode("Succes");
else{
    echo json_encode("Erreur");
    
}

include 'deconnexion.php';

?>