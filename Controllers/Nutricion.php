<?php 
	class Nutricion extends Controllers{
		public function __construct(){   
			session_start();
			parent::__construct();
			
			//getPermisos(MDPAGINAS);
		}

		public function nutricion(){
			$pageContent = getPageRout('nutricion');
			if(empty($pageContent)){
				header("Location: ".base_url());
			}else{
				$data['page_tag'] = NOMBRE_EMPESA;
				$data['page_title'] = NOMBRE_EMPESA." - ".$pageContent['titulo'];
				$data['page_name'] = $pageContent['titulo'];
				$data['page'] = $pageContent;

				if (isset($_GET['p'])) {
					$tempList = [];
					$listIdRespuestas = explode(',', $_GET['p']);
					for ($i=0; $i < count($listIdRespuestas); $i++) { 
						$tempList[] = $this->model->selectPreguntaGET($listIdRespuestas[$i]);
					}
					$data['productos'] = $tempList;
				}

				$data['formulario'] = $this->model->selectFormulario(1);
				$data['preguntas'] = $this->model->selectPreguntasGroupBy($data['formulario']['idformulario']);
				$this->views->getView($this,"nutricion",$data); 
			}

		}

		public function loginUser(){
			//dep($_POST);
			if($_POST){
				if(empty($_POST['txtEmail']) || empty($_POST['txtPassword'])){
					$arrResponse = array('status' => false, 'msg' => 'Error de datos' );
				}else{
					$strUsuario  =  strtolower(strClean($_POST['txtEmail']));
					$strPassword = hash("SHA256",$_POST['txtPassword']);
					$requestUser = $this->model->loginUser($strUsuario, $strPassword);
					if(empty($requestUser)){
						$arrResponse = array('status' => false, 'msg' => 'El usuario o la contraseña es incorrecto.' ); 
					}else{
						$arrData = $requestUser;
						if($arrData['status'] == 1){
							$_SESSION['idUser'] = $arrData['idpersona'];
							$_SESSION['login'] = true;

							$arrData = $this->model->sessionLogin($_SESSION['idUser']);
							sessionUser($_SESSION['idUser']);							
							$arrResponse = array('status' => true, 'msg' => 'ok');
						}else{
							$arrResponse = array('status' => false, 'msg' => 'Usuario inactivo.');
						}
					}
				}
				echo json_encode($arrResponse,JSON_UNESCAPED_UNICODE);
			}
			die();
		}

	}
 ?>
