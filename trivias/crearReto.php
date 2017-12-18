<?php 

    //error_reporting(-1);
    //ini_set('display_errors', 'On');

    include '../config.php';
    //header('Content-Type: application/json; charset=ISO-8859-1');
    header('Content-Type: application/json; charset=UTF-8');

    $sql = "";
    
    $idUsuarioRetadorFacebook = $_GET["id_retador"];
    $idUsuarioRetadoFacebook  = $_GET["id_retado"];

    $retadorEncontrado = false;
    $retadoEncontrado = false;

    $idUsuarioRetador;
    $idUsuarioRetado;

    /*
        Verificamos la existencia de los usuarios:

        1. Solo existe el retador, se genera un reto para buscar.
        2. Existe el retador y el retado.

    */
    if(!(isset($_GET["id_retador"]))){
        echo json_encode(
                array(
                        'codError' => '-2',
                        'error' => 'Usuario retador no definido.'
                    )
                );
        die();
    }

    if((isset($_GET["id_retador"])) && (isset($_GET["id_retado"]))){
        if($_GET["id_retador"] == $_GET["id_retado"]){
            echo json_encode(
                    array(
                            'codError' => '-4',
                            'error' => 'No se puede retar a si mismo.'
                        )
                    );
            die();
        }
    }

    if((isset($_GET["id_retador"])) && (isset($_GET["id_retado"]))){

        $sql = "SELECT * FROM `usuarios` WHERE `id_facebook` = '$idUsuarioRetadorFacebook'";
        $result = $conn->query($sql);
        $retorno = $result->fetch_assoc();
        if($retorno == null){
            echo json_encode(
                array(
                        'codError' => '-2',
                        'error' => 'Usuario retador no encontrado.'
                    )
                );
            die();
        }else{
            $retadorEncontrado = true;
            $idUsuarioRetador = $retorno['id'];
        }

        $sql = "SELECT * FROM `usuarios` WHERE `id_facebook` = '$idUsuarioRetadoFacebook'";
        $result = $conn->query($sql);
        $retorno = $result->fetch_assoc();
        if($retorno == null){
            echo json_encode(
                array(
                        'codError' => '-3',
                        'error' => 'Usuario retado no encontrado.'
                    )
                );
            die();
        }else{
            $retadoEncontrado = true;
            $idUsuarioRetado = $retorno['id'];
        }

     }elseif ((isset($_GET["id_retador"])) && !(isset($_GET["id_retado"]))) {
        $sql = "SELECT * FROM `usuarios` WHERE `id_facebook` = '$idUsuarioRetadorFacebook'";
        $result = $conn->query($sql);
        $retorno = $result->fetch_assoc();
        if($retorno == null){
            echo json_encode(
                array(
                        'codError' => '-2',
                        'error' => 'Usuario retador no encontrado.'
                    )
                );
            die();
        }else{
            $retadorEncontrado = true;
            $idUsuarioRetador = $retorno['id'];
        }
     }
    else{
        echo json_encode(
                array(
                        'codError' => '-1',
                        'error' => 'Usuario retador no definido.'
                    )
                );
        die();
    };
   

    if((isset($_GET["id_retador"])) && (isset($_GET["id_retado"])) && $retadorEncontrado && $retadoEncontrado){
        $sql = "INSERT INTO `trivias_retos`(id_usuario_retador, id_usuario_retado) VALUES('$idUsuarioRetador', '$idUsuarioRetado')";
    }elseif ((isset($_GET["id_retador"])) && !(isset($_GET["id_retado"])) && $retadorEncontrado) {
        $sql = "INSERT INTO `trivias_retos`(`id_usuario_retador`) VALUES('$idUsuarioRetador')";
    }else{
        echo json_encode(
                array(
                        'codError' => '-1',
                        'error' => 'Usuario retador no definido.'
                    )
                );
        die();
    }

    $result = $conn->query($sql);
    $idReto = $conn->insert_id;

    $sql = "SELECT * FROM trivias_retos WHERE id = $idReto";
    $result = $conn->query($sql);
    $row = $result->fetch_assoc();

    $idRonda1 = $row['id_ronda_1'];
    $idRonda2 = $row['id_ronda_2'];
    $idRonda3 = $row['id_ronda_3'];
    $idRonda4 = $row['id_ronda_4'];
    $idRonda5 = $row['id_ronda_5'];

    $sql = "SELECT * FROM trivias WHERE id = '$idRonda1'";
    $result = $conn->query($sql);
    $row = $result->fetch_assoc();
    $datosRonda1Array = array_map("utf8_encode", $row );
    $datosRonda1 = json_encode($datosRonda1Array);

    $sql = "SELECT * FROM trivias WHERE id = '$idRonda2'";
    $result = $conn->query($sql);
    $row = $result->fetch_assoc();
    $datosRonda2Array = array_map("utf8_encode", $row );
    $datosRonda2 = json_encode($datosRonda2Array);

    $sql = "SELECT * FROM trivias WHERE id = '$idRonda3'";
    $result = $conn->query($sql);
    $row = $result->fetch_assoc();
    $datosRonda3Array = array_map("utf8_encode", $row );
    $datosRonda3 = json_encode($datosRonda3Array);

    $sql = "SELECT * FROM trivias WHERE id = '$idRonda4'";
    $result = $conn->query($sql);
    $row = $result->fetch_assoc();
    $datosRonda4Array = array_map("utf8_encode", $row );
    $datosRonda4 = json_encode($datosRonda4Array);

    $sql = "SELECT * FROM trivias WHERE id = '$idRonda5'";
    $result = $conn->query($sql);
    $row = $result->fetch_assoc();
    $datosRonda5Array = array_map("utf8_encode", $row );
    $datosRonda5 = json_encode($datosRonda5Array);

    $reto = json_encode(
                array(
                        'codError' => '0',
                        'error' => 'Reto creado.',
                        'idReto' => $idReto,
                        'ronda1' => $datosRonda1Array,
                        'ronda2' => $datosRonda2Array,
                        'ronda3' => $datosRonda3Array,
                        'ronda4' => $datosRonda4Array,
                        'ronda5' => $datosRonda5Array
                )
            );

    echo $reto;

?>