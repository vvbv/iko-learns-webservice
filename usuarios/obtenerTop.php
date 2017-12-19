<?php
    include '../config.php';
    header('Content-Type: application/json; charset=ISO-8859-1');
    
    $sql = "SELECT * FROM puntos INNER JOIN usuarios ON usuarios.id = puntos.id_usuario ORDER BY puntos DESC";
    $result = $conn->query($sql);
    $top = array();
    while($row = $result->fetch_assoc()){
        array_push(
            $top, 
            array(
                'id_usuario' => $row['id_facebook'],
				'nombres' => $row['nombres'],
                'puntos' => $row['puntos']
            )
        );
    };

    echo json_encode($top);
        
?>
