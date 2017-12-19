<?php
    include '../config.php';
    header('Content-Type: application/json; charset=UTF-8');
    // Consulta
    $sql = "SELECT * FROM `palabras`  WHERE palabra_ingles_yolo IS NOT NULL AND palabra_ingles_yolo != '' AND
palabra_ingles_yolo != 'null' ORDER BY
RAND()
LIMIT 1";
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
