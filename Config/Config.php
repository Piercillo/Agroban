<?php 
    //const BASE_URL = "http://localhost/tienda_virtual";
	//const BASE_URL = ""; necesito aqui la http
	$root = (isset($_SERVER['HTTPS']) ? "https://" : "http://") . $_SERVER['HTTP_HOST'].str_replace(basename($_SERVER['SCRIPT_NAME']), "", $_SERVER['SCRIPT_NAME']);
	/*echo $root;*/
	define('BASE_URL', $root);
	//Zona horaria
	date_default_timezone_set('America/Guayaquil');

	//Datos de conexión a Base de Datos
	const DB_HOST = "localhost";
	const DB_NAME = "agrobane_tvirtual";
	const DB_USER = "root";
	const DB_PASSWORD = "";
	const DB_CHARSET = "utf8";

	//Para envío de correo
	const ENVIRONMENT = 1; // Local: 0, Produccón: 1;

	//Deliminadores decimal y millar Ej. 24,1989.00
	const SPD = ".";
	const SPM = ",";

	//Simbolo de moneda
	const SMONEY = "$";
	const CURRENCY = "USD";

	//Api PayPal
	//SANDBOX PAYPAL
	const URLPAYPAL = "https://api-m.sandbox.paypal.com";
	const IDCLIENTE = "";
	const SECRET = "";
	//LIVE PAYPAL
	//const URLPAYPAL = "https://api-m.paypal.com";
	//const IDCLIENTE = "";
	//const SECRET = "";

	//Datos envio de correo
	const NOMBRE_REMITENTE = "Agrobana";
	const EMAIL_REMITENTE = "no-reply@abelosh.com";
	const NOMBRE_EMPESA = "Agrobana";
	const WEB_EMPRESA = "www.Agrobana.com";

	const DESCRIPCION = "Productos de alta calidad para mejorar tus sembrios";
	const SHAREDHASH = "AsistenciaTecnica-TiendaVirtual";

	//Datos Empresa
	const DIRECCION = "Juan Montalvo y Av. 8 de Abril, El Triunfo, Ecuador";
	const TELEMPRESA = "+(502)78787845";
	const WHATSAPP = "+593 9978845296";
	const EMAIL_EMPRESA = "Agrobana@gmail.com";
	const EMAIL_PEDIDOS = "Agrobana@gmail.com"; 
	const EMAIL_SUSCRIPCION = "Agrobana@gmail.com";
	const EMAIL_CONTACTO = "Agrobana@gmail.com";

	const CAT_SLIDER = "1,2,3,4";
	const CAT_BANNER = "5,6,7";
	const CAT_FOOTER = "1,2,3,4,5";

	//Datos para Encriptar / Desencriptar
	const KEY = 'abelosh';
	const METHODENCRIPT = "AES-128-ECB";

	//Envío
	const COSTOENVIO = 0;

	//Módulos
	const MDASHBOARD = 1;
	const MUSUARIOS = 2;
	const MCLIENTES = 3;
	const MPRODUCTOS = 4;
	const MPEDIDOS = 5;
	const MCATEGORIAS = 6;
	const MSUSCRIPTORES = 7;
	const MDCONTACTOS = 8;
	const MDPAGINAS = 9;
	const MDNUTRICION = 10;
	const MDCRECIMIENTO = 11;
	const MDFERTILIZACION = 12;
	const MDASESORIAPREGUNTA = 14;

	//Páginas
	const PINICIO = 1;
	const PTIENDA = 2;
	const PCARRITO = 3;
	const PNOSOTROS = 4;
	const PCONTACTO = 5;
	const PPREGUNTAS = 6;
	const PTERMINOS = 7;
	const PSUCURSALES = 8;
	const PERROR = 9;
	const PNUTRICION = 10;
	const PCRECIMIENTO = 11;
	const PFERTILIZACION = 12;

	//Roles
	const RADMINISTRADOR = 1;
	const RSUPERVISOR = 2;
	const RCLIENTES = 3;

	const STATUS = array('Completo','Aprobado','Cancelado','Reembolsado','Pendiente','Entregado');

	//Productos por página
	const CANTPORDHOME = 4;
	const PROPORPAGINA = 12;
	const PROCATEGORIA = 12;
	const PROBUSCAR = 12;

	//REDES SOCIALES
	const FACEBOOK = "";
	const INSTAGRAM = "";
	

 ?>