<?php 

	class NutricionModel extends Mysql
	{
		public $intIdcategoria;
		public $strCategoria;
		public $strDescripcion;
		public $intStatus;
		public $strPortada;
		public $strRuta;

		public function __construct()
		{
			parent::__construct();
		}

		public function selectPreguntas($idformulario = 1, $idpregunta = 1)
		{
			$sql = "SELECT fd.*, p.nombre as pregunta FROM formulariodet fd join pregunta p on(p.idpregunta = fd.idpregunta)
					WHERE fd.idformulario = $idformulario ";
			$request = $this->select_all($sql);
			return $request;
		}

		public function selectFormulario(int $idformulario){
			$sql = "SELECT * FROM formulario
					WHERE idformulario = $idformulario";
			$request = $this->select($sql);
			return $request;
		}

		public function selectPreguntasGroupBy(int $idformulario){
			$sql = "SELECT p.idpregunta, p.nombre FROM formulariodet fd join pregunta p on(p.idpregunta = fd.idpregunta)
					WHERE fd.idformulario = $idformulario group by p.idpregunta";
			$preguntas = $this->select_all($sql);
			for ($i=0; $i < count($preguntas) ; $i++) { 
				$preguntas[$i]['respuestas'] = $this->selectPreguntas($idformulario, $preguntas[$i]['idpregunta']);
			}
			return $preguntas;
		}

		public function selectPreguntaGET(int $idformulariodet){
			$sql = "SELECT fd.idproducto, p.nombre, fd.respuesta as pregunta, fd.contenido FROM formulariodet fd join pregunta p on(p.idpregunta = fd.idpregunta)
					WHERE fd.idformulariodet = $idformulariodet";
			$preguntas = $this->select_all($sql);

			for ($i=0; $i < count($preguntas) ; $i++) {
				$listIdProductos = [];
				$listIdProductosTemp = [];
				$listIdProductos = json_decode($preguntas[$i]['idproducto']);
				for ($j=0; $j < count($listIdProductos) ; $j++) { 
					$listIdProductosTemp[] = $this->getProductoIDTGET($listIdProductos[$j]);
				}
				$preguntas[$i]['productos'] = $listIdProductosTemp;
			}

			return $preguntas;
		}

		public function getProductoIDTGET(int $idproducto){
			$this->con = new Mysql();
			$this->intIdProducto = $idproducto;
			$sql = "SELECT p.idproducto,
							p.codigo,
							p.nombre,
							p.descripcion,
							p.categoriaid,
							c.nombre as categoria,
							p.precio,
							p.ruta,
							p.stock
					FROM producto p 
					INNER JOIN categoria c
					ON p.categoriaid = c.idcategoria
					WHERE p.status != 0 AND p.idproducto = '{$this->intIdProducto}' ";
					$request = $this->con->select($sql);
					if(!empty($request)){
						$intIdProducto = $request['idproducto'];
						$sqlImg = "SELECT img
								FROM imagen
								WHERE productoid = $intIdProducto";
						$arrImg = $this->con->select_all($sqlImg);
						if(count($arrImg) > 0){
							for ($i=0; $i < count($arrImg); $i++) { 
								$arrImg[$i]['url_image'] = media().'/images/uploads/'.$arrImg[$i]['img'];
							}
						}else{
							$arrImg[0]['url_image'] = media().'/images/uploads/product.png';
						}
						$request['images'] = $arrImg;
					}
			return $request;
		}

		public function loginUser(string $usuario, string $password)
		{
			$this->strUsuario = $usuario;
			$this->strPassword = $password;
			$sql = "SELECT idpersona,status FROM persona WHERE 
					email_user = '$this->strUsuario' and 
					password = '$this->strPassword' and 
					status != 0 ";
			$request = $this->select($sql);
			return $request;
		}

		public function sessionLogin(int $iduser){
			$this->intIdUsuario = $iduser;
			//BUSCAR ROLE 
			$sql = "SELECT p.idpersona,
							p.identificacion,
							p.nombres,
							p.apellidos,
							p.telefono,
							p.email_user,
							p.nit,
							p.nombrefiscal,
							p.direccionfiscal,
							r.idrol,r.nombrerol,
							p.status 
					FROM persona p
					INNER JOIN rol r
					ON p.rolid = r.idrol
					WHERE p.idpersona = $this->intIdUsuario";
			$request = $this->select($sql);
			$_SESSION['userData'] = $request;
			return $request;
		}

	}
 ?>