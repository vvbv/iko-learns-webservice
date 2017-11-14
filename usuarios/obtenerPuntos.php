<?php
    include '../config.php';
    header('Content-Type: application/json; charset=ISO-8859-1');

	//  Consulta del INNER JOIN
 	$consulta_mysql="select usuarios.id_facebook,puntos.puntos
                     from usuarios inner join puntos on usuarios.id=puntos.id_usuario order by puntos desc";

 	$resultado_consulta_mysql= $conn->query($consulta_mysql);
    $puntos = array();

    while($row = $resultado_consulta_mysql->fetch_assoc()){
        //Manejo de resultados
        $punto = array(
            'id' => $row['id_facebook'],
            'puntos' => $row['puntos']
	    );
        array_push($puntos, $punto);
	} 

    echo json_encode($puntos);
    
?>

