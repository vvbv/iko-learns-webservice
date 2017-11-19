<?php 
  
    include '../config.php';
    require '../fx/funcionesExtra.php';
    header('Content-Type: application/json; charset=ISO-8859-1');

    $idUsuario = $_GET['id_facebook'];
    
    if(!isset($_GET['id_facebook'])){
        echo json_encode(
            array(
                'codError' => '-1', 
                'error' => 'id_facebook no definido.'
            )
        );
        die();
    }

    $sql = "SELECT * FROM usuarios WHERE id_facebook = '$idUsuario'";
    $result = $conn->query($sql);
    $usuario = $result->fetch_assoc();

    if(!$usuario){
        echo json_encode(
            array(
                'codError' => '-2', 
                'error' => 'Usuario no encontrado.'
            )
        );
        die();
    }

    $idUsuarioRegistro =  $usuario['id'];

    $sql = "SELECT * FROM puntos WHERE id_usuario = $idUsuarioRegistro";
    $result = $conn->query($sql);
    $puntos = $result->fetch_assoc();
   
    $puntosCalcular = null;

    if($puntos['puntos'] == null){
        $puntosCalcular = 0;
    }else{
        $puntosCalcular = $puntos['puntos'];
   
    }

    echo json_encode(
        array(
            'id_usuario' => $idUsuario, 
            'progreso' => calcularProgreso($puntosCalcular)
        )
    );


?>