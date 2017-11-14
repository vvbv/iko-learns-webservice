<?php
    include '../config.php';

    // Consulta
	if(isset($_GET["id_usuario"]) && isset($_GET["id_trivia"])){
		$id_usuario = $_GET['id_usuario']; 
		$id_trivia = $_GET['id_trivia'];

		//verificamos que esta trivia no se halla completado antes.
		$sql = "SELECT * 
		FROM `trivias_solo_resueltas` 
		WHERE `id_usuario` = '$id_usuario' and `id_trivia` = '$id_trivia'";
        
        $result = $conn->query($sql);

        if($result->fetch_assoc() == null){
			$sql = "INSERT INTO `trivias_solo_resueltas` (`id_usuario`,`id_trivia`) VALUES('$id_usuario','$id_trivia')";
			$conn->query($sql);
		}
	}else{}
?>