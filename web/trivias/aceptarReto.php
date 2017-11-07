<?php

    include '../config.php';
    header('Content-Type: application/json; charset=ISO-8859-1');

    $idReto = $_GET['id_reto'];
    $idUsuarioFacebook = $_GET['id_usuario'];
    
    $idUsuario;

    if(!(isset($_GET['id_usuario']))){
        echo json_encode(
                array(
                        'codError' => '-1',
                        'error' => 'Usuario no definido.'
                    )
                );
        die();
    }

    if(!(isset($_GET['id_reto']))){
        echo json_encode(
                array(
                        'codError' => '-1',
                        'error' => 'Reto no encontrado.'
                    )
                );
        die();
    }

    if((isset($_GET["id_reto"])) && (isset($_GET["id_usuario"]))){

        $sql = "SELECT * FROM `usuarios` WHERE `id_facebook` = '$idUsuarioFacebook'";
        $result = $conn->query($sql);
        $retorno = $result->fetch_assoc();
        if($retorno == null){
            echo json_encode(
                array(
                        'codError' => '-2',
                        'error' => 'Usuario no encontrado.'
                    )
                );
            die();
        }else{
            $idUsuario = $retorno['id'];
        }

        $sql = "SELECT * FROM `trivias_retos` WHERE `id` = '$idReto'";
        $result = $conn->query($sql);
        $retorno = $result->fetch_assoc();
        if($retorno == null){
            echo json_encode(
                array(
                        'codError' => '-3',
                        'error' => 'Reto no encontrado.'
                    )
                );
            die();
        }elseif($retorno['id_usuario_retado'] != null){
            echo json_encode(
                array(
                        'codError' => '-4',
                        'error' => 'Reto no disponible para ser aceptado.'
                    )
                );
            die();
        }
     }

    $sql = "UPDATE `trivias_retos` SET `id_usuario_retado` = '$idUsuario' WHERE `id` = '$idReto' ";
    $result = $conn->query($sql);
    echo json_encode(
                array(
                        'codError' => '0',
                        'error' => 'Reto aceptado.'
                    )
                );

?>