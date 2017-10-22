<?php
    include '../config.php';
    header('Content-Type: text/html; charset=ISO-8859-1');
    // Consulta
    if(isset($_GET["id_fb"])){
        $id_usuario_facebook = $_GET["id_fb"];
        $sql = "SELECT * FROM `usuarios` WHERE `id_facebook` = '$id_usuario_facebook'";
        $result = $conn->query($sql);
        //Manejo de resultados
        $retorno = $result->fetch_assoc();
        if($retorno == null){
            echo json_encode(
                array(
                        'codError' => '-1',
                        'error' => 'Usuario no encontrado.'
                    )
                );
        }else{
            echo json_encode(array('id' => $retorno['id'], 'id_facebook' => $retorno['id_facebook']));
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
