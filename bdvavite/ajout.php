<?php

	include 'connexion.php';
	
	$date_depart= $_POST['date_depart'];
	$heure=$_POST['heure'];
    $lieu_depart=$_POST['lieu_depart'];
	$lieu_arrive=$_POST['lieu_arrive'];
	$nb_place = $_POST['nb_place'];
    $mail = $_POST['mail'];
	
	$requete="INSERT INTO transport (date_depart, heure, lieu_depart, nb_place, lieu_arrive) VALUES('".$date_depart."','".$heure."','".$lieu_depart."','".$lieu_arrive."','".$nb_place."', (SELECT idUser FROM utilisateur WHERE mailUser = '".$mail."'))";
	
	$result=mysqli_query($db,$requete);
	$nbLignes=mysqli_num_rows($result);
	
	if ($nbLignes)
		echo json_encode("Succes");
	else{
		echo json_encode("Erreur");
		
	}
	
	include 'deconnexion.php';
	
?>