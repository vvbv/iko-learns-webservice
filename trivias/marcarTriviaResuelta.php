<?php
    include '../config.php';
    //header('Content-Type: application/json; charset=ISO-8859-1');

    // Consulta
    if(isset($_GET["id_usuario"]) && isset($_GET["id_trivia"])){

        $id_usuario = 'id_usuario';
        $id_trivia = 'id_trivia';

		$sql = "INSERT INTO `trivias_solo_resueltas` (`ìd`,`id_usuario`,`id_trivia`) VALUES('NULL','$id_usuario','$id_trivia')";
	}
?>

