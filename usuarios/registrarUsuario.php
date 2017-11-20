<?php
    include '../config.php';
    header('Content-Type: application/json; charset=ISO-8859-1');

    if(isset($_GET["id_fb"])){
        $id_usuario_facebook = $_GET["id_fb"];
        $username = $_GET["username"];
        $nombres = $_GET["nombres"];
        $apellidos = $_GET["apellidos"];
        $password = $_GET["password"];
        $nivel =  $_GET["nivel"];

        $sql="SELECT * FROM usuarios WHERE id_facebook = '$id_usuario_facebook'";
        $result = $conn->query($sql);
        if($result->fetch_assoc() != null){
            echo json_encode(
                array(
                    'codError' => '-2',
                    'error' => 'El usuario ya existe.'
                )
             );
             exit();
        }

        $sql="SELECT * FROM usuarios WHERE username = '$username'";
        $result = $conn->query($sql);
        if($result->fetch_assoc() != null){
            echo json_encode(
                array(
                    'codError' => '-2',
                    'error' => 'El username ya existe.'
                )
             );
             exit();
        }

        $sql = "INSERT INTO `usuarios` VALUES (NULL, '$id_usuario_facebook', '$username', '$nombres', '$apellidos', '$password', '$nivel', NOW())";
        $result = $conn->query($sql);
        //Manejo de resultados
        if ($result){
            $sql = "SELECT LAST_INSERT_ID() AS id";
            $result = $conn->query($sql);
            $retorno = $result->fetch_assoc();
            if($retorno == null){
                echo json_encode(
                    array(
                            'codError' => '-3',
                            'error' => 'No se pudo obtener el id generado.'
                        )
                    );
            }else{
                echo json_encode(array('id' => $retorno['id']));
            }
        }else{
            echo json_encode(
                array(
                        'codError' => '-2',
                        'error' => 'Usuario no registrado.'
                    )
                );
        }

    }else{
        echo json_encode(
            array(
                    'codError' => '-1',
                    'error' => 'Identificación de Facebook ausente'
                )
            );
    }

?>
