<?php
    include '../config.php';
    header('Content-Type: application/json; charset=ISO-8859-1');

    $idFacebook = $_GET['id_facebook'];

    if(isset($_GET['id_facebook'])){

        $sql="SELECT * FROM usuarios WHERE id_facebook = $idFacebook";
        $result = $conn->query($sql);

        if($result->fetch_assoc() == null){
            $sql="INSERT INTO `usuarios`(id_facebook) VALUES('$idFacebook')";
            $result = $conn->query($sql);
           
            echo json_encode(
               array(
                   'codError' => '0',
                   'error' => 'Usuario registrado.'
               )
            );
        }else{
            echo json_encode(
                array(
                    'codError' => '-2',
                    'error' => 'El usuario ya existe.'
                )
             );
        }
        
    }else{
        echo json_encode(
            array(
                'codError' => '-1',
                'error' => 'id_facebook no definido.'
            )
        );
    }

?>

