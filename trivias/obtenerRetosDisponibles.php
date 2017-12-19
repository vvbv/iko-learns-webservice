<?php

    include '../config.php';
    header('Content-Type: application/json; charset=UTF-8');

    $sql = "SELECT * FROM `trivias_retos` WHERE `id_usuario_retado` IS NULL";
    $result = $conn->query($sql);
    $retos = array();

    while($row = $result->fetch_assoc()){
		
		$sql = "SELECT * FROM `usuarios` WHERE `id` = '".$row['id_usuario_retador']."'";
		$result2 = $conn->query($sql);
		$usuario = $result2->fetch_assoc();
		
        $reto = array(
            'id_reto' => $row['id'],
            'id_retador' => $usuario['id_facebook'],
			'nombres_retador' => $usuario['nombres']
        );
        array_push($retos, $reto);
    }

    echo json_encode($retos);

?>