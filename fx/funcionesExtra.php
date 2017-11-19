<?php

function calcularNivel($puntos)
{
    if ($puntos == 0){
        return 0.0;
    }
    return 9*log($puntos);
}

function calcularProgreso($puntos)
{
    $n = calcularNivel($puntos);
    $whole = floor($n);     
    $fraction = $n - $whole; 
    return $fraction;
}

?>