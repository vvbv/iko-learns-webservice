<?php

    $servername = "localhost";
    $username = "root";
    $password = "Univalle";
    $dbname = "iko";

    // Crea la conexión con el servidor MySQL
    $conn = new mysqli($servername, $username, $password, $dbname);
    // Verifica que la conexión esté funcionando
    if ($conn->connect_error) {
        die("Connection failed: " . $conn->connect_error);
    }

?>
