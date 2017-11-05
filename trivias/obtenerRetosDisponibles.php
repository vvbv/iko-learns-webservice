<?php

    include '../config.php';
    header('Content-Type: application/json; charset=ISO-8859-1');

    $sql = "SELECT * FROM `trivias_retos` WHERE `id_usuario_retado` IS NULL";
    $result = $conn->query($sql);
    $retos = array();

    while($row = $result->fetch_assoc()){
        $reto = array(
            'id_reto' => $row['id'],
            'id_retador' => $row['id_retador']
        );
        array_push($retos, $reto);
    }

    echo json_encode($retos);

?>