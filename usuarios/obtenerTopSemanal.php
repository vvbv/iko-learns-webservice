<?php
    include '../config.php';
    header('Content-Type: application/json; charset=UTF-8');
    
    $sql = "SELECT * FROM puntos INNER JOIN usuarios ON usuarios.id = puntos.id_usuario  WHERE puntos.fecha_hora_Registro BETWEEN date_sub(now(),INTERVAL 1 WEEK) and now() ORDER BY puntos DESC";
    $result = $conn->query($sql);
    $top = array();
    while($row = $result->fetch_assoc()){
        array_push(
            $top, 
            array(
                'id_usuario' => $row['id_facebook'],
                'puntos' => $row['puntos']
            )
        );
    };

    echo json_encode($top);
        
?>
