<?php
    include '../config.php';
    header('Content-Type: application/json; charset=ISO-8859-1');
    // Consulta
    $sql = "SELECT * FROM `trivias` ORDER BY RAND() LIMIT 1";
    $result = $conn->query($sql);
    //Manejo de resultados
    $retorno = $result->fetch_assoc();

    // Resolución de la llave foranea: Opcion_a
    $sql = "SELECT * FROM `palabras` WHERE `id` = '" . $retorno['opcion_a'] . "'";
    $result_opcion_a = $conn->query($sql);
    $opcion_a = $result_opcion_a->fetch_assoc();

    // Resolución de la llave foranea: Opcion_b
    $sql = "SELECT * FROM `palabras` WHERE `id` = '" . $retorno['opcion_b'] . "'";
    $result_opcion_b = $conn->query($sql);
    $opcion_b = $result_opcion_b->fetch_assoc();

    // Resolución de la llave foranea: Opcion_c
    $sql = "SELECT * FROM `palabras` WHERE `id` = '" . $retorno['opcion_c'] . "'";
    $result_opcion_c = $conn->query($sql);
    $opcion_c = $result_opcion_c->fetch_assoc();

    // Resolución de la llave foranea: Opcion_d
    $sql = "SELECT * FROM `palabras` WHERE `id` = '" . $retorno['opcion_d'] . "'";
    $result_opcion_d = $conn->query($sql);
    $opcion_d = $result_opcion_d->fetch_assoc();

    // Resolución de la llave foranea: Respuesta_correcta
    $sql = "SELECT * FROM `palabras` WHERE `id` = '" . $retorno['respuesta_correcta'] . "'";
    $result_respuesta_correcta = $conn->query($sql);
    $respuesta_correcta = $result_respuesta_correcta->fetch_assoc();

    echo json_encode(
        array(
            'id' => $retorno['id'],
            'pregunta' =>  utf8_encode((string)$retorno['pregunta']),
            'opcion_a' => $opcion_a['palabra_ingles'],
            'opcion_b' => $opcion_b['palabra_ingles'],
            'opcion_c' => $opcion_c['palabra_ingles'],
            'opcion_d' => $opcion_d['palabra_ingles'],
            'respuesta_correcta' => $respuesta_correcta['palabra_ingles'],
        )
    );

?>
