<?php

    include '../config.php';
    header('Content-Type: application/json; charset=ISO-8859-1');

	if($_GET['puntajePara'] == 'retador'){
		$sql = "UPDATE `trivias_retos` SET `puntaje_retador` = ".$_GET['puntaje']." WHERE `id` = '".$_GET['id']."'";
		$result = $conn->query($sql);
	}
	
	if($_GET['puntajePara'] == 'retado'){
		$sql = "UPDATE `trivias_retos` SET `puntaje_retado` = ".$_GET['puntaje']." WHERE `id` = '".$_GET['id']."'";
		$result = $conn->query($sql);
	}
	
    $reto = json_encode(
                array(
                        'codigo' => 0,
                        'mensaje' => ""
                )
            );

    echo $reto;

?>