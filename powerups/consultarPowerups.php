<?php
    include '../config.php';
    header('Content-Type: application/json; charset=UTF-8');
    
    //muestra todos los valores para un powerups y usuario particular
    
    $id_usuario_facebook = $_GET["id_fb"];
    $id_p = $_GET["id_power"];
    $idUsuario;
    $idPowerEncontrado;

    //verificar
    if(!(isset($_GET["id_fb"]))){
        echo json_encode(
                array(
                        'codError' => '-1',
                        'error' => 'Usuario no definido.'
                    )
                );
        die();
    }

    if(!(isset($_GET['id_power']))){
        echo json_encode(
                array(
                        'codError' => '-1',
                        'error' => 'Powerups no definido.'
                    )
                );
        die();
    }

    // Consulta
    if((isset($_GET['id_fb'])) && (isset($_GET['id_power']))){

        $sql = "SELECT * FROM `usuarios` WHERE `id_facebook` = '$id_usuario_facebook'";

        $result = $conn->query($sql);
        $retorno = $result->fetch_assoc();
        //$returno = $retorno['id'];
        //print_r($returno);

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

        $sql = "SELECT * FROM `powerups` WHERE `id_powerup` = '$id_p'";
        $result = $conn->query($sql);
        $retorno = $result->fetch_assoc();

        if($retorno == null){
            echo json_encode(
                array(
                        'codError' => '-2',
                        'error' => 'Powerups no encontrado.'
                    )
                );
            die();
        }else{
            $idPowerEncontrado = $retorno['id_powerup'];
            
            $sql = "SELECT * FROM `usuarios_powerups` 
                WHERE `user_id`='$idUsuario' and `power_id`='$idPowerEncontrado'";

            $result = $conn->query($sql);
            $retorno = $result->fetch_assoc();
            
            echo json_encode(
                array(
                    'user_id' => $retorno['user_id'],
                    'power_id' => $retorno['power_id'],
                    'fecha' => $retorno['fecha'],
                    'cantidad' => $retorno['cantidad']
                )
            );
            die();
        }
    }
?>