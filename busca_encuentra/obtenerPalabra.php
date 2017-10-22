<?php
    include '../config.php';
    header('Content-Type: text/html; charset=ISO-8859-1');
    // Consulta
    $sql = "SELECT * FROM `palabras` ORDER BY RAND() LIMIT 1";
    $result = $conn->query($sql);
    //Manejo de resultados
    $retorno = $result->fetch_assoc();

    echo json_encode(
        array(
            'id' => $retorno['id'],
            'palabra' => $retorno['palabra_ingles'],
            'palabra_yolo' => $retorno['palabra_ingles_yolo']
        )
    );
?>