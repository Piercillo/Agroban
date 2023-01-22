<?php

	class AsesoriasModel extends Mysql
	{
		private $intIdformulariodet;
		private $strNombre;
		private $strDescripcion;
		private $intCodigo;
		private $intCategoriaId;
		private $intPrecio;
		private $intStock;
		private $intStatus;
		private $strRuta;
		private $strImagen;

		private $idformulariodet;
		private $respuesta;
		private $idproducto;

		public function __construct()
		{
			parent::__construct();
		}

		public function selectAsesorias(){
			$sql = "SELECT 	fd.*,
							p.nombre as pregunta,
							f.nombre as formulario,
							'' as producto
					FROM formulariodet fd 
					INNER JOIN formulario f
					ON fd.idformulario = f.idformulario
					INNER JOIN pregunta p
					ON fd.idpregunta = p.idpregunta
					WHERE p.status != 0 ";
					$request = $this->select_all($sql);
			return $request;
		}	

		public function insertAsesoria(string $nombre, string $descripcion, int $codigo, int $categoriaid, string $precio, int $stock, string $ruta, int $status){
			$this->strNombre = $nombre;
			$this->strDescripcion = $descripcion;
			$this->intCodigo = $codigo;
			$this->intCategoriaId = $categoriaid;
			$this->strPrecio = $precio;
			$this->intStock = $stock;
			$this->strRuta = $ruta;
			$this->intStatus = $status;
			$return = 0;
			$sql = "SELECT * FROM producto WHERE codigo = '{$this->intCodigo}'";
			$request = $this->select_all($sql);
			if(empty($request))
			{
				$query_insert  = "INSERT INTO producto(categoriaid,
														codigo,
														nombre,
														descripcion,
														precio,
														stock,
														ruta,
														status) 
								  VALUES(?,?,?,?,?,?,?,?)";
	        	$arrData = array($this->intCategoriaId,
        						$this->intCodigo,
        						$this->strNombre,
        						$this->strDescripcion,
        						$this->strPrecio,
        						$this->intStock,
        						$this->strRuta,
        						$this->intStatus);
	        	$request_insert = $this->insert($query_insert,$arrData);
	        	$return = $request_insert;
			}else{
				$return = "exist";
			}
	        return $return;
		}

		public function updateAsesoria(int $idformulariodet, string $respuesta, string $idproducto, string $status, string $contenido){
			$this->idformulariodet = $idformulariodet;
			$this->respuesta = $respuesta;
			$this->idproducto = $idproducto;
			$this->intStatus = $status;
			$idformulario = 1;
			$idpregunta = 1;
			$return = 0;
			$sql = "SELECT * FROM formulariodet WHERE idformulariodet != '{$this->idformulariodet}' and respuesta = '$this->respuesta'";
			$request = $this->select_all($sql);
			if(empty($request))
			{
				$sql = "UPDATE formulariodet 
						SET respuesta=?,
							idproducto=?,
							status=?,
							idformulario=?,
							idpregunta=?,
							contenido=?
						WHERE idformulariodet = $this->idformulariodet ";
				$arrData = array($this->respuesta,
        						$this->idproducto,
        						$this->intStatus,
        						$idformulario,
        						$idpregunta,
        						$contenido);

	        	$request = $this->update($sql,$arrData);
	        	$return = $request;
			}else{
				$return = "exist";
			}
	        return $return;
		}

		public function selectAsesoria(int $idformulariodet){
			$this->intIdformulariodet = $idformulariodet;
			$sql = "SELECT 	fd.*,
							p.nombre as pregunta,
							f.nombre as formulario,
							'' as producto
					FROM formulariodet fd 
					INNER JOIN formulario f
					ON fd.idformulario = f.idformulario
					INNER JOIN pregunta p
					ON fd.idpregunta = p.idpregunta
					WHERE p.status != 0 AND idformulariodet = $this->intIdformulariodet";

			$request = $this->select($sql);
			return $request;

		}

		public function insertImage(int $idproducto, string $imagen){
			$this->intIdformulariodet = $idproducto;
			$this->strImagen = $imagen;
			$query_insert  = "INSERT INTO imagen(productoid,img) VALUES(?,?)";
	        $arrData = array($this->intIdformulariodet,
        					$this->strImagen);
	        $request_insert = $this->insert($query_insert,$arrData);
	        return $request_insert;
		}

		public function selectImages(int $idproducto){
			$this->intIdformulariodet = $idproducto;
			$sql = "SELECT productoid,img
					FROM imagen
					WHERE productoid = $this->intIdformulariodet";
			$request = $this->select_all($sql);
			return $request;
		}

		public function deleteImage(int $idproducto, string $imagen){
			$this->intIdformulariodet = $idproducto;
			$this->strImagen = $imagen;
			$query  = "DELETE FROM imagen 
						WHERE productoid = $this->intIdformulariodet 
						AND img = '{$this->strImagen}'";
	        $request_delete = $this->delete($query);
	        return $request_delete;
		}

		public function deleteProducto(int $idproducto){
			$this->intIdformulariodet = $idproducto;
			$sql = "UPDATE producto SET status = ? WHERE idproducto = $this->intIdformulariodet ";
			$arrData = array(0);
			$request = $this->update($sql,$arrData);
			return $request;
		}

		public function selectProducto(int $idproducto){
			$this->intIdProducto = $idproducto;
			$sql = "SELECT p.idproducto,
							p.codigo,
							p.nombre,
							p.descripcion,
							p.precio,
							p.stock,
							p.categoriaid,
							c.nombre as categoria,
							p.status
					FROM producto p
					INNER JOIN categoria c
					ON p.categoriaid = c.idcategoria
					WHERE idproducto = $this->intIdProducto";
			$request = $this->select($sql);
			return $request;

		}

		public function insertAsesoriaC(string $idpersona,string $idformulariodet, string $codigo, string $estado, int $status, string $comentario){
			$return = 0;
			$query_insert  = "INSERT INTO asesoria(idpersona,idformulariodet,codigo,estado,status,comentario) 
								  VALUES(?,?,?,?,?,?)";
        	$arrData = array($idpersona,
    						$idformulariodet,
    						$codigo,
    						$estado,
    						$status,
    						$comentario);
        	$request_insert = $this->insert($query_insert,$arrData);
        	$return = $request_insert;
	        return $return;
		}

		public function selectAsesoriasG(){
			$sql = "SELECT 	a.*,
							CONCAT(p.identificacion, ' - ', p.nombres, ' ', p.apellidos) as persona,
							'' as respuestas
					FROM asesoria a
					JOIN persona p ON(p.idpersona = a.idpersona)";

			if($_SESSION['permisos'][14]['rolid'] == 3){
				$sql = "SELECT 	a.*,
							CONCAT(p.identificacion, ' - ', p.nombres, ' ', p.apellidos) as persona,
							'' as respuestas
					FROM asesoria a
					JOIN persona p ON(p.idpersona = a.idpersona) where a.idpersona = ".$_SESSION['idUser'];
			}
					$request = $this->select_all($sql);
			return $request;
		}	

		public function selectAsesoriaG(int $idasesoria){
			$sql = "SELECT 	a.*,
							CONCAT(p.identificacion, ' - ', p.nombres, ' ', p.apellidos) as persona,
							'' as respuestas
					FROM asesoria a
					JOIN persona p ON(p.idpersona = a.idpersona)
					WHERE idasesoria = $idasesoria";

			$request = $this->select($sql);
			return $request;

		}

		public function updateAsesoriaG($idasesoria, $status){
			$idformulario = 1;
			$idpregunta = 1;
			$return = 0;
			$sql = "UPDATE asesoria 
					SET status=?
					WHERE idasesoria = $idasesoria ";
			$arrData = array($status);

        	$request = $this->update($sql,$arrData);
        	$return = $request;
	        return $return;
		}

		public function selectProductoG(int $idformulariodet){
			$sql = "SELECT fd.*, f.nombre as formulario, p.nombre as pregunta FROM formulariodet fd join formulario f on(f.idformulario = fd.idformulario) join pregunta p on(p.idpregunta = fd.idpregunta)
					WHERE fd.idformulariodet = $idformulariodet";
			$request = $this->select($sql);
			return $request;

		}
	}
 ?>