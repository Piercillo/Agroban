<?php 
	require 'Libraries/html2pdf/vendor/autoload.php';
	use Spipu\Html2Pdf\Html2Pdf;
	use Spipu\Html2Pdf\Exception\Html2PdfException;
	use Spipu\Html2Pdf\Exception\ExceptionFormatter;

	class Asesorias extends Controllers{
		public function __construct()
		{   session_start();
			parent::__construct();
			
			if(empty($_SESSION['login']))
			{
				header('Location: '.base_url().'/login');
				die();
			}
			getPermisos(MDASESORIAPREGUNTA);
		}

		public function Asesorias()
		{
			if(empty($_SESSION['permisosMod']['r'])){
				header("Location:".base_url().'/dashboard');
			}
			$data['page_tag'] = "Asesorias";
			$data['page_title'] = "PREGUNTAS NUTRICIONALES <small>Tienda Virtual</small>";
			$data['page_name'] = "asesorias";
			$data['page_functions_js'] = "functions_asesoriap.js?v=5.14";
			$this->views->getView($this,"asesorias",$data);
		}

		public function asesoriasguardadas()
		{
			if(empty($_SESSION['permisosMod']['r'])){
				header("Location:".base_url().'/dashboard');
			}
			$data['page_tag'] = "Asesorias";
			$data['page_title'] = "Asesorías guardadas <small>Tienda Virtual</small>";
			$data['page_name'] = "asesorias";
			$data['page_functions_js'] = "functions_asesoriaguardadas.js?v=0.09";
			$this->views->getView($this,"asesoriasguardadas",$data);
		}

		public function getAsesorias(){
			if($_SESSION['permisosMod']['r']){
				$arrData = $this->model->selectAsesorias();
				for ($i=0; $i < count($arrData); $i++) {
					$btnView = '';
					$btnEdit = '';
					$btnDelete = '';
					if($arrData[$i]['status'] == 1){
						$arrData[$i]['status'] = '<span class="badge badge-success">Activo</span>';
					}else{
						$arrData[$i]['status'] = '<span class="badge badge-danger">Inactivo</span>';
					}
					$productos = json_decode($arrData[$i]['idproducto']);
					$arrProducto = [];
					if(count($productos) > 0){
						for ($j=0; $j < count($productos); $j++) { 
							$arrProducto[] = $this->getProducto($productos[$j]);
						}
					}
					$arrData[$i]['productos'] = $arrProducto;

					if($_SESSION['permisosMod']['u']){
						$btnEdit = '<button class="btn btn-primary btn-sm m-2" onClick="fntEditInfo(this,'.$arrData[$i]['idformulariodet'].')" title="Editar asesoría"><i class="fas fa-pencil-alt"></i></button>';
					}

					

					$arrData[$i]['options'] = '<div class="text-center">'.$btnView.' '.$btnEdit.' '.$btnDelete.'</div>';
				}
				echo json_encode($arrData,JSON_UNESCAPED_UNICODE);
			}
			die();
		}

		public function generarFactura($idasesoria){
			try {
			    ob_start();
			    $dataAsesoria = json_decode($this->getAsesoriaGReturn($idasesoria));
			    //echo json_encode($dataAsesoria->data->respuestas[0]->data->productos[0]->data);
			    $html = getFile("Template/Modals/res/asesoriafact",$dataAsesoria->data);
			    $html2pdf = new Html2Pdf('L', 'A4', 'es', TRUE, 'UTF-8');
			    $html2pdf->setTestTdInOnePage(false);
			    $html2pdf->setDefaultFont('Arial');
			    $html2pdf->writeHTML($html);
			    $html2pdf->output('factura'.uniqid().'.pdf', 'D');
			} catch (Html2PdfException $e) {
			    $html2pdf->clean();

			    $formatter = new ExceptionFormatter($e);
			    echo $formatter->getHtmlMessage();
			}
		}

		public function getAsesoriaGReturn($idasesoria){
			if($_SESSION['permisosMod']['r']){
				$idasesoria = intval($idasesoria);
				if($idasesoria > 0){
					$arrData = $this->model->selectAsesoriaG($idasesoria);
					if(empty($arrData)){
						$arrResponse = array('status' => false, 'msg' => 'Datos no encontrados.');
					}else{
						$respuestas = json_decode($arrData['idformulariodet']);
						/**/
						$arrRespuestas = [];
						if(count($respuestas) > 0){
							for ($i=0; $i < count($respuestas); $i++) { 
								$arrRespuestas[] = $this->getProductoG($respuestas[$i]);
								$productos = json_decode($arrRespuestas[$i]['data']['idproducto']);
								$arrProducto = [];
								if(count($productos) > 0){
									for ($j=0; $j < count($productos); $j++) { 
										$arrProducto[] = $this->getProducto($productos[$j]);
									}
								}
								$arrRespuestas[$i]['data']['productos'] = $arrProducto;
							}
						}
						$arrData['respuestas'] = $arrRespuestas;
						$arrResponse = array('status' => true, 'data' => $arrData);
					}
					return json_encode($arrResponse,JSON_UNESCAPED_UNICODE);
				}
			}
			die();
		}

		public function setAsesoria(){
			if($_POST){
				if(empty($_POST['txtNombre']) || empty($_POST['listCategoria']) )
				{
					$arrResponse = array("status" => false, "msg" => 'Datos incorrectos.');
				}else{
					
					$idformulariodet = ($_POST['idformulariodet']);
					$strNombre = ($_POST['txtNombre']);
					$intCategoriaId = ($_POST['listCategoria2']);
					$intStatus = ($_POST['listStatus']);
					$contenido = ($_POST['contenido']);
					$request_producto = "";
					$ruta = strtolower(clear_cadena($strNombre));
					$ruta = str_replace(" ","-",$ruta);


					if($idformulariodet == 0){
						$option = 1;
						if($_SESSION['permisosMod']['w']){
							$request_producto = $this->model->insertAsesoria($strNombre, 
																		$strDescripcion, 
																		$strCodigo, 
																		$intCategoriaId,
																		$strPrecio, 
																		$intStock, 
																		$ruta,
																		$intStatus );
						}
					}else{
						$option = 2;
						if($_SESSION['permisosMod']['u']){
							$request_producto = $this->model->updateAsesoria($idformulariodet,
																		$strNombre,
																		$intCategoriaId,
																		$intStatus,
																		$contenido);
							
						}
					}
					if($request_producto > 0 )
					{
						if($option == 1){
							$arrResponse = array('status' => true, 'idformulariodet' => $request_producto, 'msg' => 'Datos guardados correctamente.');
						}else{
							$arrResponse = array('status' => true, 'idformulariodet' => $idformulariodet, 'msg' => 'Datos Actualizados correctamente.');
						}
					}else if($request_producto == 'exist'){
						$arrResponse = array('status' => false, 'msg' => '¡Atención! ya existe un producto con el Código Ingresado.');		
					}else{
						$arrResponse = array("status" => false, "msg" => 'No es posible almacenar los datos.');
					}
				}
				echo json_encode($arrResponse,JSON_UNESCAPED_UNICODE);
			}
			die();
		}

		public function getAsesoria($idformulariodet){
			if($_SESSION['permisosMod']['r']){
				$idformulariodet = intval($idformulariodet);
				if($idformulariodet > 0){
					$arrData = $this->model->selectAsesoria($idformulariodet);
					if(empty($arrData)){
						$arrResponse = array('status' => false, 'msg' => 'Datos no encontrados.');
					}else{
						$productos = json_decode($arrData['idproducto']);
						$arrProducto = [];
						if(count($productos) > 0){
							for ($i=0; $i < count($productos); $i++) { 
								$arrProducto[] = $this->getProducto($productos[$i]);
							}
						}
						$arrData['productos'] = $arrProducto;
						$arrResponse = array('status' => true, 'data' => $arrData);
					}
					echo json_encode($arrResponse,JSON_UNESCAPED_UNICODE);
				}
			}
			die();
		}

		public function getProducto($idproducto){
			$idproducto = intval($idproducto);
			if($idproducto > 0){
				$arrData = $this->model->selectProducto($idproducto);
				if(empty($arrData)){
					$arrResponse = array('status' => false, 'msg' => 'Datos no encontrados.');
				}else{
					$arrImg = $this->model->selectImages($idproducto);
					if(count($arrImg) > 0){
						for ($i=0; $i < count($arrImg); $i++) { 
							$arrImg[$i]['url_image'] = media().'/images/uploads/'.$arrImg[$i]['img'];
						}
					}
					$arrData['images'] = $arrImg;
					$arrResponse = array('status' => true, 'data' => $arrData);
				}
				return $arrResponse;
			}
			die();
		}

		public function setImage(){
			if($_POST){
				if(empty($_POST['idformulariodet'])){
					$arrResponse = array('status' => false, 'msg' => 'Error de dato.');
				}else{
					$idformulariodet = intval($_POST['idformulariodet']);
					$foto      = $_FILES['foto'];
					$imgNombre = 'pro_'.md5(date('d-m-Y H:i:s')).'.jpg';
					$request_image = $this->model->insertImage($idformulariodet,$imgNombre);
					if($request_image){
						$uploadImage = uploadImage($foto,$imgNombre);
						$arrResponse = array('status' => true, 'imgname' => $imgNombre, 'msg' => 'Archivo cargado.');
					}else{
						$arrResponse = array('status' => false, 'msg' => 'Error de carga.');
					}
				}
				echo json_encode($arrResponse,JSON_UNESCAPED_UNICODE);
			}
			die();
		}

		public function delFile(){
			if($_POST){
				if(empty($_POST['idformulariodet']) || empty($_POST['file'])){
					$arrResponse = array("status" => false, "msg" => 'Datos incorrectos.');
				}else{
					//Eliminar de la DB
					$idformulariodet = intval($_POST['idformulariodet']);
					$imgNombre  = strClean($_POST['file']);
					$request_image = $this->model->deleteImage($idformulariodet,$imgNombre);

					if($request_image){
						$deleteFile =  deleteFile($imgNombre);
						$arrResponse = array('status' => true, 'msg' => 'Archivo eliminado');
					}else{
						$arrResponse = array('status' => false, 'msg' => 'Error al eliminar');
					}
				}
				echo json_encode($arrResponse,JSON_UNESCAPED_UNICODE);
			}
			die();
		}

		public function delAsesoria(){
			if($_POST){
				if($_SESSION['permisosMod']['d']){
					$intidformulariodet = intval($_POST['idformulariodet']);
					$requestDelete = $this->model->deleteProducto($intidformulariodet);
					if($requestDelete)
					{
						$arrResponse = array('status' => true, 'msg' => 'Se ha eliminado el producto');
					}else{
						$arrResponse = array('status' => false, 'msg' => 'Error al eliminar el producto.');
					}
					echo json_encode($arrResponse,JSON_UNESCAPED_UNICODE);
				}
			}
			die();
		}

		public function saveAsesoria(){
			error_reporting(0);
			if($_POST){
				if(empty($_POST['comentario'])){
					$arrResponse = array("status" => false, "msg" => 'Datos incorrectos.');
				}else{ 
					$idpersona = strClean($_SESSION['userData']['idpersona']);
					$codigo = uniqid();
					$estado = 1;
					$status = 1;
					$comentario = strClean($_POST['comentario']);
					$idformulariodet = ($_POST['idformulariodet']);
					$request_user = $this->model->insertAsesoriaC(
									$idpersona,
									$idformulariodet,
									$codigo, 
									$estado, 
									$status, 
									$comentario);
					$arrResponse = array('status' => true, 'msg' => 'Datos guardados correctamente.');

				}
				echo json_encode($arrResponse,JSON_UNESCAPED_UNICODE);
			}
			die();
		}

		public function getAsesoriasG(){
			if($_SESSION['permisosMod']['r']){
				$arrData = $this->model->selectAsesoriasG();
				for ($i=0; $i < count($arrData); $i++) {
					$btnView = '';
					$btnEdit = '';
					$btnDelete = '';
					if($arrData[$i]['status'] == 1){
						$arrData[$i]['status'] = '<span class="badge badge-success">Activo</span>';
					}else{
						$arrData[$i]['status'] = '<span class="badge badge-danger">Inactivo</span>';
					}
					//$productos = json_decode($arrData[$i]['idproducto']);
					//$arrProducto = [];
					//if(count($productos) > 0){
					//	for ($j=0; $j < count($productos); $j++) { 
					//		$arrProducto[] = $this->getProducto($productos[$j]);
					//	}
					//}
					//$arrData[$i]['productos'] = $arrProducto;
					$respuestas = json_decode($arrData[$i]['idformulariodet']);
					$arrRespuestas = [];
					if(count($respuestas) > 0){
						for ($j=0; $j < count($respuestas); $j++) { 
							$arrRespuestas[] = $this->getProductoG($respuestas[$j]);
						}
					}
					$arrData[$i]['respuestas'] = $arrRespuestas;
					if($_SESSION['permisosMod']['u'] && $_SESSION['permisos'][14]['rolid'] != 3){
						$btnEdit = '<button class="btn btn-primary  m-1 btn-sm" onClick="fntEditInfo(this,'.$arrData[$i]['idasesoria'].')" title="Editar asesoría"><i class="fas fa-pencil-alt"></i></button>';
						$btnEdit .= '<a title="Generar PDF" href="'.base_url().'/asesorias/generarFactura/'.$arrData[$i]['idasesoria'].'" target="_blanck" class="btn btn-danger btn-sm m-1"> <i class="fas fa-file-pdf"></i> </a>';
					}

					$arrData[$i]['options'] = '<div class="text-center">'.$btnView.' '.$btnEdit.' '.$btnDelete.'</div>';
				}
				echo json_encode($arrData,JSON_UNESCAPED_UNICODE);
			}
			die();
		}

		public function getAsesoriaG($idasesoria){
			if($_SESSION['permisosMod']['r']){
				$idasesoria = intval($idasesoria);
				if($idasesoria > 0){
					$arrData = $this->model->selectAsesoriaG($idasesoria);
					if(empty($arrData)){
						$arrResponse = array('status' => false, 'msg' => 'Datos no encontrados.');
					}else{
						$respuestas = json_decode($arrData['idformulariodet']);
						/**/
						$arrRespuestas = [];
						if(count($respuestas) > 0){
							for ($i=0; $i < count($respuestas); $i++) { 
								$arrRespuestas[] = $this->getProductoG($respuestas[$i]);
							}
						}
						$arrData['respuestas'] = $arrRespuestas;
						$arrResponse = array('status' => true, 'data' => $arrData);
					}
					echo json_encode($arrResponse,JSON_UNESCAPED_UNICODE);
				}
			}
			die();
		}

		public function setAsesoriaG(){
			if($_POST){
				if(!isset($_POST['status']) )
				{
					$arrResponse = array("status" => false, "msg" => 'Datos incorrectos.');
				}else{
					
					$idasesoria = ($_POST['idasesoria']);
					$status = ($_POST['status']);
					$request_producto = "";


					if($idasesoria == 0){
						$option = 1;
						if($_SESSION['permisosMod']['w']){
							
						}
					}else{
						$option = 2;
						if($_SESSION['permisosMod']['u']){
							$request_producto = $this->model->updateAsesoriaG($idasesoria,$status);
							
						}
					}
					if($request_producto > 0 )
					{
						if($option == 1){
							$arrResponse = array('status' => true, 'idasesoria' => $request_producto, 'msg' => 'Datos guardados correctamente.');
						}else{
							$arrResponse = array('status' => true, 'idasesoria' => $idasesoria, 'msg' => 'Datos Actualizados correctamente.');
						}
					}else if($request_producto == 'exist'){
						$arrResponse = array('status' => false, 'msg' => '¡Atención! ya existe un producto con el Código Ingresado.');		
					}else{
						$arrResponse = array("status" => false, "msg" => 'No es posible almacenar los datos.');
					}
				}
				echo json_encode($arrResponse,JSON_UNESCAPED_UNICODE);
			}
			die();
		}

		public function getProductoG($idformulariodet){
			$idformulariodet = intval($idformulariodet);
			if($idformulariodet > 0){
				$arrData = $this->model->selectProductoG($idformulariodet);
				if(empty($arrData)){
					$arrResponse = array('status' => false, 'msg' => 'Datos no encontrados.');
				}else{
					$arrResponse = array('status' => true, 'data' => $arrData);
				}
				return $arrResponse;
			}
			die();
		}
	}