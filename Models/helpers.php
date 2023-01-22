<?php
include_once('./conecion.php');
error_reporting(0);
$_POST = json_decode(file_get_contents("php://input"),true);
$nombre= $_POST["nombre"];
$apellido = $_POST["apellido"];
$telefono = $_POST["telefono"];
$correo = $_POST["email"];

echo $nombre;
$query="INSERT INTO `user`(`iduser`, `nombre`, `apellido`, `telefono`, `correo`) VALUES (null,'$nombre','$apellido','$telefono','$correo')";
$resultado = mysqli_query($cn,$query);
echo $query;