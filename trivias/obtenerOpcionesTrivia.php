<?php
    include '../config.php';
    header('Content-Type: application/json; charset=UTF-8');
    // Consulta
    $sql = "SELECT * FROM `palabras`  WHERE id = '".$_GET['id_a']."'";
    $result_a = $conn->query($sql);
    $retorno_a = $result_a->fetch_assoc();
	
	$sql = "SELECT * FROM `palabras`  WHERE id = '".$_GET['id_b']."'";
    $result_b = $conn->query($sql);
    $retorno_b = $result_b->fetch_assoc();
	
	$sql = "SELECT * FROM `palabras`  WHERE id = '".$_GET['id_c']."'";
    $result_c = $conn->query($sql);
    $retorno_c = $result_c->fetch_assoc();
	
	$sql = "SELECT * FROM `palabras`  WHERE id = '".$_GET['id_d']."'";
    $result_d = $conn->query($sql);
    $retorno_d = $result_d->fetch_assoc();
	
	$sql = "SELECT * FROM `palabras`  WHERE id = '".$_GET['id_correcta']."'";
    $result_correcta = $conn->query($sql);
    $retorno_correcta = $result_correcta->fetch_assoc();

    echo json_encode(
        array(
            'opcion_a' => $retorno_a['palabra_ingles'],
			'opcion_b' => $retorno_b['palabra_ingles'],
			'opcion_c' => $retorno_c['palabra_ingles'],
			'opcion_d' => $retorno_d['palabra_ingles'],
			'opcion_correcta' => $retorno_correcta['palabra_ingles']
        )
    );
?>
