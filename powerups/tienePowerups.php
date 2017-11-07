<?php
    include '../config.php';
    header('Content-Type: application/json; charset=ISO-8859-1');
    
    //verificar si un usuario determinado posee algun tipo de powerups
    //retorno true o false.

    $id_usuario_facebook = $_GET["id_fb"];
    $idUsuario;
    $boleano;

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

    // Consulta
    if((isset($_GET['id_fb']))){

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
            
            $sql = "SELECT * FROM `usuarios_powerups` 
                WHERE `user_id`='$idUsuario'";

            $result = $conn->query($sql);
            $retorno = $result->fetch_assoc();
            
			if($retorno == null){
	            echo json_encode($boleano=False);
	            die();
	        }else{
	            echo json_encode($boleano=True);
	            die();
	        }
    	}
    }
?>