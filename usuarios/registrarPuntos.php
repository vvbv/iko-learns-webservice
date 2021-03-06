<?php
    include '../config.php';
    require '../fx/funcionesExtra.php';
    header('Content-Type: application/json; charset=UTF-8');
    // Consulta
    if(isset($_GET["id_usuario"]) && isset($_GET["puntos"]) && isset($_GET["accion"] )){

        $id_usuario = $_GET["id_usuario"];
        $id_facebook = $_GET["id_usuario"]; // Adaptación temporal de compatibilidad
        $puntos = $_GET["puntos"];// Entero positivo
        $accion = $_GET["accion"];// Sumar o restar

        $sql = "SELECT * FROM `usuarios` WHERE `id_facebook` = '$id_usuario'";
        $result = $conn->query($sql);

        $registro = $result->fetch_assoc();
        if($registro == null){
            
            echo json_encode(
                array(
                        'codError' => '-1',
                        'error' => 'Usuario no encontrado.'
                    )
                );
        }else{

            $id_usuario = $registro['id'];
            
            // Verificamos si el usuario existe en la tabla de puntos
            $result = null;
            $sql = "SELECT * FROM `puntos` WHERE `id_usuario` = '$id_usuario'";
            $result = $conn->query($sql);
            $result = $result->fetch_assoc();
            // Si el usuario existe, pasamos a registrar los puntos
            if($result != null){

                // Suma de puntos
                if($accion == 'sumar'){

                    $sql = "UPDATE `puntos` SET `puntos` = '" . ($result['puntos'] + $puntos) . "' WHERE `id_usuario` = '$id_usuario'";
                    $conn->query($sql);

                /*
                * Si se le van a restar puntos, se hace el primer caso, cuando el
                * jugador tiene más de 0 puntos y la resta de los puntos que posee
                * y los puntos a quitar es mayor que 0, entonces se le quitan los puntos,
                * el segundo caso es cuando la resta de los puntos que posee el jugador
                * y los que se le van a quitar es menor o igual a cero, se establece cero
                * como el límite de menor cantidad de puntos.
                *
                * CASO 1:  25 + 20 = 45
                * CASO 2:  25 - 20 = 5
                * CASO 3:  15 - 20 = 0
                */
                }elseif(($accion == 'restar')&&(($result['puntos'] - $puntos) > 0 )){
                    $sql = "UPDATE `puntos` SET `puntos` = '" . ($result['puntos'] - $puntos) . "' WHERE `id_usuario` = '$id_usuario'";
                    $conn->query($sql);
                }elseif(($accion == 'restar')&&( ($result['puntos'] - $puntos) <= 0 )){
                    $sql = "UPDATE `puntos` SET `puntos` = '0' WHERE `id_usuario` = '$id_usuario'";
                    $conn->query($sql);
                }

            }else{
                /*
                * Si el usuario no existe pero se le van a quitar puntos,
                * se hace el registro con el valor 0
                */
                if($accion == 'restar'){
                    $sql = "INSERT INTO `puntos` (`id_usuario`, `puntos`) VALUES('$id_usuario','0')";
                    $conn->query($sql);

                /*
                * Si el usuario no existe pero se le van a sumar puntos,
                * se hace el registro con el valor de los puntos
                */
                }elseif ($accion == 'sumar') {
                    $sql = "INSERT INTO `puntos` (`id_usuario`, `puntos`) VALUES('$id_usuario','$puntos')";
                    $conn->query($sql);
                }

            }
            $sql = "SELECT * FROM `puntos` WHERE `id_usuario` = '$id_usuario'";
            $result = $conn->query($sql);
            $puntos_usuario = $result->fetch_assoc();

            //Registrador de nivel
            $puntosUsuario = $puntos_usuario['puntos'];
            $nivel = calcularNivel($puntosUsuario);

            $sql = "UPDATE usuarios SET nivel = '$nivel' WHERE id = '$id_usuario'";
            $conn->query($sql);

            echo json_encode(
                array(
                    'id_facebook' => $id_facebook,
                    'puntos' => $puntos_usuario['puntos'],
                    'nivel' => (int) $nivel
                )
            );
        }
    }else{
        echo json_encode(
            array(
                    'codError' => '-1',
                    'error' => 'Necesita proveer id_usuario, cantidad puntos y accion: suma o resta'
                )
            );
    }

?>
