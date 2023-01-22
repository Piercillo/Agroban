<?php
    $cn = mysqli_connect('127.0.0.1', 'agrobane_useradmin', "Agrobane2022*", 'agrobane_tvirtual') or die ("No se ha podido conectar al servidor de Base de datos");
    mysqli_set_charset($cn, 'utf8'); 
    header('Access-Control-Allow-Origin: *');   
?> 	