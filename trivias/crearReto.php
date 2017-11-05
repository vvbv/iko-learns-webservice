<?php 

    include '../config.php';
    header('Content-Type: application/json; charset=ISO-8859-1');

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
    echo json_encode(
                array(
                        'codError' => '0',
                        'error' => 'Reto creado.'
                    )
                );

?>