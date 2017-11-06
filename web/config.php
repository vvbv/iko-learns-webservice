<?php

    $servername = "db4free.net";
    $username = "iko_learns_db";
    $password = "iko_learns_db";
    $dbname = "iko_learns_db";

    // Crea la conexión con el servidor MySQL
    $conn = new mysqli($servername, $username, $password, $dbname);
    // Verifica que la conexión esté funcionando
    if ($conn->connect_error) {
        die("Connection failed: " . $conn->connect_error);
    }

?>
