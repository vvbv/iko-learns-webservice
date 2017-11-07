<?php
    include '../config.php';
    //header('Content-Type: application/json; charset=ISO-8859-1');

  	if(isset($_GET["id_usuario"]) && isset($_GET["cantidad"]) && isset($_GET["accion"])
  		&& isset($_GET["id_power"] )) {

  		

        $id_usuario = $_GET["id_usuario"];
        $cantidad = $_GET["cantidad"];// Entero positivo
        $accion = $_GET["accion"];// Sumar o restar
        $id_power = $_GET["id_power"];//cual powerups

        $sql = "SELECT * FROM `usuarios` WHERE `id_facebook` = '$id_usuario'";
        $result = $conn->query($sql);
        $result = $result->fetch_assoc();

        if($result == null){
            echo json_encode(
                array(
                        'codError' => '-1',
                        'error' => 'Usuario no encontrado.'
                    )
                );
        }
        else{
        	$returno_id_user = $result['id'];

            // Verificamos si el usuario existe en la tabla usuarios_powerups y tiene ese powerups
            $sql = "SELECT * FROM `usuarios_powerups` WHERE `user_id` = '$returno_id_user' 
            			and `power_id` = '$id_power'";
         
            // Si el usuario existe y tiene de ese power, pasamos a registrar los powerups
            if($result != null){

                // Suma de cantidad
                if($accion == 'sumar'){
                    $sql = "UPDATE `usuarios_powerups` 

                    SET `cantidad`='".($result['cantidad'] + $cantidad).
                    "' WHERE `power_id` = '$id_power'";
                    //"' WHERE `user_id` = '$returno_id_user'" AND `power_id` = '$id_power'";
                    $conn->query($sql);

                }/*
                elseif(($accion == 'restar')&&(($result['cantidad'] - $cantidad) > 0 )){
                    $sql = "UPDATE `usuarios_powerups` SET `cantidad` = '" . ($result['cantidad'] - $cantidad) . "' WHERE `user_id` = '$returno_id_user'";
                    $conn->query($sql);

                }elseif(($accion == 'restar')&&( ($result['cantidad'] - $cantidad) <= 0 )){
                    $sql = "UPDATE `usuarios_powerups` 
                    SET `cantidad` = '0' WHERE `user_id` = '$returno_id_user'";
                    $conn->query($sql);
                }*/
				
            }else{/*
            	echo "entro a null";
                
                // Si el usuario no existe pero se le van a quitar cantidad,
                // se hace el registro con el valor 0
                //
                if($accion == 'restar'){
                    $sql = "INSERT INTO `cantidad` (`id_usuario`, `cantidad`) VALUES('$id_usuario','0')";
                    $conn->query($sql);

                
                // Si el usuario no existe pero se le van a sumar cantidad,
                // se hace el registro con el valor de los cantidad
                //
                }elseif ($accion == 'sumar') {
                    $sql = "INSERT INTO `cantidad` (`id_usuario`, `cantidad`) VALUES('$id_usuario','$cantidad')";
                    $conn->query($sql);
                }*/
				
            }
            //echo "entro a aqudfi".$returno_id_user."-".$id_power;
/*
            $sql = "SELECT * FROM `usuarios_powerups
            	` WHERE `user_id` = '$returno_id_user' and `power_id` = '$id_power'";

            $result = $conn->query($sql);
            $cantidad_usuario = $result->fetch_assoc();
            echo json_encode(array('cantidad' => $cantidad_usuario['cantidad']));
            die();*/
        }
    	
    }else{
        echo json_encode(
            array(
                    'codError' => '-1',
                    'error' => 'Necesita proveer id_usuario, cantidad,accion: suma o resta y id_powerup'
                )
            );
        die();
    }
?>