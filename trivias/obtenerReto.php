<?php

    include '../config.php';
    header('Content-Type: application/json; charset=ISO-8859-1');

    $sql = "SELECT * FROM `trivias_retos` WHERE `id` = '".$_GET['id']."'";
    $result = $conn->query($sql);
    $row = $result->fetch_assoc();
	
	$idRonda1 = $row['id_ronda_1'];
    $idRonda2 = $row['id_ronda_2'];
    $idRonda3 = $row['id_ronda_3'];
    $idRonda4 = $row['id_ronda_4'];
    $idRonda5 = $row['id_ronda_5'];
	$puntajeRetador = $row['puntaje_retador'];
	$puntajeRetado = $row['puntaje_retado'];
	
	$sql = "SELECT * FROM trivias t WHERE id = '$idRonda1'";
    $result = $conn->query($sql);
    $row = $result->fetch_assoc();
    $datosRonda1Array = array_map("utf8_encode", $row );
    $datosRonda1 = json_encode($datosRonda1Array);

    $sql = "SELECT * FROM trivias WHERE id = '$idRonda2'";
    $result = $conn->query($sql);
    $row = $result->fetch_assoc();
    $datosRonda2Array = array_map("utf8_encode", $row );
    $datosRonda2 = json_encode($datosRonda2Array);

    $sql = "SELECT * FROM trivias WHERE id = '$idRonda3'";
    $result = $conn->query($sql);
    $row = $result->fetch_assoc();
    $datosRonda3Array = array_map("utf8_encode", $row );
    $datosRonda3 = json_encode($datosRonda3Array);

    $sql = "SELECT * FROM trivias WHERE id = '$idRonda4'";
    $result = $conn->query($sql);
    $row = $result->fetch_assoc();
    $datosRonda4Array = array_map("utf8_encode", $row );
    $datosRonda4 = json_encode($datosRonda4Array);

    $sql = "SELECT * FROM trivias WHERE id = '$idRonda5'";
    $result = $conn->query($sql);
    $row = $result->fetch_assoc();
    $datosRonda5Array = array_map("utf8_encode", $row );
    $datosRonda5 = json_encode($datosRonda5Array);

    $reto = json_encode(
                array(
						'codError' => '0',
                        'error' => '',
                        'idReto' => $row['id'],
                        'ronda1' => $datosRonda1Array,
                        'ronda2' => $datosRonda2Array,
                        'ronda3' => $datosRonda3Array,
                        'ronda4' => $datosRonda4Array,
                        'ronda5' => $datosRonda5Array,
						'puntaje_retador' => $puntajeRetador,
						'puntaje_retado' => $puntajeRetado
                )
            );

    echo $reto;

?>